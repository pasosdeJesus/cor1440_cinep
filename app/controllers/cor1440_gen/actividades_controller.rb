require_dependency "cor1440_gen/concerns/controllers/actividades_controller"

module Cor1440Gen
  class ActividadesController < Heb412Gen::ModelosController
    include Cor1440Gen::Concerns::Controllers::ActividadesController

    before_action :set_actividad, 
      only: [:show, :edit, :update, :destroy],
      exclude: [:contar, :contar_beneficiarios]
    load_and_authorize_resource class: Cor1440Gen::Actividad

    helper Cor1440Gen::GruposHelper

    include Sip::ConsultasHelper
    include Sip::FormatoFechaHelper

    def clase
      'Cor1440Gen::Actividad'
    end

    def new
      @colgrupos = @misgrupos = 
        Cor1440Gen::GruposHelper.mis_grupos_sinus(current_usuario)
      @registro = @actividad = Actividad.new
      @registro.current_usuario = current_usuario
      @registro.oficina_id = 1
      @registro.creadopor_id = current_usuario.id
      @registro.usuario_id = current_usuario.id
      @registro.fecha = Date.today
      @registro.save!(validate: false)
      @apf = ActividadProyectofinanciero.new
      @apf.proyectofinanciero_id = 18  # Plan trienal 2018-2020
      @apf.actividad_id = @registro.id
      @apf.save!(validate: false)
      redirect_to cor1440_gen.edit_actividad_path(@registro)
    end

    def create
      @actividad = Actividad.new(actividad_params)
      @actividad.oficina_id = 1
      @actividad.current_usuario = current_usuario
      @actividad.creadopor_id = current_usuario.id
      create_gen
    end

    def filtra_contar_control_acceso
      @contar_misgrupos = Cor1440Gen::GruposHelper.
          mis_grupos_sinus(current_usuario) 
      # Investigadores ven sólo su linea
      @contar_mg = @contar_misgrupos.where("nombre LIKE '#{::Ability::GRUPO_LINEA}%'").
          order(:nombre)
      if @contar_mg.count > 0 && @contar_mg.count < 3
        @contar_misgrupos = @contar_mg
      end
      @contar_pf = Cor1440Gen::GruposHelper.
        compromisos_grupos(Cor1440Gen::Proyectofinanciero.all,
                           @contar_misgrupos, current_usuario)
      @contar_pfid = 18
    end

    def filtra_contar_por_parametros
      grupo = nil

      if params[:filtro] && params[:filtro][:grupo_id] && 
        params[:filtro][:grupo_id] != ""
        grupo = Sip::Grupo.find(params[:filtro][:grupo_id].to_i)
      else 
        if @contar_mg.count == 1
          grupo = @contar_mg.first
        end
      end
      if grupo
        @contar_grupoid = grupo.id
        @contar_actividad = @contar_actividad.where(
          'cor1440_gen_actividad.id IN (SELECT actividad_id 
             FROM actividad_grupo WHERE grupo_id = ?)', @contar_grupoid)
      end
      @contar_pfid = params[:filtro] && 
        params[:filtro][:proyectofinanciero_id] ? 
        params[:filtro][:proyectofinanciero_id].to_i : 18
    end

    def asegura_contexto(actividad)
      if can? :edit, :contextoac
        if actividad.fecha.nil? || actividad.departamento_id.nil? ||
          actividad.grupo.count == 0 || actividad.usuario_id.nil?
            actividad.contextoinv_id = nil
        end
        grupo = actividad.grupo.take
        if grupo.nil?
            actividad.contextoinv_id = nil
            return
        end
        region = ::Regiongrupo.incluye_municipio(grupo.id,
                                                 actividad.departamento_id,
                                                 actividad.municipio_id).take
        if region.nil? || region.id.nil?
          actividad.contextoinv_id = nil
          return
        end
        puts "OJO region.id=#{region.id}"
        fini = Sip::FormatoFechaHelper.inicio_semestre(actividad.fecha)
        ffin = Sip::FormatoFechaHelper.fin_semestre(actividad.fecha)
        r = actividad.usuario_id
        if r.nil?
          actividad.contextoinv_id = nil
          return
        end
        c = ::Contextoinv.where(fechainicio: fini, fechafin: ffin,
                                regiongrupo_id: region.id, usuario_id: r).take
        if c.nil?
          c = ::Contextoinv.new(fechainicio: fini, fechafin: ffin,
                                regiongrupo_id: region.id, usuario_id: r)
          c.save!
        end

        actividad.contextoinv_id = c.id
      end
    end

    def filtra_usuario_responsable(lista_usuarios)
      li = @colgrupos.map(&:id)
      ln = @colgrupos.map(&:cn)
      nn = []
      ln.each do |n|
        if n && n[0..4] == 'Linea'
          nn << 'Coordinador' + n[5..-1]
          ng = Sip::Grupo.where(cn: nn).take
          if ng
            li << ng.id
          end
        end
      end
      wu = li.count == 0 ?  'TRUE=FALSE' : 
        "fechadeshabilitacion IS NULL 
         AND  id IN (SELECT usuario_id FROM sip_grupo_usuario WHERE 
         (sip_grupo_id IN (#{li.join(', ')})))"
      lista_usuarios = lista_usuarios.where(wu).
        order(:nombres, :apellidos, :nusuario) 
      return lista_usuarios
    end

    def recalcula_misgrupos(usuario, registro)
      @misgrupos = Cor1440Gen::GruposHelper.mis_grupos_sinus(usuario)
      mgui = @misgrupos.map(&:id)
      gd = registro.grupo.count > 0 ? registro.grupo.map(&:id) :  []
      gruposids = mgui + gd
      @colgrupos = Sip::Grupo.where(id: gruposids)
    end

    def edit
      edit_cor1440_gen
      asegura_contexto(@registro)
      @registro.save!(validate: false)
      recalcula_misgrupos(current_usuario, @registro)
      render layout: 'application'
    end

    def update
      if params[:actividad]
        if current_usuario && @registro && @registro.creadopor &&
          current_usuario.id == @registro.creadopor.id
          params[:actividad].delete(:vistobuenopar)
          params[:actividad].delete(:observacionespar)
        end
        if !can?(:dir, :vistobuenoactividad)
          params[:actividad].delete(:vistobuenodir)
          params[:actividad].delete(:observacionesdir)
        end
        params[:actividad][:oficina_id] = 1
      end
      recalcula_misgrupos(current_usuario, @registro)
      update_gen
    end

    def index_reordenar(c)
      if current_usuario.rol != ::Ability::ROLDIR &&
        current_usuario.rol != ::Ability::ROLADMIN
        mg = Cor1440Gen::GruposHelper.mis_grupos_sinus(current_usuario).
          map(&:id)
        gc = Sip::Grupo.where(nombre: ::Ability::GRUPO_COMPROMISOS).take
        cmisg = "cor1440_gen_actividad.id in 
          (SELECT actividad_id FROM actividad_grupo WHERE 
            grupo_id IN (#{mg.join(', ')}))"
        if mg == [] 
          c = c.where('TRUE=FALSE')
        elsif mg.include?(gc.id)
          c = c.where("cor1440_gen_actividad.id in 
          (SELECT actividad_id FROM cor1440_gen_actividad_proyectofinanciero 
                      WHERE proyectofinanciero_id IN (SELECT id FROM 
                      cor1440_gen_proyectofinanciero WHERE respgp_id=? OR
                      respgp2_id=?
                     )) OR #{cmisg}", current_usuario.id, current_usuario.id)
        else
          c = c.where(cmisg)
        end
      end
      c = c.reorder('cor1440_gen_actividad.fecha DESC') 

      return c
    end


    # Encabezado comun para HTML y PDF (primeras filas)
    def encabezado_comun
      atributos_presenta.map {|a| Cor1440Gen::Actividad.human_attribute_name(a)}
    end

    def atributos_show
      [ :id, 
        :fecha, 
        :creadopor, 
        :responsable,
        :usuario,
        :nombre, 
        :duracion_localizado, 
        :mduracion,
        :duracionhoras_localizado,
        :departamento, 
        :municipio,
        :grupo, 
        :proyectofinanciero, 
        :actividadpf,
        :objetivopf, 
        :precedidapor,
        :actorsocial, 
        :publicacion,
        :mujeres, 
        :hombres, 
        :sexo_onr,
        :negros, 
        :indigenas, 
        :etnia_onr,
        :jovenes,
        :rangoedad_onr,
        :observaciones, 
        :anexos,
        :vistobuenopar,
        :observacionespar,
        :vistobuenodir,
        :observacionesdir
      ]
    end

    def atributos_form
      # NO se usa porque se hizo app/views/cor1440_gen/actividades/_form.html.erb
      r = atributos_show - [:proyectosfinancieros] + 
        [:proyectofinanciero] - [:id] - 
        [:vistobuenodir, :vistobuenopar, :observacionesdir, :observacionespar]
      # Maneja excepcion en caso de migración que llame a esta
      # función
      begin
        if current_usuario && @actividad &&
            current_usuario.id != @actividad.creadopor.id
          r << :vistobuenopar
          r << :observacionespar
        end
        if can?(:dir, :vistobuenoactividad)
          r << :vistobuenodir
          r << :observacionesdir
        end
      rescue
      end
      r
    end

    def atributos_index
      [ :id, 
        :vistobuenopar,
        :fecha_localizada, 
        :nombre, 
        :creadopor, 
        :grupo, 
        :proyectofinanciero, 
        :actividadpf,
        :departamento,
        :municipio,
        :actorsocial,
        :publicacion,
        :mujeres,
        :hombres,
        :sexo_onr,
        :negros,
        :indigenas,
        :jovenes,
        :rangoedad_onr,
        :etnia_onr,
        :anexos
      ]
    end


    def atributos_presenta
      [ :id, 
        :fecha, 
        :creadopor, 
        :duracion, 
        :mduracion,
        :nombre, 
        :departamento, 
        :municipio,
        :grupo, 
        :proyectosfinancieros, 
        :actividadpf,
        :objetivopf, 
        :actorsocial, 
        :publicacion,
        :mujeres, 
        :hombres, 
        :sexo_onr,
        :negros, 
        :indigenas, 
        :etnia_onr,
        :jovenes,
        :rangoedad_onr
      ]
    end

#    def fila_comun(actividad)
#      return [actividad.id,
#        actividad.fecha_localizada, 
#        actividad.creadopor ? actividad.creadopor.nusuario : "",
#        actividad.duracion ? actividad.duracion : "",
#        actividad.mduracion ? actividad.mduracion : "",
#        actividad.nombre ? actividad.nombre : "",
#        actividad.departamento ? actividad.departamento.nombre : "",
#        actividad.municipio ? actividad.municipio.nombre : "",
#        actividad.presenta('grupo'),
#        actividad.proyectofinanciero.inject("") { |memo, i| 
#          (memo == "" ? "" : memo + "; ") + i.referenciacinep
#        },
#        actividad.presenta('actividadpf'),
#        actividad.objetivopf.inject("") { |memo, i| 
#          (memo == "" ? "" : memo + "; ") + i.numero
#        },
#        actividad.presenta('actorsocial'),
#        actividad.presenta('publicacion'),
#        actividad.mujeres,
#        actividad.hombres,
#        actividad.sexo_onr,
#        actividad.negros,
#        actividad.indigenas,
#        actividad.etnia_onr
#      ]
#    end
#
#    def vector_a_registro(a, ac)
#      {
#        id: a[0],
#        fecha: a[1],
#        creadopor: a[2],
#        duracion: a[3],
#        mduracion: a[4],
#        nombre: a[5],
#        departamento: a[6],
#        municipio: a[7],
#        grupo: a[8],
#        convenios_financieros: a[9],
#        actividad_de_convenio: a[10],
#        objetivo_de_convenio: a[11],
#        actorsocial: a[12],
#        publicacion: a[13],
#        mujeres: a[14],
#        hombres: a[15],
#        sexo_onr: a[16],
#        negros: a[17],
#        indigenas: a[18],
#        etnia_onr: a[19],
#        observaciones: ac.observaciones,
#        creacion: ac.created_at,
#        actualizacion: ac.updated_at
#      }
#    end
#
    def lista_params
      r = [
        :actividad, 
        :accionincidencia,
        :accioncgenero,
        :accioncetnia,
        :alcance,
        :convocante, 
        :contexto,
        :departamento_id,
        :desarrollo, 
        :duracion_localizado,
        :etnia_onr, 
        :etnia_onr_nobef, 
        :etnia_onr_proceso, 
        :fecha_localizada, 
        :grupo_id, 
        :hombres, 
        :hombres_nobef, 
        :hombres_proceso, 
        :indigenas, 
        :indigenas_nobef, 
        :indigenas_proceso,
        :jovenes,
        :lugar, 
        :mduracion,
        :minutos, 
        :mujeres, 
        :mujeres_nobef, 
        :mujeres_proceso, 
        :municipio_id,
        :negros, 
        :negros_nobef, 
        :negros_proceso, 
        :nombre, 
        :nucleoconflicto_id,
        :oficina_id,
        :objetivo, 
        :observaciones,         
        :observacionesdir,         
        :observacionespar,         
        :participantes, 
        :precedidapor,
        :proyecto,
        :rangoedad_onr,
        :redactor_id,
        :resultado,
        :sexo_onr, 
        :sexo_onr_nobef, 
        :sexo_onr_proceso, 
        :totorg, 
        :usuario_id,
        :valora,
        :vistobuenodir,
        :vistobuenopar,
        :actividadarea_ids => [],
        :actividadpf_ids => [],
        :actividad_proyectofinanciero_attributes => [
          :id, :proyectofinanciero_id, :_destroy,
          :actividadpf_ids => []
        ],
        :actividad_rangoedadac_attributes => [
          :id, :rangoedadac_id, :fl, :fr, :ml, :mr, :_destroy
        ],
        :actividad_sip_anexo_attributes => [
          :id,
          :id_actividad, 
          :_destroy,
          :sip_anexo_attributes => [
            :id, :descripcion, :adjunto, :_destroy
          ]
        ],
        :actividadtipo_ids => [],
        :actorsocial_ids => [],
        :contextoinv_attributes => [
          :id, 
          :contexto
        ],
        :grupo_ids => [],
        :objetivopf_ids => [],
        :otronucleoconflicto_ids => [],
        :proyecto_ids => [],
        :proyectofinanciero_ids => [],
        :publicacion_ids => [],

        :respuestafor_attributes => [
          :id,
          "valorcampo_attributes" => [
            :valor,
            :campo_id,
            :id 
          ] + 
          [:valor_ids => []]
        ],

        :usuario_ids => [],

      ]
      r
    end

    # No confiar parametros a Internet, sólo permitir lista blanca
    def actividad_params
      params.require(:actividad).permit(lista_params)
    end
  end
end
