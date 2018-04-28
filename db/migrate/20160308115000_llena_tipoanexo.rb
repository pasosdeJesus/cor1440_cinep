class LlenaTipoanexo < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      INSERT INTO tipoanexo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (1, 'INFORME NARRATIVO', '2016-03-08', '2016-03-08', '2016-03-18');
      INSERT INTO tipoanexo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (2, 'INFORME FINANCIERO', '2016-03-08', '2016-03-08', '2016-03-08');
      INSERT INTO tipoanexo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (3, 'ACUSE DE RECIBIDO', '2016-03-08', '2016-03-08', '2016-03-08');
      INSERT INTO tipoanexo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (4, 'FORMATO DE SOLICITUD', '2016-03-08', '2016-03-08', '2016-03-08');
      INSERT INTO tipoanexo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (5, 'OTRO', '2016-03-08', '2016-03-08', '2016-03-08');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM tipoanexo WHERE id>='1' AND id<='5';
    SQL
  end
end
