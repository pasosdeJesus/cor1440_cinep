class AjustaActTrienal2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      DELETE FROM public.cor1440_gen_actividad_actividadpf WHERE actividadpf_id=11;
      DELETE FROM public.cor1440_gen_actividadpf_mindicadorpf WHERE actividadpf_id=11;
      DELETE FROM public.cor1440_gen_actividadpf WHERE id=11;
    SQL
  end

  def down
    execute <<-SQL
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (11, 21, 'A3.1', 'Iniciativa de los Planes de Acción para la Transformación Regional implementada', 'Iniciativas de los Planes de Acción para la Transformación Regional implementados con la participación de las comunidades campesinas, indígenas y afrodescendientes. ', 47, NULL, NULL, NULL);
    SQL
  end
end
