# encoding: UTF-8

class ReportesController < ::ApplicationController

  load_and_authorize_resource class: Cor1440Gen::Actividad
  
  include Sip::ConsultasHelper

  # Inicializa @fechaini y @fechafin
  def carga_fechas
    if params[:fechaini] || params[:fechafin]
      @fechaini = param_escapa('fechaini')
      @fechafin = param_escapa('fechafin')
    else
      @fechaini = inicio_semestre_ant()
      @fechafin = fin_semestre_ant()
    end
  end

  # Indicador 1.1
  def indicador11
    carga_fechas

    cons = "SELECT DISTINCT cor1440_gen_actividad.id, usuario.nusuario,
    cor1440_gen_actividad.nombre as act_nombre, 
    redactor.nombre as red_nombre, 
    sip_municipio.nombre as municipio, sip_departamento.nombre as departamento, 
    (CASE WHEN alcance = 'Local' THEN 'X' ELSE '' END) AS local,
    (CASE WHEN alcance = 'Regional' THEN 'X' ELSE '' END) AS regional,
    (CASE WHEN alcance = 'Nacional' THEN 'X' ELSE '' END) AS nacional,
    (CASE WHEN alcance = 'Internacional' THEN 'X' ELSE '' END) AS internacional,
    nucleoconflicto.nombre as nucleoconflicto,
    ARRAY_TO_STRING(
      ARRAY(SELECT nucleoconflicto.nombre FROM actividad_nucleoconflicto 
      JOIN nucleoconflicto 
      ON actividad_nucleoconflicto.nucleoconflicto_id=nucleoconflicto.id 
      WHERE actividad_nucleoconflicto.actividad_id=cor1440_gen_actividad.id), 
      '; ') as otrosnucleos,
    ARRAY_TO_STRING(
      ARRAY(SELECT publicacion.nombre FROM actividad_publicacion
      JOIN publicacion
      ON actividad_publicacion.publicacion_id=publicacion.id 
      WHERE actividad_publicacion.actividad_id=cor1440_gen_actividad.id),
      '; ') as publicaciones
    FROM cor1440_gen_actividad JOIN actividad_publicacion 
        ON cor1440_gen_actividad.id=actividad_publicacion.actividad_id 
      LEFT JOIN usuario ON cor1440_gen_actividad.usuario_id = usuario.id
      LEFT JOIN redactor ON cor1440_gen_actividad.redactor_id=redactor.id 
      LEFT JOIN sip_municipio 
        ON cor1440_gen_actividad.municipio_id=sip_municipio.id
      LEFT JOIN sip_departamento
        ON cor1440_gen_actividad.departamento_id=sip_departamento.id
      LEFT JOIN nucleoconflicto
        ON cor1440_gen_actividad.nucleoconflicto_id=nucleoconflicto.id"
    where = ''
    if (@fechaini != '') 
      where = " WHERE cor1440_gen_actividad.fecha >= '#{@fechaini}'"
    end
    if (@fechafin != '')
      if where == ''
        where += ' AND '
      else
        where = ' WHERE '
      end
      where += "cor1440_gen_actividad.fecha <= '#{@fechafin}'"
    end
    cons += where + " ORDER BY 1"

    @cuerpotabla = ActiveRecord::Base.connection.select_all(cons)

    @enctabla = ['Id', 'Responsable', 'Escenario de Toma de Decisión',
      'Red Vinculada', 'Municipio', 'Departamento', 
      'Local', 'Regional', 'Nacional', 'Internacional', 
      'Principal núcleo que transforma', 
      'Otros núcleos que transforma', 'Insumo con el que se participa'
    ]

    respond_to do |format|
      format.html {  }
      format.json { head :no_content }
      format.js   { render 'sip/reportes/cambiatabla' }
    end
  end


  # Objetivo Especifico 2
  def objetivoe2 
    carga_fechas

    cons = "SELECT DISTINCT cor1440_gen_actividad.id, usuario.nusuario,
    actor.nombre AS nombre_actor, sip_municipio.nombre AS municipio,
    sip_departamento.nombre AS departamento,
    ARRAY_TO_STRING(
      ARRAY(SELECT sectoractor.nombre FROM actor_sectoractor
      JOIN sectoractor
      ON actor_sectoractor.sectoractor_id=sectoractor.id 
      WHERE actor_sectoractor.actor_id=actor.id AND sectoractor.enplantrienal), 
      '; ') as sectores,
    (CASE WHEN cor1440_gen_actividad.accionincidencia THEN 'X' ELSE '' END) AS incidencia,
    cor1440_gen_actividad.nombre AS accioncolectiva,
    (CASE WHEN cor1440_gen_actividad.accioncgenero THEN 'X' ELSE '' END) AS genero,
    (CASE WHEN cor1440_gen_actividad.accioncetnia THEN 'X' ELSE '' END) AS etnia,
    nucleoconflicto.nombre as nucleoconflicto,
    ARRAY_TO_STRING(
      ARRAY(SELECT nucleoconflicto.nombre FROM actividad_nucleoconflicto 
      JOIN nucleoconflicto 
      ON actividad_nucleoconflicto.nucleoconflicto_id=nucleoconflicto.id 
      WHERE actividad_nucleoconflicto.actividad_id=cor1440_gen_actividad.id), 
      '; ') as otrosnucleos
    FROM actor JOIN actividad_actor ON actor.id=actividad_actor.actor_id
      JOIN cor1440_gen_actividad 
        ON actividad_actor.actividad_id=cor1440_gen_actividad.id
      LEFT JOIN usuario ON cor1440_gen_actividad.usuario_id = usuario.id
      LEFT JOIN sip_municipio 
        ON sip_municipio.id=cor1440_gen_actividad.municipio_id
      LEFT JOIN sip_departamento 
        ON sip_departamento.id=cor1440_gen_actividad.departamento_id
      LEFT JOIN nucleoconflicto 
        ON cor1440_gen_actividad.nucleoconflicto_id=nucleoconflicto.id
    WHERE actor.id <> 102 AND actor.id <> 103
    AND actor.id IN (SELECT DISTINCT actor_id FROM actor_sectoractor, sectoractor
      WHERE actor_sectoractor.sectoractor_id=sectoractor.id 
      AND sectoractor.enplantrienal)
    "
    where = ''
    if (@fechaini != '') 
      where += " AND cor1440_gen_actividad.fecha >= '#{@fechaini}'"
    end
    if (@fechafin != '')
      where += " AND cor1440_gen_actividad.fecha <= '#{@fechafin}'"
    end
    cons += where + " ORDER BY 1"

    @cuerpotabla = ActiveRecord::Base.connection.select_all(cons)

    @enctabla = ['Id', 'Responsable', 'Actores Acompañados',
      'Municipio', 'Departamento', 'Tipos Actor', 
      'Acción de Incidencia que Transforma Núcleos de Conflicto', 'Acción Colectiva', 'Vincula Derechos de Género', 'Víncula Derechos de Étnia', 
      'Principal núcleo que transforma', 
      'Otros núcleos que transforma'
    ]

    respond_to do |format|
      format.html {  }
      format.json { head :no_content }
      format.js   { render 'reportes/cambiaactores' }
    end
  end

  # Cuadro actividades
  def cuadroactividades
    carga_fechas

    wheref = ''
    if (@fechaini != '') 
      wheref = "cor1440_gen_actividad.fecha >= '#{@fechaini}'"
    end
    if (@fechafin != '')
      if wheref != ''
        wheref += ' AND '
      end
      wheref += "cor1440_gen_actividad.fecha <= '#{@fechafin}'"
    end

    filas = [["Participación en espacios estratégicos para el centro  (foros, conversatorios, debates, seminarios, cátedras etc.)",
      [2, #PARTICIPACIÓN EN ACTIVIDAD DE FORMACIÓN
        3, #PARTICIPACIÓN EN REUNIÓN EXTERNA
        4, #PARTICIPACIÓN EN ESPACIO ESTRATÉGICO
        8, #RESPUESTA A SOLICITUD DE INFORMACIÓN
        116, #RESPUESTA A CONSULTA EXTERNA
        117 #RESPUESTA A CONSULTA INTERNA CINEP
    ]],
      ["Organización o co-organización de talleres, actividades de capacitación y/o formación",
        [1 #ORGANIZACIÓN DE ACTIVIDAD DE FORMACIÓN
    ]],
      ["Visitas de campo (VINCULADAS A UN PROYECTO DE INVESTIGACIÓN)",
        [11, #MISIÓN HUMANITARIA / TRABAJO DE CAMPO
          15, #  TI: VISITA TÉCNICA 
          108 # VISITAS DE CAMPO 
    ]],
      ["Ponencias en eventos (foros, conversatorios, debates, seminarios, cátedras etc.).",
        [122 #PONENCIA/CONFERENCIA/CHARLA
    ]],
      ["Organización de eventos",
        [ 9, #ORGANIZACIÓN DE ACTIVIDAD CULTURA/ARTÍSTICA
          10, #ORGANIZACIÓN DE CAMPAÑA
          7 #ORGANIZACIÓN DE EVENTO
    ]],
      ["Publicación de libros. EXTERNOS",
        [ 124 # "PUBLICACIÓN DE LIBRO EXTERNO AL CINEP
    ]],
      ["Capítulos de libros.  EXTERNOS",
        [ 125 # PUBLICACIÓN DE CAPÍTULO DE LIBRO EXTERNO AL CINEP
    ]],
      ["Artículos en publicaciones externas",
        [ 112, # PUBLICACIÓN DE ARTÍCULO EN REVISTA EXTERNA AL CINEP
    ]]
    ]

    @cuerpotabla = []
    filas.each do |f|
      puts f[0]
      tipos = f[1].inject("") { |memo, i| 
        (memo == "" ? "" : memo + ", ") + "'" + i.to_i.to_s + "'"
      }
      tac = Cor1440Gen::Actividad.all.joins(
        :actividad_actividadtipo).where(
        "cor1440_gen_actividad_actividadtipo.actividadtipo_id IN (#{tipos})"
      ).where(wheref).count()
      tm = Cor1440Gen::Actividad.all.joins(
        :actividad_actividadtipo).where(
        "cor1440_gen_actividad_actividadtipo.actividadtipo_id IN (#{tipos})"
      ).where(wheref).sum(:mujeres)
      th = Cor1440Gen::Actividad.all.joins(
        :actividad_actividadtipo).where(
        "cor1440_gen_actividad_actividadtipo.actividadtipo_id IN (#{tipos})"
      ).where(wheref).sum(:hombres)
      tbl = Cor1440Gen::Actividad.all.joins(
        :actividad_actividadtipo).where(
        "cor1440_gen_actividad_actividadtipo.actividadtipo_id IN (#{tipos})"
      ).where(wheref).sum(:blancos)
      tme = Cor1440Gen::Actividad.all.joins(
        :actividad_actividadtipo).where(
        "cor1440_gen_actividad_actividadtipo.actividadtipo_id IN (#{tipos})"
      ).where(wheref).sum(:mestizos)
      tin = Cor1440Gen::Actividad.all.joins(
        :actividad_actividadtipo).where(
        "cor1440_gen_actividad_actividadtipo.actividadtipo_id IN (#{tipos})"
      ).where(wheref).sum(:indigenas)
      tne = Cor1440Gen::Actividad.all.joins(
        :actividad_actividadtipo).where(
        "cor1440_gen_actividad_actividadtipo.actividadtipo_id IN (#{tipos})"
      ).where(wheref).sum(:negros)
  
      @cuerpotabla << {"desc": f[0], "tac": tac, "tm": tm, "th": th, 
        "perf": "Blancos: #{tbl}, Mestizos: #{tme}" +
      ", Indigenas: #{tin}, Negros: #{tne}"}
    end
    @coltotales = [1, 2, 3]
    @enctabla = ['Actividades', 'Total', 'Total Mujeres',
      'Total Hombres', 'Perfiles'
    ]

    respond_to do |format|
      format.html {  }
      format.json { head :no_content }
      format.js   { render 'sip/reportes/cambiatabla' }
    end
  end



end
