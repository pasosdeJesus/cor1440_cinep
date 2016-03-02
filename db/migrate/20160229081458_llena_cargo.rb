class LlenaCargo < ActiveRecord::Migration
  def up
    # Referencia http://www.xe.com/iso4217.php
    execute <<-SQL
      INSERT INTO cargo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (1, 'SIN INFORMACIÓN', '2016-02-18', '2016-02-18', '2016-02-18');
      INSERT INTO cargo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (2, 'COORDINADOR', '2016-02-18', '2016-02-18', '2016-02-18');
      INSERT INTO cargo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (3, 'INVESTIGADOR', '2016-02-18', '2016-02-18', '2016-02-18');
      INSERT INTO cargo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (4, 'ANALISTA', '2016-02-18', '2016-02-18', '2016-02-18');
      INSERT INTO cargo (id, nombre, observaciones, fechacreacion, created_at, updated_at) 
        VALUES (5, 'ANALISTA DE PRENSA', 'http://empleoscolombianos.blogspot.com.co/2013/12/el-cinep-programa-por-la-paz-abre.html', 
        '2016-02-18', '2016-02-18', '2016-02-18'); 
      INSERT INTO cargo (id, nombre, observaciones, fechacreacion, created_at, updated_at) 
        VALUES (6, 'PROFESIONAL EN CIENCICAS JURÍDICAS', 'http://empleoscolombianos.blogspot.com.co/2013/07/el-cinep-programa-por-la-paz-colombia.html', 
        '2016-02-18', '2016-02-18', '2016-02-18'); 
      INSERT INTO cargo (id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (7, 'OTRO', '2016-02-18', '2016-02-18', '2016-02-18');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cargo WHERE id>='1' AND id<='7';
    SQL
  end
end
