# encoding: UTF-8

require 'date'
require 'cor1440_gen/concerns/controllers/proyectosfinancieros_controller'

module Cor1440Gen
  class ProyectosfinancierosController < ::Heb412Gen::ModelosController
    helper ::ApplicationHelper
    include ::ApplicationHelper
    include ::Cor1440Gen::Concerns::Controllers::ProyectosfinancierosController
    include ::Sip::ModeloHelper

    before_action :set_proyectofinanciero, 
      only: [:show, :edit, :update, :destroy]
    skip_before_action :set_proyectofinanciero, only: [:validar]  

    load_and_authorize_resource  class: Cor1440Gen::Proyectofinanciero,
      only: [:new, :create, :destroy, :edit, :update, :index, :show,
             :objetivospf, :actualizaind]

    include ::Sip::ConsultasHelper

    # API
    # calcduracion fechaini fechacierre
    # Retorna cadena con duracion
    def duracion
      prob = ''
      if params[:fechainicio_localizada] && 
        params[:fechacierre_localizada]
        fini = ::Sip::FormatoFechaHelper.fecha_local_estandar(
          params[:fechainicio_localizada])
        fini = Date.strptime(fini, '%Y-%m-%d')
        fcierre = ::Sip::FormatoFechaHelper.fecha_local_estandar(
          params[:fechacierre_localizada])
        fcierre = Date.strptime(fcierre, '%Y-%m-%d')
        if fini && fcierre
          d = LibMisc.dif_meses_dias(fini, fcierre)
          respond_to do |format|
            format.json { 
              render json: {duracion: d.to_s}, status: :ok
              return
            }
          end
        else
          prob = 'No pudo convertirse una de las fechas'
        end
      else
        prob = 'Indispensables parametros fechaini_localizada y fechacierre_localizada'
      end
      respond_to do |format|
        format.html { render action: "error" }
        format.json { render json: prob, 
                      status: :unprocessable_entity 
        }
      end
    end

 
    def self.cadena_muchos(r, campo, sep = ', ', camponom='nombre')
        if !r.send(campo)
          return ""
        end
        return r.send(campo).inject('') { |memo, i|
          (memo == '' ? '' : memo + sep) + i.send(camponom)
        }
    end

    def atributos_index
      [ "id", 
        "referenciacinep",
        "nombre",
      ] +
        [ :financiador_ids =>  [] ] +
        [ "fechaformulacion_localizada",
          "fechainicio_localizada",
          "fechacierre_localizada"
      ] +
        [ :grupo_ids =>  [] ] +
        [ 
          "respgp_id",
          "respgp2_id",
          "estado",
          "monto_localizado",
        ] 
    end

    def atributos_show
      ats = [ 
        "referenciacinep",
        "nombre",
        "referencia", 
      ] +
      [ :financiador_ids =>  [] ] +
      [ "fuentefinanciador", 
        "fechainicio_localizada",
        "fechacierre_localizada",
        "duracion",
        "anioformulacion",
        "mesformulacion",
        "fechaliquidacion_localizada",
        "fechaaprobacion_localizada",
        "anotacionesdb",
        "estado",
        "dificultad",
        "observacionestramite",
        "observacionesejecucion",
        "observacionescierre" 
      ] +
      [ :grupo_ids =>  [] ] +
      [ "coordinador_proyectofinanciero",
        "proyectofinanciero_uresponsable",
        "proyectofinanciero_usuario",
        "respgp",
        "respgp2",
        "anotacionesrh",
        "tipomoneda",
        "presupuesto",
        "aaportes",
        "acuse",
        "reportarrendimientosfinancieros",
        "reinvertirrendimientosfinancieros",
        "autenticarcompulsar",
        "desembolso",
        "anotacionesre",
        "informenarrativo",
        "informefinanciero",
        "productopf",
        "informeevaluacion",
        "informeauditoria",
        "empresaauditoria",
        "anotacionesinf",
        "centrocosto",
        "copiasdesoporte",
        "cuentasbancarias",
        "saldo_localizado",
        "gestiones",
        "anotacionescontab"]

      if can?(:manage, @registro)
        ats += ["respagencia",
                "emailrespagencia",
                "telrespagencia"]
      end

      ats += ["observaciones",
              'marcologico',
              "anexo_proyectofinanciero"
      ]
    end

    def vistas_manejadas
      ['Compromiso Institucional', 
       'Cuadro General de Seguimiento', 
       'Cronograma de Solicitud de Informes']
    end

    def show_plantillas
      @plantillas = [['', '']]
      @plantillas = ::Heb412Gen::Plantilladoc.where(
        "vista IN ('Compromiso Institucional')").
      select('nombremenu, id').map { 
          |co| [co.nombremenu, "#{co.id}.odt"] 
        }
    end

    def new
      new_cor1440_gen
      @registro.montopesos = 1
      @registro.presupuestototal = 1
      @registro.tipomoneda = ::Tipomoneda.where(codiso4217: 'COP').take
      #@registro.tasacambio = 1
      @registro.fechaformulacion = Date.today
      @registro.dificultad = 'M'
      if can?(:creacomogp, ::Cor1440Gen::Proyectofinanciero)
        @registro.respgp_id = current_usuario.id
      end
      @registro.save!
      redirect_to cor1440_gen.edit_proyectofinanciero_path(@registro)
      #render 'edit', layout: 'application'
    end

    def validar_filtramas
      if params && params[:validarpf] && 
        params[:validarpf][:respgp_id] &&
        params[:validarpf][:respgp_id] != ''
        @validarpf.respgp_id = params[:validarpf][:respgp_id].to_i
        @registro = @registro.where(respgp_id: @validarpf.respgp_id)
      end
    end

    def validar_mas_registro(registro, detalle)

      # Para proyectos con responsable en gerencia de proyectos,
      # los grupos deben limitarse a las líneas.
    
      if registro.respgp_id
        if registro.grupo.length == 0
          detalle << "Falta línea de investigación"
        else
          registro.grupo.each do |g|
            if !::Sip::Grupo.investigacion.map(&:id).include?(g.id)
              detalle << "Proyecto manejado por oficial de proyectos que tiene grupos diferentes a las líneas de investigación"
            end
          end
        end
      end
     
      # Recursos económicos en formulación
      tasaf = 0
      if !registro.tasa 
        detalle << "Falta tasa de formulación"
      elsif registro.tasa <= 0
        detalle << "Tasa de formulación ≤ 0"
      else
        tasaf = registro.tasa
      end
      montof = 0
      if !registro.monto 
        detalle << "Falta Aporte financiador en moneda durante formulación"
      elsif registro.monto < 0
        detalle << "Aporte financiador en moneda durante formulación < 0"
      else 
        montof = registro.monto
      end
      if !registro.montopesos 
        detalle << "Falta Aporte financiador en pesos durante formulación"
      end
      if registro.montopesos != tasaf * montof
        detalle << "Aporte financiador en pesos durante formulación no corresponde a conversioń"
      end
      pt = montof
      if !registro.aportecinep 
        detalle << "Falta aporte CINEP/PPP en moneda durante formulación"
      elsif registro.aportecinep < 0 
        detalle << "Aporte CINEP/PPP en moneda durante formulación < 0"
      else
        pt += registro.aportecinep
      end
      if !registro.aotrosfin 
        detalle << "Falta aporte de otros donantes durante formulación"
      elsif registro.aotrosfin < 0 
        detalle << "Aporte de otros donantes en moneda durante formulación < 0"
      else
        pt += registro.aotrosfin
      end
      if !registro.saldo 
        detalle << "Falta Saldo en moneda durante formulación"
      elsif registro.saldo < 0 
        detalle << "Saldo en moneda durante formulación < 0"
      else
        pt += registro.saldo
      end
      if !registro.presupuestototal
        detalle << "Falta presupuesto total en moneda durante formulación"
      elsif registro.presupuestototal != pt
        detalle << "Presupuesto total en moneda durante formulación no corresponde a suma de los valores en formulación"
      end

      # Recursos económicos en ejecución
      if !registro.tasaej
        detalle << "Falta tasa de ejecución"
      elsif registro.tasaej <= 0
        detalle << "Tasa de ejecución ≤ 0"
      end
      montoej = 0
      if !registro.montoej
        detalle << "Falta Aporte financiador en moneda durante ejecución"
      elsif registro.montoej < 0
        detalle << "Aporte financiador en moneda durante ejecución < 0"
      else 
        montoej = registro.montoej
      end
      pe = montoej
      if !registro.aportecinepej
        detalle << "Falta aporte CINEP/PPP en moneda durante ejecución"
      elsif registro.aportecinepej < 0 
        detalle << "Aporte CINEP/PPP en moneda durante ejecución < 0"
      else
        pe += registro.aportecinepej
      end
      if !registro.aporteotrosej
        detalle << "Falta aporte de otros donantes durante ejecución"
      elsif registro.aporteotrosej < 0 
        detalle << "Aporte de otros donantes en moneda durante ejecución < 0"
      else
        pt += registro.aporteotrosej
      end
      if !registro.saldoej 
        detalle << "Falta Saldo en moneda durante ejecución"
      elsif registro.saldoej < 0 
        detalle << "Saldo en moneda durante ejecución < 0"
      else
        pt += registro.saldoej
      end
      if !registro.presupuestototalej
        detalle << "Falta presupuesto total en moneda durante ejecución"
      elsif registro.presupuestototalej != pt
        detalle << "Presupuesto total en moneda durante ejecución no corresponde a suma de los valores en ejecución"
      end

    end


    def validar_registro(registro, detalle)
      detalleini = detalle.clone
      if !registro.fechainicio && 
        ::ApplicationHelper::ESTADOS_APROBADO.include?(registro.estado)
        detalle << "No tiene fecha de inicio"
      elsif registro.fechainicio && registro.fechainicio < Date.new(2000, 1, 1)
        detalle << "Fecha de inicio anterior al 1.Ene.2000"
      end
      if !registro.fechacierre && 
        ::ApplicationHelper::ESTADOS_APROBADO.include?(registro.estado)
        detalle << "No tiene fecha de terminación"
      elsif registro.fechacierre && registro.fechainicio &&
        registro.fechacierre <= registro.fechainicio
        detalle << "Fecha de terminación posterior o igual a la de inicio"
      end
      validar_mas_registro(registro, detalle)
      return detalleini == detalle
    end

    def self.vista_solicitud_informes(registros)
      cons = ""
      pre = ""
      [['informenarrativo','INFORME NARRATIVO'], 
       ['informefinanciero', 'INFORME FINANCIERO'],
       ['informeauditoria', 'INFORME DE AUDITORÍA']].each do |i|
        cons += pre 
        cons += "SELECT proyectofinanciero_id, fechaplaneada, fechareal, 
          devoluciones,
          '#{i[1]}: ' || detalle as observaciones, seguimiento
          FROM #{i[0]}"
        pre = " UNION "
      end

      cons += pre 
      cons += "SELECT proyectofinanciero_id, fechaplaneada, fechareal, 
        devoluciones,
        tipoproductopf.nombre || ': ' || detalle as observaciones, 
        seguimiento
        FROM productopf JOIN tipoproductopf
        ON productopf.tipoproductopf_id=tipoproductopf.id"
      
      w = registros.count > 0 ?  
        "WHERE p.id in (#{registros.pluck(:id).join(", ")})" : ""

      ::Heb412Gen::Plantillahcm.connection.execute <<-SQL
      DROP VIEW IF EXISTS v_solicitud_informes ;
      DROP VIEW IF EXISTS v_solicitud_informes1 ;
      CREATE VIEW v_solicitud_informes1 AS (#{cons});
      CREATE VIEW v_solicitud_informes AS (
      SELECT p.id AS compromiso_id, p.referenciacinep AS titulo, 
      ARRAY_TO_STRING(ARRAY(SELECT sip_persona.nombres || ' ' || 
        sip_persona.apellidos FROM sip_persona 
        JOIN usuario ON sip_persona.id=usuario.persona_id 
        JOIN coordinador_proyectofinanciero 
        ON usuario.id=coordinador_proyectofinanciero.coordinador_id
        WHERE proyectofinanciero_id=p.id), ', ') AS coordinador,
      ARRAY_TO_STRING(ARRAY(SELECT sip_persona.nombres || ' ' || 
        sip_persona.apellidos FROM sip_persona
        JOIN usuario ON sip_persona.id=usuario.persona_id 
        JOIN proyectofinanciero_uresponsable
        ON usuario.id=proyectofinanciero_uresponsable.uresponsable_id
        WHERE proyectofinanciero_id=p.id), ', ') AS responsable,
      fechaplaneada, fechareal,
      CASE WHEN devoluciones THEN 'SI' 
        WHEN devoluciones IS NULL THEN '' 
        ELSE 'NO' END AS devoluciones,
      s.observaciones as observaciones, seguimiento, 
      CASE WHEN fechareal<=(fechaplaneada+7) THEN 'SI'
        WHEN fechareal>(fechaplaneada+7) THEN 'NO'
        WHEN fechareal IS NULL AND CURRENT_DATE>(fechaplaneada+7) THEN 'NO'
        ELSE '' END AS a_tiempo
      FROM cor1440_gen_proyectofinanciero AS p
      JOIN v_solicitud_informes1 AS s
      ON p.id=s.proyectofinanciero_id
      #{w}
      ORDER BY s.fechaplaneada
      )
      SQL
      return ::Heb412Gen::Plantillahcm.find_by_sql(
        'SELECT * FROM v_solicitud_informes')
    end

    def self.asigna_celda_y_borde(hoja, fila, col, valor)
        hoja[fila, col] = valor
        hoja.cell(fila, col).format.top.style = 'solid'
        hoja.cell(fila, col).format.bottom.style = 'solid'
        hoja.cell(fila, col).format.right.style = 'solid'
        hoja.cell(fila, col).format.left.style = 'solid'
    end

    
    def self.tramitado_anio(registros, hoja, anio)
      hoja.name = "Tramitados #{anio}"
      reg = registros.where("fechaformulacion>='#{anio.to_i}-01-01' AND " +
                             "fechaformulacion<='#{anio.to_i}-12-31'").
        reorder('fechaformulacion, referenciacinep')
      fila = 2
      cons = 1
      reg.each do |r|
        asigna_celda_y_borde(hoja, fila, 1, cons)
        mf = r.fechaformulacion ?
          r.fechaformulacion_localizada[3..5] : ''
        asigna_celda_y_borde(hoja, fila, 2, mf)
        asigna_celda_y_borde(hoja, fila, 3, r.referenciacinep)
        asigna_celda_y_borde(hoja, fila, 4, 
                             cadena_muchos(r, 'financiador', ' - '))
        asigna_celda_y_borde(hoja, fila, 5, 
                             ::ApplicationHelper::ESTADOS_APROBADO.
                             include?(
                               r.estado.to_sym) ? 'APROBADO' : 
                               ::Sip::ModeloHelper.etiqueta_coleccion(
                                 ::ApplicationHelper::ESTADO, r.estado))
        asigna_celda_y_borde(hoja, fila, 6, r.monto_localizado)
        asigna_celda_y_borde(hoja, fila, 7, r.tipomoneda ?
                             r.tipomoneda.codiso4217 : '')
        asigna_celda_y_borde(hoja, fila, 8, 
                             r.montopesos_localizado)
        asigna_celda_y_borde(hoja, fila, 9, 
                             cadena_muchos(r, 'grupo', '; '))
        asigna_celda_y_borde(hoja, fila, 10, r.observacionestramite)

        cons +=1
        fila +=1
      end
    end


    def self.cuadro_general_seguimiento(plant, registros, narch, parsimp, extension)
      ruta = File.join(Rails.application.config.x.heb412_ruta, 
                       plant.ruta).to_s
      puts "ruta=#{ruta}"
      libro = Rspreadsheet.open(ruta)

      # Hoja Resumen
      hoja = libro.worksheets(1)
      fila = 2
      reg = registros.where("estado IN ('C', 'E', 'J', 'K', 'M')").
        reorder([:referenciacinep, :id])
      cons = 1
      reg.each do |r|
        asigna_celda_y_borde(hoja, fila, 1, cons)
        asigna_celda_y_borde(hoja, fila, 2, r.referenciacinep)
        asigna_celda_y_borde(hoja, fila, 3, 
                             cadena_muchos(r, 'financiador', ' - '))
        asigna_celda_y_borde(hoja, fila, 4, r.respgp ?
                             r.respgp.presenta_nombre : '')
        asigna_celda_y_borde(hoja, fila, 5, 
                             ::Sip::ModeloHelper.etiqueta_coleccion(
                               ::ApplicationHelper::ESTADO, r.estado))
        asigna_celda_y_borde(hoja, fila, 6, 
                             ::Sip::ModeloHelper.etiqueta_coleccion(
                               ::ApplicationHelper::DIFICULTAD, 
                               r.dificultad))
        cons +=1
        fila +=1
      end

      FileUtils.mv(narch + "#{extension}-0", narch + "#{extension}-15")
      # Hoja En tramite
      hoja = libro.worksheets(2)
      fila = 2
      reg = registros.where("estado IN ('E')").
        reorder([:referenciacinep, :id])
      cons = 1
      reg.each do |r|
        asigna_celda_y_borde(hoja, fila, 1, cons)
        asigna_celda_y_borde(hoja, fila, 2, r.referenciacinep)
        asigna_celda_y_borde(hoja, fila, 3, 
                             cadena_muchos(r, 'financiador', ' - '))
        gp = r.respgp ? "GP: " + r.respgp.presenta_nombre : ""
        ao = cadena_muchos(r, 'uresponsable', ', ', 'presenta_nombre')
        if ao != ''
          ao = "; AO: #{ao}"
        end
        asigna_celda_y_borde(hoja, fila, 4, "#{gp}#{ao}")
        asigna_celda_y_borde(hoja, fila, 5, cadena_muchos(
          r, 'usuario', ', ', 'presenta_nombre'))
        asigna_celda_y_borde(hoja, fila, 6, r.monto_localizado)
        asigna_celda_y_borde(hoja, fila, 7, r.tipomoneda ?
                             r.tipomoneda.codiso4217 : '')
        asigna_celda_y_borde(hoja, fila, 8, 
                             r.montopesos_localizado)
        duryf = r.fechacierre && r.fechainicio ?
          (LibMisc.dif_meses_dias(r.fechainicio, r.fechacierre) + 
           ' - ' + r.fechainicio_localizada) : ''
        asigna_celda_y_borde(hoja, fila, 9, duryf)
        asigna_celda_y_borde(hoja, fila, 10, r.observacionestramite)
        mf = r.fechaformulacion ?
          r.fechaformulacion_localizada[3..-1] : ''
        asigna_celda_y_borde(hoja, fila, 11, mf)

        cons +=1
        fila +=1
      end

      FileUtils.mv(narch + "#{extension}-15", narch + "#{extension}-30")
      # Hoja Ejecucion
      hoja = libro.worksheets(3)
      fila = 2
      reg = registros.where("estado IN ('J')").
        reorder([:referenciacinep, :id])
      cons = 1
      reg.each do |r|
        asigna_celda_y_borde(hoja, fila, 1, cons)
        asigna_celda_y_borde(hoja, fila, 2, r.referenciacinep)
        asigna_celda_y_borde(hoja, fila, 3, r.referencia)
        asigna_celda_y_borde(hoja, fila, 4, r.nombre)
        asigna_celda_y_borde(hoja, fila, 5, 
                             cadena_muchos(r, 'financiador', ' - '))
        asigna_celda_y_borde(hoja, fila, 6, r.respgp ?
                             r.respgp.presenta_nombre : '')
        asigna_celda_y_borde(hoja, fila, 7, r.observacionesejecucion)
        asigna_celda_y_borde(hoja, fila, 8, 
                             cadena_muchos(r, 'grupo', '; '))

        cons +=1
        fila +=1
      end

      FileUtils.mv(narch + "#{extension}-30", narch + "#{extension}-45")
      # Hoja En cierre
      hoja = libro.worksheets(4)
      fila = 2
      reg = registros.where("estado IN ('C')").
        reorder([:referenciacinep, :id])
      cons = 1
      reg.each do |r|
        asigna_celda_y_borde(hoja, fila, 1, cons)
        asigna_celda_y_borde(hoja, fila, 2, r.referenciacinep)
        asigna_celda_y_borde(hoja, fila, 3, r.referencia)
        asigna_celda_y_borde(hoja, fila, 4, r.objeto)
        asigna_celda_y_borde(hoja, fila, 5, 
                             cadena_muchos(r, 'financiador', ' - '))
        asigna_celda_y_borde(hoja, fila, 6, r.respgp ? 
                             r.respgp.presenta_nombre : '')
        asigna_celda_y_borde(hoja, fila, 7, r.observacionescierre)
        asigna_celda_y_borde(hoja, fila, 8, 
                             cadena_muchos(r, 'grupo', '; '))
        cons +=1
        fila +=1
      end

      FileUtils.mv(narch + "#{extension}-45", narch + "#{extension}-60")
      # Hoja Tramitados del año actual
      treste = libro.worksheets(5)
      anio = Date.today.year
      tramitado_anio(registros, treste, anio)

      # Hoja de convenios institucionales
      hoja = libro.worksheets(6)
      fila = 2
      reg = ::Convenio.all
      if parsimp[:busfechainicio_ini]
        reg = reg.filtro_fechainicio_localizadaini(
          parsimp[:busfechainicio_ini])
      end
      if parsimp[:busfechainicio_fin]
        reg = reg.filtro_fechainicio_localizadafin(
          parsimp[:busfechainicio_fin])
      end
      if parsimp[:busfechacierre_ini]
        reg = reg.filtro_fechacierre_localizadaini(
          parsimp[:busfechacierre_ini])
      end
      if parsimp[:busfechacierre_fin]
        reg = reg.filtro_fechacierre_localizadafin(
          parsimp[:busfechacierre_fin])
      end

      cons = 1
      reg.each do |r|
        asigna_celda_y_borde(hoja, fila, 1, cons)
        asigna_celda_y_borde(hoja, fila, 2, r.clasificacion ? 
                             r.clasificacion : '')
        asigna_celda_y_borde(hoja, fila, 3, r.institucion)
        asigna_celda_y_borde(hoja, fila, 4, r.tipoconvenio_id ?
                             r.tipoconvenio.nombre : '')
        asigna_celda_y_borde(hoja, fila, 5, r.descripcion)
        asigna_celda_y_borde(hoja, fila, 6, r.fechainicio)
        asigna_celda_y_borde(hoja, fila, 7, LibMisc.dif_meses_dias(
          r.fechainicio, r.fechacierre))
        cons +=1
        fila +=1
      end


      FileUtils.mv(narch + "#{extension}-60", narch + "#{extension}-75")

      # Hoja de publicaciones
      hoja = libro.worksheets(7)
      fila = 2
      reg = registros.where("estado IN ('C', 'J', 'K', 'M')")
      ppf = ::Productopf.where(proyectofinanciero_id: reg.map(&:id)).
        joins(:proyectofinanciero)
     
      cons = 1
      ppf.each do |r|
        asigna_celda_y_borde(hoja, fila, 1, cons)
        asigna_celda_y_borde(hoja, fila, 2, r.proyectofinanciero.referenciacinep)
        asigna_celda_y_borde(hoja, fila, 3, 
                             cadena_muchos(r.proyectofinanciero, 
                                           'coordinador', ', ', 
                                           'presenta_nombre'))
        asigna_celda_y_borde(hoja, fila, 4, 
                             cadena_muchos(r.proyectofinanciero, 
                                           'financiador', ' - '))
        asigna_celda_y_borde(hoja, fila, 5, r.proyectofinanciero.referencia)
        asigna_celda_y_borde(hoja, fila, 6, 
                             r.proyectofinanciero.fechainicio_localizada)
        asigna_celda_y_borde(hoja, fila, 7, 
                             r.proyectofinanciero.fechacierre_localizada)

        asigna_celda_y_borde(hoja, fila, 8, 
                             r.tipoproductopf ? r.tipoproductopf.nombre : '')
        cump = ''
        if r.fechaplaneada && r.fechareal
          c = 0
          uf = r.fechaplaneada
          (1..7).each do |d|
            f = r.fechaplaneada + d.days
            if f.wday != 0 && f.wday != 6
              if (c<=5)
                uf =f
              end
              c += 1
            end
          end
          cump = r.fechareal <= uf ? 'SI' : 'NO'
        end
        asigna_celda_y_borde(hoja, fila, 9, cump)
        asigna_celda_y_borde(hoja, fila, 10, r.seguimiento)
        cons +=1
        fila +=1
      end

      FileUtils.mv(narch + "#{extension}-75", narch + "#{extension}-90")
      # Hoja de divisas
      hoja = libro.worksheets(8)
      fila = 2
      reg = registros #.where("estado IN ('J', 'C', 'M')")
      tf = ::Tasacambio.where(enpesos: reg.map(&:tasa).uniq).order(:fecha)
     
      cons = 1
      tf.each do |t|
        asigna_celda_y_borde(hoja, fila, 1, t.fecha.to_s)
        val = t.enpesos
        ordcol=['', 'EUR', 'USD', 'GBP', 'SEK', 'CHF', 'Otros']
        otro = true
        (2..6).each do |ncol|
          if ordcol[ncol-1] == t.tipomoneda.codiso4217
            asigna_celda_y_borde(hoja, fila, ncol, val)
            otro  = false
          else
            asigna_celda_y_borde(hoja, fila, ncol, ' ')
          end 
        end
        if otro
          val = "1 " + t.tipomoneda.codiso4217 + " = " + t.enpesos.to_s + " COP"
          asigna_celda_y_borde(hoja, fila, 7, val)
        else
          asigna_celda_y_borde(hoja, fila, 7, ' ')
        end
        cons += 1
        fila += 1
      end

      FileUtils.mv(narch + "#{extension}-90", narch + "#{extension}-99")
      # Hojas para tramitados en años anteriores
      anios = registros.where("fechaformulacion<'#{anio}-01-01'").
        reorder(nil).pluck('fechaformulacion').
        map {|f| f.year.to_i}.uniq
      anios.sort!
      numhoja = 9
      anios.each do |a|
        if numhoja<=11
          hoja = libro.worksheets(numhoja)
          tramitado_anio(registros, hoja, a)
        end
      end

      FileUtils.rm(narch + "#{extension}-99")
      n=File.join('/tmp', File.basename(narch + ".ods"))
      libro.save(n)

      return n
    end

    # Retorna ids de proyectos que el usuario actual puede leer con
    # las restricciones del filtro:
    #   filtro[:fecha] limita a proyectos vigentes en la fecha
    #   filtro[:grupo_ids] limita a proyectos vigentes en la fecha
    # Usado en formulario actividad en lista de selección de proyectos
    def self.disponibles(filtro, ability, c = nil)
      c2 = Cor1440Gen::ProyectosfinancierosController::
        disponibles_cor1440_gen(filtro, ability, c)
      if filtro[:grupo_ids] && filtro[:grupo_ids] != ''
        grupo_ids = filtro[:grupo_ids].map {|x| x.to_i}
        c2 = c2.where("cor1440_gen_proyectofinanciero.id IN 
                     (SELECT proyectofinanciero_id 
                      FROM grupo_proyectofinanciero WHERE
                      grupo_id IN (#{grupo_ids.join(',')}))")
      end

      return c2
    end

    def self.vista_listado(plant, ids, modelo, narch, parsimp, extension,
                          campoid = :id)
      #byebug
      registros = modelo.where(id: ids)
      case plant.vista
      when 'Cronograma de Solicitud de Informes'
        r = self.vista_solicitud_informes(registros)
      when 'Cuadro General de Seguimiento'
        r = self.cuadro_general_seguimiento(
          plant, registros, narch, parsimp, extension)
        return r
      else
        r = registros
      end
      return r
    end

    def index_reordenar(registros)
      @plantillas = ::Heb412Gen::Plantillahcm.where(
        "vista IN ('Cronograma de Solicitud de Informes', 'Cuadro General de Seguimiento')").
      select('nombremenu, id').map { 
          |co| [co.nombremenu, co.id] 
        }
    
      mg1 = ::Cor1440Gen::GruposHelper.mis_grupos_sinus(current_usuario)
      mgi = mg1.map(&:id).join(', ')
      if mgi == '' && current_usuario.rol != ::Ability::ROLDIR &&
        current_usuario.rol != ::Ability::ROLADMIN
        registros = registros.where('TRUE=FALSE')
      elsif mg1.where(nombre: ::Ability::GRUPO_COMPROMISOS).count == 0 &&
        current_usuario.rol != ::Ability::ROLDIR &&
        current_usuario.rol != ::Ability::ROLADMIN
        registros = registros.where(
          "cor1440_gen_proyectofinanciero.id IN (" +
          "SELECT proyectofinanciero_id FROM grupo_proyectofinanciero " +
          " WHERE grupo_id IN (#{mgi}))")
      end
      return registros.reorder([:estado, :referenciacinep, :id])
    end

    def actualizaind
      pf = params[:proyectofinanciero]
      inds = []
      if pf
        indsobj = pf[:indicadorobjetivo_attributes] 
        indsres = pf[:indicadorpf_attributes]
        objetivospf = pf[:objetivopf_attributes]
        resultadospf = pf[:resultadopf_attributes]
        if indsobj 
          indsobj.each do |k, val|
            objetivospf.each do |kk, val2|
              if val2[:id] == val[:objetivopf_id]  
                obj = val2[:numero] 
                inds.push([obj ? obj : '', val[:id], val[:numero], val[:indicador]])
              end
            end
          end
        end
        if indsres 
          indsres.each do |k, val|
            resultadospf.each do |kk, val2|
              if val2[:id] == val[:resultadopf_id]  
                res = val2[:numero] 
                objetivospf.each do |kkk, val3|
                  if val2[:objetivopf_id] == val3[:id]
                    obj = val3[:numero]
                    inds.push([(obj ? obj : '') + (res ? res : ''), val[:id], val[:numero], val[:indicador]])
                  end
                end
              end
            end
          end
        end
        @params = params
      end
      @params[:indicadores] = inds
      respond_to do |format|
        format.js { render 'refrescar_informes' }
      end
    end

    def genera_odt(plantilla_id, narchivo)
      plantilla = ::Heb412Gen::Plantilladoc.find(plantilla_id)
      if !plantilla
        return
      end
      #camposab = current_ability.
      #  campos_plantillas['Compromiso Institucional'][:campos]
      narchivo << File.basename(plantilla.ruta)
      # Ejemplo de https://github.com/sandrods/odf-report
      report = ODFReport::Report.new("#{Rails.root}/public/heb412/#{plantilla.ruta}") do |r|
        cn = [:nombre, :referencia, :referenciacinep, 
              :respagencia, :emailrespagencia,
              :telrespagencia, :fuentefinanciador, :observaciones,
              :saldo, :otrosaportescinep,
              :empresaauditoria,
              :centrocosto, :cuentasbancarias, 
              :sucursal, :rendimientosfinancieros,
              :informesespecificos, :informessolicitudpago, 
              :anotacionescontab, :gestiones]
              #:formatosespecificos, :formatossolicitudpago ]
        cn.each do |s|
          puts s
          r.add_field(s, @proyectofinanciero[s] ? @proyectofinanciero[s] : '')
        end
        [:sectorapc, :tutorarea, :coordinadorlinea, :nitfinanciador, 
         :presupuestototalej, :montoej, :aportecinepej, :aporteotrosej, 
         :duracion].each do |s|
          r.add_field(s, @proyectofinanciero.presenta(s))
        end

        # Booleanos
        bn = [:acuse, :autenticarcompulsar, :copiasdesoporte, 
              :reportarrendimientosfinancieros,
              :reinvertirrendimientosfinancieros]
        bn.each do |b|
          r.add_field(b, @proyectofinanciero[b] ? 'Si' : 'No')
        end

        # Renombrados
        r.add_field(:aportefinanciador, 
                    @proyectofinanciero.monto_localizado)
        r.add_field(:saldo, 
                    @proyectofinanciero.saldo_localizado)
        r.add_field(:aportefinancierocinep, 
                    @proyectofinanciero.aportecinep_localizado)
        r.add_field(:presupuestototal, 
                    @proyectofinanciero.presupuestototal_localizado)
        r.add_field(:publicaciones, 
                    @proyectofinanciero[:compromisos])
        r.add_field(:fechainicio, 
                    @proyectofinanciero.fechainicio_localizada)
        r.add_field(:fechacierre, 
                    @proyectofinanciero.fechacierre_localizada)
        r.add_field(:fechaliquidacion, 
                    @proyectofinanciero.fechaliquidacion_localizada)
        r.add_field(:fechaaprobacion,
                    @proyectofinanciero.fechaaprobacion_localizada)

        # Calculados
        if @proyectofinanciero.fechainicio && @proyectofinanciero.fechacierre
          r.add_field(:duracion, LibMisc.dif_meses_dias(
            @proyectofinanciero.fechainicio, 
            @proyectofinanciero.fechacierre))
        end
        ca = [:anotacionesdb, :anotacionesrh, :anotacionesre,
              :anotacionesinf, :anotacionescontab]
        an = ""
        sep = ""
        ca.each do |a|
          if @proyectofinanciero[a] then
            nan = @proyectofinanciero[a].strip
            if (nan != '' && !nan.end_with?(".")) then
              nan += "."
            end
            an += sep + nan
            sep = "   "
          end
        end
        r.add_field(:anotaciones, an)
        cf = @proyectofinanciero.anexo_proyectofinanciero.inject(0) do |memo, a|
          if (a.tipoanexo_id != 5) then
            memo + 1
          else 
            memo
          end
        end
        r.add_field(:formatosespecificos, cf > 0 ? 'Si' : 'No')

        fh = ::Sip::FormatoFechaHelper::fecha_estandar_local(Date.today.to_s)
        r.add_field(:fechahoy, fh)
        fhf = Date.today + 12
        r.add_field(
          :fechahoymasdiezhabiles, 
          ::Sip::FormatoFechaHelper::fecha_estandar_local(fhf.to_s))

        # Referencian otra
        r.add_field(:tipomoneda, @proyectofinanciero.tipomoneda &&
                    @proyectofinanciero.tipomoneda ? 
                    @proyectofinanciero.tipomoneda.nombre : '')
        if @proyectofinanciero.uresponsable
          
          r.add_field(:responsable, 
                      @proyectofinanciero.proyectofinanciero_uresponsable.inject('') { |memo, i|
              (memo == '' ? '' : memo + "\n") + 
                (i.uresponsable ? i.uresponsable.nombres + ' ' + i.uresponsable.apellidos : "Por contratar") +
                (i.porcentaje ? " " + i.porcentaje.to_s + "%" : '')
          })
        end
        if @proyectofinanciero.financiador
          r.add_field(:financiador, 
                      @proyectofinanciero.financiador.inject('') { 
            |memo, i|
            (memo == '' ? '' : memo + ' - ') + i.nombre 
          })
          r.add_field(:paisfinanciador, 
                      @proyectofinanciero.financiador.inject('') { 
            |memo, i|
            i.pais && i.pais.nombre ? 
              (memo == '' ? '' : 
               memo + ' - ') + i.pais.nombre : memo
          })
        end
        if @proyectofinanciero.grupo
          r.add_field(:organigramacinep, 
                      @proyectofinanciero.grupo.inject('') { 
            |memo, i|
            (memo == '' ? '' : memo + ' - ') + i.nombre 
          })
        end
        if @proyectofinanciero.coordinador_proyectofinanciero
          r.add_field(:coordinador, 
                      @proyectofinanciero.coordinador_proyectofinanciero.inject('') { |memo, i|
            (memo == '' ? '' : memo + '; ') + 
              (i.coordinador ? i.coordinador.nombres + ' ' + 
               i.coordinador.apellidos : "") })
        end
        if @proyectofinanciero.proyectofinanciero_usuario
          
          r.add_field(:equipotrabajo, 
                      @proyectofinanciero.proyectofinanciero_usuario.inject('') { |memo, i|
              (memo == '' ? '' : memo + "\n") + 
                (i.usuario ? i.usuario.nombres + ' ' +
                i.usuario.apellidos : "Por contratar") +
                " (" + 
                (i.cargo ? i.cargo.nombre.capitalize : '') + ", " +
                " - "+ 
                (i.perfilprofesional ? i.perfilprofesional.nombre.capitalize : '') + 
                ")" + 
                (i.porcentaje ? " " + i.porcentaje.to_s + "%" : '')
          })
        end
        if @proyectofinanciero.desembolso
          tm =  @proyectofinanciero.tipomoneda &&
            @proyectofinanciero.tipomoneda.nombre ?
            @proyectofinanciero.tipomoneda.codiso4217 : ''
          r.add_table('TDESEMBOLSOS', @proyectofinanciero.desembolso, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_localizada.to_s}
            d.add_column('VALORPLANEADO'){|i| i.valorplaneado_localizado.to_s +
                                          ' ' + tm }
          end
#          r.add_field(:desembolsos, 
#                      @proyectofinanciero.desembolso.inject('') { 
#            |memo, i| (memo == '' ? '' : memo + "\n") + 
#            i.detalle + ", Fecha: " + 
#            i.fechaplaneada_ddMyyyy.to_s +
#            ' (' + i.valorplaneado_localizado.to_s + ' ' + tm +
#            ')'
#            })
        end
        inarr = ''
        if @proyectofinanciero.informenarrativo
#          inarr = @proyectofinanciero.informenarrativo.inject('') do |memo, i|
#            (memo == '' ? '' : memo + "\n") + i.detalle + ", " + 
#              i.fechaplaneada_ddMyyyy.to_s 
#          end
          r.add_table('INFORMESNARRATIVOS', 
                      @proyectofinanciero.informenarrativo, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_localizada.to_s}
          end
        end
        if (inarr == '') 
          inarr = 'N/A'
        end
        r.add_field(:informesnarrativos, inarr)

        ifin = ''
        if @proyectofinanciero.informefinanciero
          r.add_table('INFORMESFINANCIEROS', 
                      @proyectofinanciero.informefinanciero, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_localizada.to_s}
          end
        end
        if (ifin == '') 
          ifin = 'N/A'
        end
        r.add_field(:informesfinancieros, ifin)

        iaud = ''
        if @proyectofinanciero.informeauditoria
          r.add_table('INFORMESAUDITORIAS', 
                      @proyectofinanciero.informeauditoria, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_localizada.to_s}
          end
        end
        if (iaud == '') 
          iaud = 'N/A'
        end
        r.add_field(:informesauditorias, iaud)

        if @proyectofinanciero.productopf
          r.add_table('PRODUCTOS', 
                      @proyectofinanciero.productopf, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION') { |i| i.tipoproductopf.nombre.to_s + ' ' + i.detalle.to_s }
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_localizada.to_s}
          end
        end

      end
      ngen =File.join('/tmp', File.basename(plantilla.ruta))
      report.generate(ngen.to_s)
      return ngen
    end

    private

    def set_proyectofinanciero
      @registro = @basica = @proyectofinanciero = Proyectofinanciero.find(
        Proyectofinanciero.connection.quote_string(params[:id]).to_i
      )
      @registro.ip = request.remote_ip
      @registro.current_usuario = current_usuario
    end

    # No confiar parametros a Internet, sólo permitir lista blanca
    def proyectofinanciero_params
      params.require(:proyectofinanciero).permit(
        :acuse,
        :aportecinep_localizado,
        :aaportes,
        :anotacionescontab,
        :anotacionesdb,
        :anotacionesinf,
        :anotacionesre,
        :anotacionesrh,
        :aotrosfin_localizado,
        :aotrosesp,
        :aportecinepp_localizado, 
        :aportecinepej_localizado, 
        :aportecinepejp_localizado, 
        :aporteotrosp_localizado, 
        :aporteotrosej_localizado, 
        :aporteotrosejp_localizado, 
        :apresupuesto,
        :autenticarcompulsar,
        :centrocosto,
        :copiasdesoporte,
        :cuentasbancarias,
        :dificultad,
        :domiciliofinanciador, 
        :emailrespagencia, 
        :empresaauditoria,
        :estado,
        :fechacierre_localizada,
        :fechaformulacion_localizada,
        :fechaformulacion_anio,
        :fechaformulacion_mes,
        :fechainicio_localizada,
        :fechaliquidacion_localizada,
        :fechaaprobacion_localizada,
        :financiador,
        #:formatosespecificos,
        #:formatossolicitudpago,
        :fuentefinanciador, 
        :gestiones,
        :idtributariaexfinanciador,
        :informesespecificos,
        :informessolicitudpago,
        :monto_localizado,
        :montoej_localizado,
        :montoejp_localizado,
        :montopesos_localizado,
        :nombre, 
        :nitfinanciador, 
        :objeto,
        :observaciones,
        :observacionescierre,
        :observacionesejecucion,
        :observacionestramite,
        :otrosaportescinep,
        :presupuestototal_localizado,
        :presupuestototalej_localizado, 
        :presupuestototalejp_localizado,
        :presupuestototalp_localizado, 
        :razonsocialfinanciador, 
        :referencia, 
        :referenciacinep, 
        :replegalfinanciador, 
        :reportarrendimientosfinancieros,
        :respgp_id,
        :respgp2_id,
        :reinvertirrendimientosfinancieros,
        :respagencia, 
        :tasa_localizado, 
        :tasaej_localizado, 
        :telrespagencia, 
        :tipomoneda_id,
        :saldo_localizado,
        :saldoej_localizado,
        :saldoejp_localizado,
        :saldop_localizado,
        :sectorapc_id,
        :skypefinanciador, 
        :sucursal,
        :webfinanciador, 

        :anexo_proyectofinanciero_attributes => [
          :id,
          :proyectofinanciero_id,
          :tipoanexo_id,
          :_destroy,
          :sip_anexo_attributes => [
            :id, :descripcion, :adjunto, :_destroy
          ]
        ],
        :cambiosproyectofinanciero_attributes => [
          :id,
          :cuando,
          :ip,
          :proyectofinanciero_id,
          :usuario_id,
          :comentarios,
          :_destroy
        ],
        :desembolso_attributes => [
          :id,
          :detalle,
          :fechaplaneada_localizada,
          :valorplaneado_localizado,
          :_destroy
        ],
        :financiador_ids => [],
        :informeauditoria_attributes => [
          :detalle,
          :devoluciones,
          :seguimiento,
          :fechaplaneada_localizada,
          :presupuestodonante_localizado,
          :presupuestoorg_localizado,
          :fechareal_localizada,
          :id,
          :_destroy
        ],
        :informeevaluacion_attributes => [
          :detalle,
          :resultado,
          :fechaplaneada_localizada,
          :fechareal_localizada,
          :id,
          :_destroy
        ],
        :informefinanciero_attributes => [
          :detalle,
          :devoluciones,
          :seguimiento,
          :fechaplaneada_localizada,
          :fechareal_localizada,
          :id,
          :_destroy
        ],
        :informenarrativo_attributes => [
          :detalle,
          :devoluciones,
          :seguimiento,
          :fechaplaneada_localizada,
          :fechareal_localizada,
          :id,
          :_destroy
        ],
        :grupo_ids => [],
        :productopf_attributes => [
          :costoprevisto_localizado,
          :detalle,
          :devoluciones,
          :fechainiprod_anio, 
          :fechainiprod_mes, 
          :fechafinprod_anio, 
          :fechafinprod_mes, 
          :fechaplaneada_localizada,
          :fechareal_localizada,
          :id,
          :indicadorpf_id,
          :seguimiento,
          :tipoproductopf_id,
          :_destroy
        ],
        :proyectofinanciero_usuario_attributes => [
          :cargo_id,
          :id,
          :perfilprofesional_id,
          :porcentaje,
          :tipocontrato_id,
          :usuario_id,
          :_destroy
        ],
        :proyectofinanciero_uresponsable_attributes => [
          :id,
          :uresponsable_id,
          :porcentaje,
          :_destroy
        ],
        :coordinador_proyectofinanciero_attributes => [
          :id,
          :coordinador_id,
          :_destroy
        ],
        :objetivopf_attributes =>  [
              :id, :numero, :objetivo, :_destroy 
        ],
        :indicadorobjetivo_attributes =>  [
              :id, :objetivopf_id,
              :numero, :indicador, 
              :tipoindicador_id, :_destroy
        ],

        :resultadopf_attributes =>  [
              :id, :objetivopf_id,
              :numero, :resultado, :_destroy 
        ],
        :indicadorpf_attributes =>  [
              :id, :resultadopf_id,
              :numero, :indicador, 
              :tipoindicador_id, :_destroy
        ],
        :actividadpf_attributes =>  [
              :id, :resultadopf_id,
              :nombrecorto, :titulo, 
              :actividadtipo_id,
              :descripcion, :_destroy
        ] 
      )
    end
  end 
end
