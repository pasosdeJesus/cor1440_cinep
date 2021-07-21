class CierraTrienal2018 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero 
        SET estado='M'
        WHERE id=18;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero 
        SET estado='E'
        WHERE id=18;
    SQL
  end
end
