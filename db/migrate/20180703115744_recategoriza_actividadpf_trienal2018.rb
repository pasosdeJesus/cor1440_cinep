class RecategorizaActividadpfTrienal2018 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      -- INVESTIGACION
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (32, 18, 'AI1', 
        'INVESTIGACIÓN: RECOLECCIÓN, ANÁLISIS Y VERIFICACIÓN DE INFORMACIÓN',
        'Ejemplos: Consulta de fuentes, entrevistas, revisión de archivos y bases de datos, debate interno, debate externo, evaluación de pares, reunión de grupos focales, encuesta, observación participante, revisión/categorización de prensa',
        19, NULL);
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AI2', 
        titulo='INVESTIGACIÓN: SISTEMATIZACIÓN DE INFORMACIÓN Y PRODUCCIÓN DE CONOCIMIENTO',
        descripcion='Ejemplos: trabajo de campo, análisis crítico del discurso',
        actividadtipo_id=NULL
        WHERE id='27';
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AI3', 
        titulo='INVESTIGACIÓN: REPRESENTACIÓN EN EVENTOS ACADÉMICOS',
        descripcion='Ejemplos: Participación en  panel, participación en seminario, participación en congresos, participación en cátedras, participación en evento de socialización de investigación, participación en evento académico, divulgación de conocimiento científico',
        actividadtipo_id=NULL
        WHERE id='31';
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AI4', 
        titulo='INVESTIGACIÓN: ORGANIZACIÓN DE EVENTOS ACADÉMICOS',
        descripcion='Ejemplos: Organización de eventos de investigación  como paneles, seminarios, congresos, debates, cátedras, conversatorios, eventos de socialización de investigación y demás eventos académicos',
        actividadtipo_id=NULL
        WHERE id='20';
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (33, 18, 'AI5', 
        'INVESTIGACIÓN: OTRAS',
        '',
        19, NULL);

      -- FORMACIÓN
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AF1', 
        titulo='FORMACIÓN: ORGANIZACIÓN Y DESARROLLO DE ESPACIOS DE FORMACIÓN',
        descripcion='Ejemplos: talleres y espacios de capacitación, encuentros, intercambios, participación en redes y desarrollo de redes, mesas de trabajo, seguimiento a la formación',
        actividadtipo_id=NULL
        WHERE id='21';
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (34, 18, 'AF2', 
        'FORMACIÓN: ASESORIA',
        '',
        19, NULL);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (35, 18, 'AF3', 
        'FORMACIÓN: OTRAS',
        '',
        19, NULL);

      -- ACOMPAÑAMIENTO
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AA1', 
        titulo='ACOMPAÑAMIENTO: REUNIONES CON ACTORES DE SENTIDO',
        descripcion='Ejemplos: visitas de campo, reuniones comunitarias, reuniones con entidades del Estado, reuniones con sectores privados, reunión con líderes, reuniones con juntas de acción comunal',
        actividadtipo_id=NULL
        WHERE id='24';
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (36, 18, 'AA2', 
        'ACOMPAÑAMIENTO: A ACTORES DE SENTIDO EN ACTIVIDADES DE LA COMUNIDAD',
        'Ejemplos: asambleas, reuniones de juntas directivas,  pasantías, recorrido con comunidad, cartografía social, mapas andantes/parlantes',
        19, NULL);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (37, 18, 'AA3', 
        'ACOMPAÑAMIENTO: APOYOS MATERIALES PARA ACTORES DE SENTIDOS',
        'Ejemplos: Fondos de emergencia, ayuda humanitaria',
        19, NULL);
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AA4', 
        titulo='ACOMPAÑAMIENTO: OTRAS',
        descripcion='Ejemplos: Planes de protección',
        actividadtipo_id=NULL
        WHERE id='30';

      -- INCIDENCIA
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AD1', 
        titulo='INCIDENCIA: REUNIONES CON ACTORES  DE MISIÓN, ESTRATÉGICOS Y DE INCIDENCIA',
        descripcion='Ejemplos: Reuniones con actores decisores/tomadores de decisión, cabildeo',
        actividadtipo_id=NULL
        WHERE id='120';
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AD2', 
        titulo='INCIDENCIA: PARTICIPACIÓN EN REDES Y MESAS DE TRABAJO MULTIACTOR',
        actividadtipo_id=NULL
        WHERE id='26';
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (38, 18, 'AD3', 
        'INCIDENCIA: ORGANIZACIÓN DE ESPACIOS MULTIACTOR',
        '',
        19, NULL);
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AD4', 
        titulo='INCIDENCIA: ACCIONES PÚBLICAS NACIONALES E INTERNACIONALES',
        descripcion='Campañas, giras de incidencia, agendas de incidencia, ruedas de prensa',
        actividadtipo_id=NULL
        WHERE id='29';
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (39, 18, 'AD5', 
        'INCIDENCIA: OTRAS',
        'Ejemplos: Litigio, litigio estratégico, asesoría jurídica, asistencia a audiencias, acciones jurídicas con actores gubernamentales o con actores no gubernamentales.',
        19, NULL);

      -- COMUNICACIÓN
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AC1', 
        titulo='COMUNICACIÓN: PUBLICACIONES',
        descripcion='Productos editoriales para público general: estudios, informes, libros, cartillas, lanzamiento de libros, coordinación y gestión editorial, publicación de actor de sentido. corto / cápsula / publicidad para un libro',
        actividadtipo_id=NULL
        WHERE id='22';
      UPDATE cor1440_gen_actividad_actividadpf SET actividadpf_id='22' 
        WHERE actividadpf_id='23'; -- ESTUDIOS E INFORMES
      DELETE FROM cor1440_gen_actividadpf WHERE id=23;
      UPDATE cor1440_gen_actividadpf SET nombrecorto='AC2', 
        titulo='COMUNICACIÓN: PRODUCCIÓN AUDIOVISUAL',
        descripcion='Programas de radio, productos audiovisuales',
        actividadtipo_id=NULL
        WHERE id='25';

      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (86, 18, 'AC3', 
        'COMUNICACIÓN: DIVULGACIÓN DE CONOCIMIENTO',
        'Ejemplos: Ferias del libro, participación en espacios académicos para divulgar productos, diálogos CINEP/PPP',
        19, NULL);

      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (87, 18, 'AC4', 
        'COMUNICACIÓN: PRODUCCIÓN Y ANIMACIÓN DE REDES SOCIALES',
        '',
        19, NULL);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, 
        titulo, descripcion, resultadopf_id, actividadtipo_id)
        VALUES (88, 18, 'AC5', 
        'COMUNICACIÓN: OTRAS',
        '',
        19, NULL);
      DELETE FROM cor1440_gen_actividadpf WHERE id=28; -- PRODUCTOS AUDIOVISUALES
    SQL
  end
end
