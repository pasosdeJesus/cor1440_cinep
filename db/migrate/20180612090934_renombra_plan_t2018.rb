class RenombraPlanT2018 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero SET 
        nombre = 'PLAN MARCO TRIENAL 2018-2020' WHERE id='18';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero SET 
        nombre = 'PLAN ESTRATÉGICO TRIENAL 2018-2020' WHERE id='18';
    SQL
  end
end
