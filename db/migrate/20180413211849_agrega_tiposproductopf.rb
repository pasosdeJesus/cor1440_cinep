class AgregaTiposproductopf < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO tipoproductopf (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (5, 'REVISTA', '2018-04-13', '2018-04-13', '2018-04-13');
      INSERT INTO tipoproductopf (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (6, 'AUDIOVISUAL', '2018-04-13', '2018-04-13', '2018-04-13');
      INSERT INTO tipoproductopf (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (7, 'PROGRAMA RADIAL', '2018-04-13', '2018-04-13', '2018-04-13');
      INSERT INTO tipoproductopf (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (8, 'CARTILLA', '2018-04-13', '2018-04-13', '2018-04-13');
      INSERT INTO tipoproductopf (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (9, 'CARPETA PEDAGÓGICA', '2018-04-13', '2018-04-13', '2018-04-13');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM tipoproductopf WHERE id>='5' AND id<='9'; 
    SQL
  end
end
