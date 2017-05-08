class LlenaTipoproductopf < ActiveRecord::Migration
  def up
    execute <<-SQL
      INSERT INTO tipoproductopf 
        (id, nombre, fechacreacion, created_at, updated_at) VALUES 
        (1, 'OTRO', '2017-05-01', '2017-05-01', '2017-05-01');
      INSERT INTO tipoproductopf 
        (id, nombre, fechacreacion, created_at, updated_at) VALUES 
        (2, 'LIBRO', '2017-05-01', '2017-05-01', '2017-05-01');
      INSERT INTO tipoproductopf 
        (id, nombre, fechacreacion, created_at, updated_at) VALUES 
        (3, 'PUBLICACIÓN', '2017-05-01', '2017-05-01', '2017-05-01');
      INSERT INTO tipoproductopf 
        (id, nombre, fechacreacion, created_at, updated_at) VALUES 
        (4, 'INFORME', '2017-05-01', '2017-05-01', '2017-05-01');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM tipoproductopf WHERE id>='1' AND id<='4';
    SQL
  end
end
