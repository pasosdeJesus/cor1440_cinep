class InvestigacionTrienal2021 < ActiveRecord::Migration[6.1] 

  def up
    execute <<-SQL
      SELECT setval('public.cor1440_gen_actividadpf_id_seq', 1000);

      DELETE FROM public.cor1440_gen_actividad_actividadpf 
        WHERE actividadpf_id>=13 AND actividadpf_id<=15;
      DELETE FROM public.cor1440_gen_actividadpf WHERE id>=13 AND id<=15;

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (340, 21, 
        'A1.1', 'Artículo publicado en revista especializada internacional.', 
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (341, 21, 
        'A1.2', 'Artículo publicado en revista especializada nacional (C)',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (342, 21, 
        'A1.3', 'Libro y/o capítulo de libro evaluado por pares que cubre la temática de interés.',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (343, 21, 
        'A1.4', 'Número de la revista Institucional Noche y Niebla.',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (344, 21, 
        'A2.1', 'Informe sobre la situación de los Derechos Humanos en Colombia con recomendaciones para generar mayores garantías.',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (345, 21, 
        'A2.2', 'Análisis de riesgo de organización étnico-territorial y líderes restitución del Urabá antioqueños y chocoano.',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (346, 21, 
        'A2.3', 'Informe - Violaciones a los derechos humanos e infracciones al derecho internacional humanitario (1996 - 2020) en la subregión del bajo, medio y alto Atrato (Chocó).',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (347, 21, 
        'A2.4', 'Informe - Conflictos socio - ambientales con ocasión dal fenomeno de despojo de tierras en territorioes de OETs del Bajo Atrato.',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (348, 21, 
        'A2.5', 'Documentos de política pública de seguimiento y recomendaciones sobre riesgos especiales de los mandos medios ex FARC en proceso de reincorporación.',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (349, 21, 
        'A3.1', 'Estrategia de litigio en el marco de un proceso de Restitución de Tierras para la comunidad étnica en el Chocó por lo menos con cuatro (4) ejes',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (350, 21, 
        'A3.2', 'Acción de protección colectiva, reparación colectiva, restitución material y jurídica de la tierra.',
        '', 48, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (351, 21, 
        'A3.3', 'Metodologías de diálogo diseñada, implementada y evaluada para el desarrollo de espacios inclusivos de participación para incorporar el enfoque de seguridad humana en políticas estatales específicas',
        '', 48, NULL, NULL, 322);
      -- DH
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 74 FROM cor1440_gen_actividadpf WHERE
         id>=340 AND id<=351);
     -- Gestión del Territorio
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 66 FROM cor1440_gen_actividadpf WHERE
         id>=340 AND id<=351);





      ------------- R5
      --  Investigar, evaluar y realizar un seguimiento sistemático y analítico tanto del proceso de implementación del Acuerdo Final, especialmente en asuntos de reforma rural, justicia transicional y participación política, como de las agendas e iniciativas locales de paz y desarrollo que, durante décadas, comunidades y organizaciones sociales han desarrollado en el marco del conflicto armado colombiano, de la mano de las autoridades tradicionales que han ido construyendo las comunidades para la regulación de sus conflictos.
      -- Conflicto y Paz ,  Educación para la Ciudadanía y la Paz

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (360, 21, 
        'A1.1', 'Artículo publicado en revista especializada internacional.',
        '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (361, 21, 
        'A1.2', 'Artículo publicado en revista especializada nacional (A, A1 B).',
         '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (362, 21, 
       'A1.3', 'Libro y/o capítulo de libro evaluado por pares que cubre las temáticas de interés.',
          '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (363, 21, 
        'A2.1', 'Sistematización de experiencia local de paz entre 2021 y 2024 con organizaciones populares, organizaciones sociales en los temas de Derechos Humanos, acuerdos territoriales, orientaciones sexuales y diversas, comunicación e incidencia y educación',
           '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (364, 21, 
        'A2.2', 'Documento de política pública sobre el estado efectivo de la implementación de los puntos 1, 2 y 5 del Acuerdo de Paz.',
         '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (365, 21, 
        'A2.3', 'Cartilla de diagnóstico y oportunidades para la incorporación de temas de paz en las escuelas rurales del país.',
         '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (366, 21, 
        'A2.4', 'Sistematización con comunidad educativa.',
         '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (367, 21, 
       'A3.1', 'Metodología para el desarrollo de planes de transformación que incorporan asuntos de paz y se implementan en contextos rurales.',
         '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (368, 21, 
        'A3.2', 'Proceso pedagógico de formación ciudadana dirigido a líderes sociales en territorios de frontera a partir de contenidos pedagógicos prácticos e innovadores sobre temas de paz y reconciliación.',
         '', 49, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (369, 21, 
        'A3.3', 'Diplomado de formación ciudadana dirigido a líderes sociales en territorios de frontera a partir de contenidos pedagógicos prácticos e innovadores sobre temas de paz.',
         '', 49, NULL, NULL, 322);
      -- Conflicto y Paz
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 62 FROM cor1440_gen_actividadpf WHERE
         id>=360 AND id<=369);
      -- Educación para la Ciudadanía y la Paz
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 64 FROM cor1440_gen_actividadpf WHERE
         id>=360 AND id<=369);


      ------------- R6
      -- Movimientos Sociales, Conflicto y Paz, Interculturalidad


      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (380, 21, 
        'A1.1', 'Actualización a la base de datos de luchas sociales.',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (381, 21, 
        'A1.2', 'Artículos en revista especializada nacional.',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (382, 21, 
        'A1.3', 'Libro y/o capítulo de libro evaluado por pares que cubre las temáticas de interés.',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (383, 21, 
        'A1.4', 'Número de la revista institucional Controversia.',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (384, 21, 
        'A2.1', 'Documento de política pública con recomendaciones para garantizar el derecho a la tierra y al territorio y de derechos de las mujeres rurales.',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (385, 21, 
        'A2.2', 'Documento como caja de herramientas de investigación local participativa por parte de indígenas, afros, pobladores urbano-populares, jóvenes, docentes, líderes y lideresas de Cartagena, Sierra Nevada y sur de La Guajira',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (386, 21, 
        'A2.3', 'Número de la revista institucional Cien Dias, que analizan la coyontura nacional y regional del país.',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (387, 21, 
        'A3.1', 'Estrategia propia y novedosa para la transformación no violenta de conflictos sociales en Colombia.',
        '', 50, NULL, NULL, 322);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, 
        nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, 
        formulario_id, heredade_id) VALUES (388, 21, 
        'A3.2', 'Ruta de transformación no violenta de conflictos basada en el dialogo, la mediación y la negociación para promover narrativas despolarizadas e incidir en el debate público para el abordaje de conflictividades.',
        '', 50, NULL, NULL, 322);

      -- Movimientos Sociales
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 70 FROM cor1440_gen_actividadpf WHERE
         id>=380 AND id<=388);
      -- Conflicto y Paz
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 62 FROM cor1440_gen_actividadpf WHERE
         id>=380 AND id<=388);
      -- Interculturalidad
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 72 FROM cor1440_gen_actividadpf WHERE
         id>=380 AND id<=388);

    SQL
  end


  def down
    execute <<-SQL
      DELETE FROM public.cor1440_gen_actividadpf_grupoexclusivo 
        WHERE (actividadpf_id>=340 AND actividadpf_id<=351) OR
        (actividadpf_id>=360 AND actividadpf_id<=369) OR
        (actividadpf_id>=380 AND actividadpf_id<=388);

      DELETE FROM public.cor1440_gen_actividadpf
        WHERE (id>=340 AND id<=351) OR
        (id>=360 AND id<=369) OR
        (id>=380 AND id<=388);

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (13, 21, 'A4', 'Producto de investigación sobre violencia y derechos humanos', '', 48, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (14, 21, 'A5', 'Producto de investigación sobre paz y educación', '', 49, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (15, 21, 'A6', 'Producto de investigación sobre movimientos y organizaciones sociales', '', 50, NULL, NULL, NULL);
    SQL
  end
end
