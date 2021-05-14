class PlanTrienal20212023 < ActiveRecord::Migration[6.1]
  def up
    p = Cor1440Gen::Proyectofinanciero.create!(
      id: 21,
      nombre: 'PLAN TRIENAL 2021-2023',
      fechainicio: '2021-01-01',
      fechacierre: '2023-12-31',
      referencia: 'PLAN TRIENAL 2021-2023',
      referenciacinep: 'PLAN TRIENAL 2021-2023',
      fechaformulacion: '2020-10-10',
      dificultad: 'M',
      estado: 'E',
      monto: 0,
      anotacionesdb: 'El CINEP/PPP, desde una opción preferencial por los excluidos, contribuye a la generación de condiciones para: (1) Un cierre histórico de brechas. (2) La ampliación de la democracia y la construcción de ciudadanías, en el marco de la implementación efectiva de los acuerdos y procesos de paz, desde un enfoque no polarizado de los conflictos que contribuyen en la reconciliación y la exigibilidad de derechos con enfoque diferenciado y de género. (3) Construir conocimiento de alta calidad científica orientado a la promoción de la paz, el diálogo democrático e intercultural y la protección de los derechos humanos por medio de investigaciones básicas aplicadas sobre las dinámicas territoriales y temporales de la violencia política; las interacciones entre movimientos sociales y de Estado en la red de conflictos sociales e injusticias que las motivan. Lo mismo que las brechas entre los diseños nacionales de las políticas de paz y su implementación efectiva en realidades territoriales y culturales que expresan una gran diversidad.'
    )

    execute <<-SQL


      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (35, 21, 'O1.', 'Los pueblos indígenas, afrodescendientes y campesinos de las comunidades rurales, fortalecidos en su capacidad de diálogo intercultural con otras organizaciones de la sociedad, exigen ante la institucionalidad pública la protección, respeto y goce de los derechos a la tierra, territorio, medio ambiente sano y educación rural. ');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (36, 21, 'O2.', 'Víctimas de violencias basadas en género y de otras violaciones de DDHH contribuyen a la construcción y salvaguarda de memoria y la garantía de sus derechos para la  superación de la impunidad. ''');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (37, 21, 'O3.', 'Organizaciones sociales, el sector privado y la institucionalidad estatal interactúan para la implementación de disposiciones del Acuerdo de Paz (acceso a la tierra, promoción de la agricultura campesina familiar y comunitaria y garantía de la seguridad humana y derechos sociales). ');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (38, 21, 'O4.', 'Investigar, analizar y evaluar las dinámicas de cambio y continuidad de la violencia política/criminal y de los patrones observados en las violaciones a los derechos humanos, que evidencian la persistencia de las tendencias de privatización de la violencia, a pesar de los acuerdos de desmovilización que ha experimentado Colombia.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (39, 21, 'O5.', 'Investigar, evaluar y realizar un seguimiento sistemático y analítico tanto del proceso de implementación del Acuerdo Final, especialmente en asuntos de reforma rural, justicia transicional y participación política, como de las agendas e iniciativas locales de paz y desarrollo que, durante décadas, comunidades y organizaciones sociales han desarrollado en el marco del conflicto armado colombiano, de la mano de las autoridades tradicionales que han ido construyendo las comunidades para la regulación de sus conflictos. ');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (40, 21, 'O6.', 'Investigar y analizar la forma como los movimientos y organizaciones sociales, de muy diverso tipo y diferente orientación, plantean reclamos públicos, comprenden la red de conflictos sociales e injusticias que los motivan y las diferentes formas en que el Estado ha respondido o intervenido por medio de acciones de fuerza o de iniciativas de diálogo y negociación para su solución. ');


      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (35, 21, NULL, 'I1', 'Organizaciones sociales de pueblos indígenas, afrodescendientes y campesinos presentan al menos 20 acciones ante organismos estatales como la Defensoría del Pueblo, Unidad de Restitución de Tierras, Unidad Nacional de Protección, Dirección de DDHH del Ministerio del Interior, Ministerio de Ambiente, Corporaciones Autónomas Regionales y el sistema judicial para la exigibilidad de sus derechos. ', 10, 35);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (36, 21, NULL, 'I2', 'El 90% de las escuelas rurales adoptan planes de transformación educativa construyen una agenda educativa de acuerdo a sus necesidades étnicas y culturales en 3 regiones del país.', 10, 35);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (37, 21, NULL, 'I1', 'Al menos 5 casos apoyados por CINEP/PPP y presentados por las organizaciones de víctimas de la violencia política y violencias basadas en género contribuyen en la construcción de la memoria y/o son considerados por el Sistema de Justicia Transicional, por organismos del Estado, organismos internacionales (Ej, CIDH, OCDE, ONU), en plataformas nacionales e internacionales.  ', 1, 36);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (38, 21, NULL, 'I2', 'Al menos 30 instituciones públicas, organizaciones de la sociedad civil, organizaciones sociales, universidades nacionales, universidades extranjeras y centros de investigación emplean la información que produce el CINEP para aportar al proceso de Verdad, Justicia, Reparación y No Repetición, como por ejemplo la búsqueda de personas desaparecidas, restitución de tierras, análisis del conflicto armado y la violencia, reparación de víctimas y construcción de memoria histórica. ', 10, 36);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (39, 21, NULL, 'I1', 'Al menos 6 iniciativas de los Planes de Acción para la Transformación Regional implementados con la participación de las comunidades campesinas, indígenas y afrodescendientes. ', 1, 37);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (40, 21, NULL, 'I2', 'En el 60% de los municipios PDET se han implementado estrategias que cualifican el debate público (posiciona nuevas narrativas) y escenarios de diálogo y concertación multiactor (activistas, autoridades civiles y policía nacional) encaminados a brindar mayores garantías para ejercer el derecho a protestar.', 1, 37);

      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (41, 21, NULL, 'I1.1', 'Dos (2) artículos publicados en revistas especializadas internacionales. ', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (42, 21, NULL, 'I1.2', 'Tres (3) artículos publicado en revistas especializadas nacionales (C)', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (43, 21, NULL, 'I1.3', 'Dos (2) libros y/o capítulos de libro evaluados por pares que cubren las temáticas de interés. ', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (44, 21, NULL, 'I1.4', 'Seis (6) números de la revista Institucional Noche y Niebla. ', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (45, 21, NULL, 'I2.1', 'Tres (3) informes sobre la situación de los Derechos Humanos en Colombia con recomendaciones para generar mayores garantías.', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (46, 21, NULL, 'I2.2', 'Dos (2) análisis de riesgos de organizaciones étnico-territoriales y líderes restitución del Urabá antioqueños y chocoano. ', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (47, 21, NULL, 'I2.3', 'Un (1) informe - Violaciones a los derechos humanos e infracciones al derecho internacional humanitario (1996 - 2020) en la subregión del bajo, medio y alto Atrato (Chocó). ', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (48, 21, NULL, 'I2.4', 'Un (1) informe - Conflictos socio - ambientales con ocasión dal fenomeno de despojo de tierras en territorioes de OETs del Bajo Atrato.', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (49, 21, NULL, 'I2.5', 'Un (1) documentos de política pública de seguimiento y recomendaciones sobre riesgos especiales de los mandos  medios ex FARC en proceso de reincorporación.', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (50, 21, NULL, 'I3.1', 'Tres (3) estrategias de litigio en el marco de un proceso de Restitución de Tierras para la comunidad étnica en el Chocó por lo menos con cuatro (4) ejes ', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (51, 21, NULL, 'I3.2', 'Tres (3) acciones de protección colectiva, reparación colectiva, restitución material y jurídica de la tierra. ', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (52, 21, NULL, 'I3.3', 'Una (1) metodologías de diálogo diseñada, implementada y evaluada para el desarrollo de espacios inclusivos de participación para incorporar el enfoque de seguridad humana en políticas estatales específicas', 1, 38);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (54, 21, NULL, 'I1.1', 'Un (1) artículo publicado en revistas especializada internacional. ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (55, 21, NULL, 'I1.2', 'Dos (2) artículos publicado en revistas especializadas nacionales (A, A1 B). ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (56, 21, NULL, 'I1.3', 'Dos (2) libros y/o capítulos de libro evaluados por pares que cubren las temáticas de interés. ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (57, 21, NULL, 'I2.1', 'Quince (15) sistematizaciones de experiencias locales de paz entre 2021 y 2024 con (21) organizaciones populares, (4) organizaciones sociales en los temas de Derechos Humanos, acuerdos territoriales, orientaciones sexuales y diversas, comunicación e incidencia y educación en (6) regiones de Colombia ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (58, 21, NULL, 'I2.2', 'Tres (3) documentos de política pública sobre el estado efectivo de la implementación de los puntos 1, 2 y 5 del Acuerdo de Paz. ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (59, 21, NULL, 'I2.3', 'Tres (3) cartillas de diagnóstico y oportunidades para la incorporación de temas de paz en las escuelas rurales del país. ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (60, 21, NULL, 'I2.4', 'Dos (2) sistematizaciones con las comunidades educativas. Una (1) sobre las experiencias del Chocó, sur del Tolima, Sierra Nevada de Santa Marta y La Guajira sobre los procesos educativos y organizativos propios, con perspectiva intercultural y de género. ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (62, 21, NULL, 'I3.1', 'Una (1) metodologías para el desarrollo de planes de transformación  que incorporan asuntos de paz y se implementan en contextos rurales.', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (63, 21, NULL, 'I3.2', 'Un (1) procesos pedagógico de formación ciudadana dirigidos a líderes sociales  en territorios de frontera a partir de contenidos pedagógicos prácticos e innovadores sobre temas de paz y reconciliación. ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (64, 21, NULL, 'I3.3', 'Dos (2) diplomados de formación ciudadana dirigidos a líderes sociales en territorios de frontera a partir de contenidos pedagógicos prácticos e innovadores sobre temas de paz. ', 1, 39);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (65, 21, NULL, 'I1.1', 'Tres (3) actualizaciones a la base de datos de luchas sociales.', 1, 40);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (66, 21, NULL, 'I1.2', 'Tres (3) artículos en revistas especializadas nacionales. ', 1, 40);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (67, 21, NULL, 'I1.3', 'Tres (3) libros y/o capítulos de libro evaluados por pares que cubren las temáticas de interés. ', 1, 40);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (68, 21, NULL, 'I1.4', 'Seis (6) números de la revista Institucional Controversia.', 1, 40);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (69, 21, NULL, 'I2.1', 'Dos (2) documentos de política pública con recomendaciones para garantizar el derecho a la tierra y al territorio y de derechos de las mujeres rurales. ', 1, 40);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (70, 21, NULL, 'I2.2', 'Siete (7) documentos como cajas de herramientas de investigación local participativa por parte de indígenas, afros, pobladores urbano-populares, jóvenes, docentes, líderes y lideresas de Cartagena, Sierra Nevada y sur de La Guajira ', 1, 40);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (71, 21, NULL, 'I3.1', 'Una (1) estrategia propias y novedosas para la transformación no violenta de conflictos sociales en Colombia. ', 1, 40);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES 
      (72, 21, NULL, 'I3.2', 'Una (1) ruta de transformación no violenta de conflictos basada en el dialogo, la mediación y la negociación para promover narrativas despolarizadas e incidir en el debate público para el abordaje de conflictividades. ', 1, 40);


      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (45, 21, 35, 'R1', 'Los pueblos indígenas, afrodescendientes y campesinos de las comunidades rurales, fortalecidos en su capacidad de diálogo intercultural con otras organizaciones de la sociedad, exigen ante la institucionalidad pública la protección, respeto y goce de los derechos a la tierra, territorio, medio ambiente sano y educación rural. ');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (46, 21, 36, 'R2', 'Víctimas de violencias basadas en género y de otras violaciones de DDHH contribuyen a la construcción y salvaguarda de memoria y la garantía de sus derechos para la  superación de la impunidad. ''');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (47, 21, 37, 'R3', 'Organizaciones sociales, el sector privado y la institucionalidad estatal interactúan para la implementación de disposiciones del Acuerdo de Paz (acceso a la tierra, promoción de la agricultura campesina familiar y comunitaria y garantía de la seguridad humana y derechos sociales). ');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (48, 21, 38, 'R4', 'Investigar, analizar y evaluar las dinámicas de cambio y continuidad de la violencia política/criminal y de los patrones observados en las violaciones a los derechos humanos, que evidencian la persistencia de las tendencias de privatización de la violencia, a pesar de los acuerdos de desmovilización que ha experimentado Colombia.');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (49, 21, 39, 'R5', 'Investigar, evaluar y realizar un seguimiento sistemático y analítico tanto del proceso de implementación del Acuerdo Final, especialmente en asuntos de reforma rural, justicia transicional y participación política, como de las agendas e iniciativas locales de paz y desarrollo que, durante décadas, comunidades y organizaciones sociales han desarrollado en el marco del conflicto armado colombiano, de la mano de las autoridades tradicionales que han ido construyendo las comunidades para la regulación de sus conflictos.');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (50, 21, 40, 'R6', 'Investigar y analizar la forma como los movimientos y organizaciones sociales, de muy diverso tipo y diferente orientación, plantean reclamos públicos, comprenden la red de conflictos sociales e injusticias que los motivan y las diferentes formas en que el Estado ha respondido o intervenido por medio de acciones de fuerza o de iniciativas de diálogo y negociación para su solución. ');

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (10, 21, 'A1', 'Caso apoyado por el CINEP/PPP que contribuye en la construcción de memoría y/o es considerado por el SJT, organismos del Estado u organismos internacionales.', 'Caso apoyado por CINEP/PPP y presentados por las organizaciones de víctimas de la violencia política y violencias basadas en género contribuyen en la construcción de la memoria y/o son considerados por el Sistema de Justicia Transicional, por organismos del Estado, organismos internacionales (Ej, CIDH, OCDE, ONU), en plataformas nacionales e internacionales.  ', 46, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (11, 21, 'A3.1', 'Iniciativa de los Planes de Acción para la Transformación Regional implementada', 'Iniciativas de los Planes de Acción para la Transformación Regional implementados con la participación de las comunidades campesinas, indígenas y afrodescendientes. ', 47, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (12, 21, 'A3.2', 'Estrategia en municipio PDET para brindar garantías para protestar.', 'En municipios PDET se ha implementado estrategia que cualifican el debate público (posiciona nuevas narrativas) y escenarios de diálogo y concertación multiactor (activistas, autoridades civiles y policía nacional) encaminados a brindar mayores garantías para ejercer el derecho a protestar.', 47, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (13, 21, 'A4', 'Producto de investigación sobre violencia y derechos humanos', '', 48, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (14, 21, 'A5', 'Producto de investigación sobre paz y educación', '', 49, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (15, 21, 'A6', 'Producto de investigación sobre movimientos y organizaciones sociales', '', 50, NULL, NULL, NULL);

      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (101, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (1, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (61, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (69, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (4, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (9, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (10, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (103, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (105, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (62, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (74, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (64, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (66, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (72, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (70, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (63, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (75, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (65, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (67, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (73, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (71, 21);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.grupo_proyectofinanciero 
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_actividadpf
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_resultadopf
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_indicadorpf
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_objetivopf
        WHERE proyectofinanciero_id=21;
    SQL
    p = Cor1440Gen::Proyectofinanciero.where(id: 21)
    if p.count == 1
      p[0].destroy
    end
  end
end
