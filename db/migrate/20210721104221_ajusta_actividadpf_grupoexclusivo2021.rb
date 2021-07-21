class AjustaActividadpfGrupoexclusivo2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      -- Conflicto y Paz
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo 
        (actividadpf_id, grupo_id) 
        (SELECT id, 62 FROM cor1440_gen_actividadpf WHERE
         id>=360 AND id<=369);
    SQL
  end
end
