class ListadoDeActividades < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      DELETE FROM heb412_gen_campoplantillahcm WHERE plantillahcm_id='5';
      DELETE FROM heb412_gen_plantillahcm WHERE id='5';

      INSERT INTO public.heb412_gen_plantillahcm (id, 
        ruta, fuente, licencia, vista, nombremenu, filainicial) VALUES (5, 
        'Actividades/listado_de_actividades.ods', 'Pasos de Jesús', 
        'Dominio Público', 'Actividad', 'Listado de Actividades', 5);

      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (500, 5, 'id', 'A');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (501, 5, 'nombre', 'B');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (502, 5, 'fecha_localizada', 'C');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (503, 5, 'duracionhoras_localizado', 'D');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (504, 5, 'departamento', 'E');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (505, 5, 'municipio', 'F');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (506, 5, 'grupo', 'G');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (507, 5,  
        'compromiso_institucional', 'H');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (508, 5, 
        'actividad_de_compromiso_institucional', 'I');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (509, 5, 
        'objetivo_convenio_financiero', 'J');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (510, 5, 'responsable', 'K');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (511, 5, 'corresponsables', 'L');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (512, 5, 'campos_dinamicos', 'M');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (513, 5, 'actor', 'N');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (514, 5, 'publicacion', 'O');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (515, 5, 'mujeres', 'P');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (516, 5, 'hombres', 'Q');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (517, 5, 'sexo_onr', 'R');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (518, 5, 'negros', 'S');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (519, 5, 'indigenas', 'T');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (520, 5, 'etnia_onr', 'U');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (521, 5, 'observaciones', 'V');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (522, 5, 'creacion', 'W');
      INSERT INTO public.heb412_gen_campoplantillahcm (id, plantillahcm_id, 
        nombrecampo, columna) VALUES (523, 5, 'actualizacion', 'X');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM heb412_gen_campoplantillahcm WHERE plantillahcm_id='5';
      DELETE FROM heb412_gen_plantillahcm WHERE id='5';
    SQL
  end
end
