class LlenaTipomoneda < ActiveRecord::Migration
  def up
    # Referencia http://www.xe.com/iso4217.php
    execute <<-SQL
      INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, fechacreacion, created_at, updated_at) 
        VALUES (1, 'PESO', 'COP', '$', 170, '2016-02-18', '2016-02-18', '2016-02-18');
      INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, fechacreacion, created_at, updated_at) 
        VALUES (2, 'EURO', 'EUR', '€', '2016-02-18', '2016-02-18', '2016-02-18');
      INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, fechacreacion, created_at, updated_at) 
        VALUES (3, 'DOLAR', 'USD', '$', 840, '2016-02-18', '2016-02-18', '2016-02-18');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM tipomoneda WHERE id>='1' AND id<='3';
    SQL
  end
end
