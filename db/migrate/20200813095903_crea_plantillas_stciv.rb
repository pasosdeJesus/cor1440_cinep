class CreaPlantillasStciv < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO heb412_gen_plantillahcm (id, ruta, fuente, licencia, vista,
        nombremenu, filainicial) VALUES 
        (20, 'Actividades/listado_actoressociales_stciv.ods', 'Pasos de Jesús',
        'Dominio Público', 'Actorsocial',
        'Listado STCIV', 4);
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (160, 20, 'id', 'A');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (161, 20, 'nombre', 'B');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (162, 20, 'sectores', 'C');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (163, 20, 'pais', 'D');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (164, 20, 'regiones', 'E');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (165, 20, 'nivelgeostciv', 'F');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (166, 20, 'temastciv', 'G');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (167, 20, 'nivelrespstciv', 'H');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (168, 20, 'anotaciones', 'I');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (169, 20, 'creado_en', 'J');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (170, 20, 'actualizado_en', 'K');

      INSERT INTO heb412_gen_plantillahcm (id, ruta, fuente, licencia, vista,
        nombremenu, filainicial) VALUES 
        (21, 'Actividades/listado_actoressociales_stciv_contactos.ods', 
        'Pasos de Jesús', 'Dominio Público', 'Actorsocial',
        'Listado STCIV con Datos de Contacto', 4);

INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (180, 21, 'id', 'A');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (181, 21, 'nombre', 'B');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (182, 21, 'sectores', 'C');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (183, 21, 'pais', 'D');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (184, 21, 'regiones', 'E');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (185, 21, 'nivelgeostciv', 'F');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (186, 21, 'temastciv', 'G');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (187, 21, 'nivelrespstciv', 'H');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (188, 21, 'anotaciones', 'I');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (189, 21, 'contactos_nombres', 'J');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (190, 21, 'contactos_cargos', 'K');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (191, 21, 'contactos_correos', 'L');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (192, 21, 'telefono', 'M');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (193, 21, 'fax', 'N');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (194, 21, 'web', 'O');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (195, 21, 'creado_en', 'P');
INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, nombrecampo, columna) VALUES (196, 21, 'actualizado_en', 'Q');

    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM heb412_gen_plantillahcm WHERE id IN (20,21);
      DELETE FROM heb412_gen_campoplantillahcm WHERE id>=160 AND id<=170;
      DELETE FROM heb412_gen_campoplantillahcm WHERE id>=180 AND id<=196;
    SQL
  end
end
