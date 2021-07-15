class PlaneaProductos2021 < ActiveRecord::Migration[6.1]
  def up

    # O4
    (1..2).each do |i|
      execute <<-SQL
        INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{300+i}, 21, 20, 'Artículo #{i} en el trienio publicado en revista especializada internacional.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 340);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{310+i}, 21, 3, 'Artículo #{i} en el trienio publicado en revista especializada nacional (C)', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 341);
    SQL
    end
    (1..2).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{320+i}, 21, 19, 'Libro y/o capítulo de libro #{i} en el trienio evaluado por pares que cubre la temática de interés.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 342);
    SQL
    end
    (1..6).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{330+i}, 21, 21, 'Número #{i} en el trienio de la revista Institucional Noche y Niebla.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 343);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{340+i}, 21, 4, 'Informe #{i} en el trienio sobre la situación de los Derechos Humanos en Colombia con recomendaciones para generar mayores garantías.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 344);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{350+i}, 21, 4, 'Análisis #{i} en el trienio de riesgo de organización étnico-territorial y líderes restitución del Urabá antioqueños y chocoano.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 345);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{360+i}, 21, 4, 'Informe #{i} en el trienio - Violaciones a los derechos humanos e infracciones al derecho internacional humanitario (1996 - 2020) en la subregión del bajo, medio y alto Atrato (Chocó).', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 346);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{370+i}, 21, 4, 'Informe #{i} en el trienio - Conflictos socio - ambientales con ocasión dal fenomeno de despojo de tierras en territorioes de OETs del Bajo Atrato.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 347);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{380+i}, 21, 17, 'Documento de política pública #{i} en el trienio de seguimiento y recomendaciones sobre riesgos especiales de los mandos medios ex FARC en proceso de reincorporación.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 348);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{390+i}, 21, 1, 'Estrategia de litigio #{i} en el trienio en el marco de un proceso de Restitución de Tierras para la comunidad étnica en el Chocó por lo menos con cuatro (4) ejes', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 349);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{400+i}, 21, 1, 'Acción de protección colectiva #{i} en el trienio, reparación colectiva, restitución material y jurídica de la tierra.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 350);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{410+i}, 21, 1, 'Metodología #{i} de diálogo diseñada, implementada y evaluada para el desarrollo de espacios inclusivos de participación para incorporar el enfoque de seguridad humana en políticas estatales específicas', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 351);
    SQL

    end

    # O5
    (1..1).each do |i|
      cmd="INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{500+i}, 21, 20, 'Artículo #{i} en el trienio publicado en revista especializada internacional.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 360);"
      execute <<-SQL
        #{cmd}
      SQL
    end
    (1..2).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{510+i}, 21, 3, 'Artículo #{i} en el trienio publicado en revista especializada nacional (A, A1 B).', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 361);
    SQL
    end
    (1..2).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{520+i}, 21, 19, 'Libro y/o capítulo de libro #{i} en el trienio evaluado por pares que cubre las temáticas de interés.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 362);
    SQL
    end
    (1..15).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{530+i}, 21, 24, 'Sistematización #{i} en el trienio de experiencia local de paz entre 2021 y 2024 con organizaciones populares, organizaciones sociales en los temas de Derechos Humanos, acuerdos territoriales, orientaciones sexuales y diversas, comunicación e incidencia y educación', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 363);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{545+i}, 21, 17, 'Documento de política pública #{i} en el trienio sobre el estado efectivo de la implementación de los puntos 1, 2 y 5 del Acuerdo de Paz.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 364);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{550+i}, 21, 8, 'Cartilla #{i} en el trienio de diagnóstico y oportunidades para la incorporación de temas de paz en las escuelas rurales del país.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 365);
    SQL
    end
    (1..2).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{560+i}, 21, 24, 'Sistematización #{i} en el trienio con comunidad educativa.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 366);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{570+i}, 21, 1, 'Metodología #{i} en el trienio para el desarrollo de planes de transformación que incorporan asuntos de paz y se implementan en contextos rurales.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 367);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{580+i}, 21, 18, 'Proceso pedagógico #{i} en el trienio de formación ciudadana dirigido a líderes sociales en territorios de frontera a partir de contenidos pedagógicos prácticos e innovadores sobre temas de paz y reconciliación.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 368);
    SQL
    end
    (1..2).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{590+i}, 21, 18, 'Diplomado #{i} en el trienio de formación ciudadana dirigido a líderes sociales en territorios de frontera a partir de contenidos pedagógicos prácticos e innovadores sobre temas de paz.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 369);
    SQL
    end


    # O6
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{700+i}, 21, 24, 'Actualización #{i} en el trienio a la base de datos de luchas sociales.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 380);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{710+i}, 21, 3, 'Artículos #{i} en el trienio en revista especializada nacional.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 381);
    SQL
    end
    (1..3).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{720+i}, 21, 19, 'Libro y/o capítulo de libro #{i} en el trienio evaluado por pares que cubre las temáticas de interés.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 382);
    SQL
    end
    (1..6).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{730+i}, 21, 22, 'Número #{i} en el trienio de la revista institucional Controversia.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 383);
    SQL
    end
    (1..2).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{740+i}, 21, 17, 'Documento de política pública #{i} en el trienio con recomendaciones para garantizar el derecho a la tierra y al territorio y de derechos de las mujeres rurales.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 384);
    SQL
    end
    (1..7).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{750+i}, 21, 15, 'Documento como caja de herramientas #{i} en el trienio de investigación local participativa por parte de indígenas, afros, pobladores urbano-populares, jóvenes, docentes, líderes y lideresas de Cartagena, Sierra Nevada y sur de La Guajira', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 385);
    SQL
    end
    (1..9).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{760+i}, 21, 23, 'Número de la revista #{i} en el trienio institucional Cien Dias, que analizan la coyontura nacional y regional del país.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 386);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{770+i}, 21, 1, 'Estrategia propia y novedosa #{i} en el trienio para la transformación no violenta de conflictos sociales en Colombia.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 387);
    SQL
    end
    (1..1).each do |i|
      execute <<-SQL
         INSERT INTO productopf (id, proyectofinanciero_id, tipoproductopf_id, detalle, fechaplaneada, created_at, updated_at, fechainiprod, actividadpf_id)  VALUES (#{780+i}, 21, 1, 'Ruta de transformación no violenta de conflictos #{i} en el trienio basada en el dialogo, la mediación y la negociación para promover narrativas despolarizadas e incidir en el debate público para el abordaje de conflictividades.', '2021-08-08', '2021-07-14', '2021-07-14', '2021-06-01', 388);
    SQL
    end
  end

  def down
    execute <<-SQL
      DELETE FROM productopf WHERE id>=300 and id<=781;
    SQL
  end
end
