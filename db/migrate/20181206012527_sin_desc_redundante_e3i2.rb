class SinDescRedundanteE3i2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      DELETE FROM cor1440_gen_campotind where id='20';
    SQL
  end
  def down
    execute <<-SQL
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, 
        nombrecampo, ayudauso, tipo) 
      VALUES ('20', '22', 
        'Descripción (incluir derecho que trata y papel del CINEP)', '', '2');
    SQL
  end
end
