class AgregaSectoractor < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO sectoractor (id, nombre, fechacreacion, created_at, 
        updated_at) 
        VALUES (18, 'FORMULA POLÍTICAS PÚBLICAS', '2018-02-03', '2018-02-03',
        '2018-02-03');
    SQL
  end
  def down
    execute <<-SQL
    DELETE FROM sectoractor WHERE id='18';
    SQL
  end
end
