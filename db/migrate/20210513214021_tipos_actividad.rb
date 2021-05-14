class TiposActividad < ActiveRecord::Migration[6.1]

  def up
    p = Cor1440Gen::Proyectofinanciero.create!(
      id: 22,
      nombre: 'TIPOS DE ACTIVIDADES COMUNES',
      fechainicio: '2021-01-01',
      fechacierre: nil,
      referencia: 'TIPOS DE ACTIVIDADES COMUNES',
      referenciacinep: 'TIPOS DE ACTIVIDADES COMUNES',
      fechaformulacion: '2020-10-10',
      dificultad: 'M',
      estado: 'E',
      monto: 0,
      anotacionesdb: ''
    )

    execute <<-SQL

      INSERT INTO public.cor1440_gen_objetivopf 
        (id, proyectofinanciero_id, numero, objetivo) VALUES 
        (41, 22, 'OG.', 
        'Sistematizar los tipos de actividades más comunes del CINEP/PPP.');

      INSERT INTO public.cor1440_gen_resultadopf 
        (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES 
        (51, 22, 41, 'ACO', 'Acompañamiento');
      INSERT INTO public.cor1440_gen_resultadopf 
        (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES 
        (52, 22, 41, 'FOR', 'Formación');
      INSERT INTO public.cor1440_gen_resultadopf 
        (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES 
        (53, 22, 41, 'INV', 'Investigación');
      INSERT INTO public.cor1440_gen_resultadopf 
        (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES 
        (54, 22, 41, 'INC', 'Incidencia');
      INSERT INTO public.cor1440_gen_resultadopf 
        (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES 
        (55, 22, 41, 'COM', 'Comunicación');
      INSERT INTO public.cor1440_gen_resultadopf
        (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES 
        (56, 22, 41, 'GES', 'Gestión'); 

      SELECT setval('cor1440_gen_actividadpf_id_seq', 1000);

      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (300, 22, 'AA1', 'Acompañamiento: Reuniones e Intercambios con Actores de Sentido', '', 
        51, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (301, 22, 'AA2', 'Acompañamiento: A actores de sentido en actividades de incidencia (movilización, cabildeo, mesas de negociación, etc)', '', 
        51, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (302, 22, 'AA3', 'Acompañamiento: Apoyo a actores de sentido para la producción de materiales para el desarrollo comunitario y educativo', '', 
        51, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (303, 22, 'AA4', 'Acompañamiento: Análisis de información con fines de acompañamiento', '', 
        51, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (304, 22, 'AA5', 'Acompañamiento: Otras', '', 51, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (305, 22, 'AF1', 'Formación: Organización y desarrollo de espacios de formación', '', 
        52, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (306, 22, 'AF2', 'Formación: Asesoría', '', 52, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (307, 22, 'AF3', 'Formación: Análisis y producción de conocimiento con fines de formación', '', 
        52, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (308, 22, 'AF4', 'Formación: Otras (incluye apoyo sanitario/humanitario)', '', 
        52, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (309, 22, 'AI1', 'Investigación: Sistematización y análisis de información', '', 
        53, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (310, 22, 'AI2', 'Investigación: Producción de conocimiento académico ', '', 
        53, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (311, 22, 'AI3', 'Investigación: Participacion en eventos académicos nacionales e internacionales', '', 
        53, NULL, NULL, NULL);
       INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (312, 22, 'AI4', 'Investigación: Organización de eventos académicos', '', 
        53, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (313, 22, 'AI5', 'Investigación: Intercambio de conocimiento con organizaciones sociales y comunidades en los territorios', '', 
        53, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (314, 22, 'AI6', 'Investigación: Otras', '', 53, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (315, 22, 'AI7', 'Investigación: Participación como evaluador en revistas, libros, articulaos academicos. (cinep- externos)', '', 
        53, NULL, NULL, NULL);
       INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (316, 22, 'AD1', 'Incidencia: Reuniones con actores de misión, estratégicos y de incidencia', '', 
        54, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (317, 22, 'AD2', 'Incidencia: Participación en redes y mesas de trabajo multiactor', '', 
        54, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (318, 22, 'AD3', 'Incidencia: Organización de espacios multiactor', '', 
        54, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (319, 22, 'AD4', 'Incidencia: Acciones públicas nacionales e internacionales de cabildeo politico', '', 
        54, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (320, 22, 'AD5', 'Incidencia: Otras', '', 
        54, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (321, 22, 'AD6', 'Incidencia: Propiciar espacios de dialogo sobre conflicto en los territorios', '', 
        54, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (322, 22, 'AC1', 'Comunicaciones: Publicaciones', '', 
        55, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (323, 22, 'AC2', 'Comunicaciones: Producción Audiovisual', '', 
        55, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (324, 22, 'AC3', 'Comunicaciones: Divulgación de conocimiento', '', 
        55, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (325, 22, 'AC4', 'Comunicaciones: Producción y animación de redes sociales', '', 
        55, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (326, 22, 'AC5', 'Comunicaciones: Otras', '', 
        55, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (327, 22, 'AG1', 'Gestión: Reuniones para gestionar proyectos, recursos y de seguimiento a proyectos vigentes ', '', 
        56, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (328, 22, 'AG2', 'Gestión: Reuniones de análisis de coyuntura y participación en reuniones políticas con actores estratégicos ', '', 
        56, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf 
        (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, 
        resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES 
        (329, 22, 'AG3', 'Gestión: Participación en juntas directivas', '', 
        56, NULL, NULL, NULL);


      INSERT INTO public.grupo_proyectofinanciero 
        (grupo_id, proyectofinanciero_id) 
        (SELECT grupo_id, 22 FROM grupo_proyectofinanciero as sg JOIN
          sip_grupo as g ON sg.grupo_id=g.id
          WHERE sg.grupo_id=21 AND
          g.fechadeshabilitacion IS NULL);

    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.grupo_proyectofinanciero 
        WHERE proyectofinanciero_id=22;
      DELETE FROM public.cor1440_gen_actividadpf
        WHERE proyectofinanciero_id=22;
      DELETE FROM public.cor1440_gen_resultadopf
        WHERE proyectofinanciero_id=22;
      DELETE FROM public.cor1440_gen_indicadorpf
        WHERE proyectofinanciero_id=22;
      DELETE FROM public.cor1440_gen_objetivopf
        WHERE proyectofinanciero_id=22;
    SQL
    p = Cor1440Gen::Proyectofinanciero.where(id: 22)
    if p.count == 1
      p[0].destroy
    end
  end
end
