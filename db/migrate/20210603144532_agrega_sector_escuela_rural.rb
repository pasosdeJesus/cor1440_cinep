class AgregaSectorEscuelaRural < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      INSERT INTO sip_sectoractor (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        22, 'ESCUELA RURAL', 
        '2021-06-03',  '2021-06-03',  '2021-06-03');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sip_sectoractor WHERE id=22;
    SQL
  end

end
