class IndiceActPf < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE UNIQUE INDEX cor1440_gen_actividad_proyectofinanciero_idx on cor1440_gen_actividad_proyectofinanciero (actividad_id, proyectofinanciero_id);
    SQL
  end
  def down
    execute <<-SQL
      DROP INDEX cor1440_gen_actividad_proyectofinanciero_idx;
    SQL
  end
end
