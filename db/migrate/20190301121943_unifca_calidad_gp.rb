class UnifcaCalidadGp < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero 
        SET nombre='SISTEMA DE CALIDAD', 
          referencia='SISTEMA DE CALIDAD',
          referenciacinep='SISTEMA DE CALIDAD',
          monto=0, 
          montoej=0,
          presupuestototal=0,
          montopesos=0
        WHERE id='19';

        INSERT INTO grupo_proyectofinanciero (grupo_id, proyectofinanciero_id)
          (SELECT id, '19' FROM sip_grupo WHERE nombre LIKE 'Línea%');


      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (25, 19, 'MISIÓN', 'Apostamos por la vida. Trabajamos por una sociedad justa, sostenible y en paz.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (26, 19, 'VISIÓN', 'En el año 2020 somos un centro social orientado por la Compañía de Jesús que ha desarrollado propuestas para la construcción de región y de nación, encaminadas a la protección y promoción de la vida, los derechos humanos, el desarrollo sostenible y la paz.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (27, 19, 'OC1', 'Analizar y comprender las dinámicas regionales, nacionales e internacionales, por medio de la investigación, sistematización y acompañamiento a los procesos de construcción de paz y reconciliación.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (28, 19, 'OC2', 'Fortalecer el tejido social, mediante el apoyo a los actores sociales en sus procesos productivos, organizativos, educativos y de construcción de Estado.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (29, 19, 'OC3', 'Construir propuestas regionales, alternativas y sostenibles de desarrollo humano y social.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (30, 19, 'OC4', 'Incidir en la construcción de lo público mediante la difusión de productos investigativos, la participación activa en diversos escenarios y el acompañamiento a procesos comunitarios en el país.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (31, 19, 'OC5', 'Garantizar la sostenibilidad, permanencia y desarrollo del CINEP y del Programa por la Paz a corto, mediano y largo plazo.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (32, 19, 'OC6', 'Mantener personal competente y comprometido para el desarrollo de la Misión.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (33, 19, 'OC7', 'Mejorar continuamente la eficacia del sistema de gestión de la calidad.');

      -- OC1 118  27
      -- OC2 119  28
      -- OC3 120  29
      -- OC4 121  30
      -- OC5 122  31
      -- OC6 123  32
      -- OC7 124  33
      UPDATE cor1440_gen_resultadopf 
        SET numero='P06', 
          resultado='Formulacion y Gestion de proyectos (También OC5)', 
          objetivopf_id=29 
        WHERE id=21;
      UPDATE cor1440_gen_resultadopf 
        SET numero='P07', 
          resultado='Seguimiento y Control',
          objetivopf_id=31 
        WHERE id=22;

      DELETE FROM cor1440_gen_objetivopf WHERE id = 21;

      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (30, 19, 31, 'P01', 'Mejorar continuamente la eficacia del sistema de gestión de la calidad.'); -- 154
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (31, 19, 33, 'P02', 'Gestión de Calidad'); --155
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (32, 19, 27, 'P03', 'Investigación y Construcción de Información (también OC4)'); --156
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (33, 19, 28, 'P04', 'Acompañamiento, Educación e Incidencia.'); --157
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (34, 19, 30, 'P05', 'Comunicacion e Incidencia'); --158
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (37, 19, 32, 'P08', 'Gestión Humana'); --161
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (38, 19, 31, 'P09', 'Recursos Financieros'); --162
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (39, 19, 31, 'P10', 'Recursos Documentales'); --163
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (40, 19, 30, 'P11', 'Recursos Físicos y Tecnológicos (Tambień OC5)'); --164

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (126, 19, 'RE-GH-09', 'CONTROL DE ASISTENCIA A CAPACITACIONES', '', 37, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (127, 19, 'RE-GH-19', 'ACTA DE REUNIÓN', '', 37, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (128, 19, 'RE-RF-02', 'SOLICITUD DE ANTICIPO', '', 38, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (129, 19, 'RE-RF-03', 'SOLICITUD DE TIQUETES', '', 38, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (130, 19, 'RE-RF-06', 'LEGALIZACIÓN DE ANTICIPOS', '', 38, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (131, 19, 'RE-RF-08', 'RELACIÓN DE TRANSPORTES URBANOS', '', 38, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (125, 19, 'RE-AE-03', 'CONTROL VIÁTICOS ASISTENCIA A CAPACITACIONES', '', 33, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id) VALUES (132, 19, 'RE-AE-02', 'EVALUACIÓN A PROCESO FORMATIVO', '', 33, NULL);  
    SQL
  end
  def down
  end
end
