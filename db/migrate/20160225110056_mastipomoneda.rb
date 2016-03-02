class Mastipomoneda < ActiveRecord::Migration
  def up
    # Referencia http://www.xe.com/iso4217.php
    execute <<-SQL
      INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, fechacreacion, created_at, updated_at) 
        VALUES (4, 'FRANCO SUIZO', 'CHF', 'CHF', 756, '2016-02-18', '2016-02-18', '2016-02-18');
      INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, fechacreacion, created_at, updated_at) 
        VALUES (5, 'LIBRA INGLESA', 'GBP', '£', 826, '2016-02-18', '2016-02-18', '2016-02-18');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM tipomoneda WHERE id>='4' AND id<='5';
    SQL
  end
end
