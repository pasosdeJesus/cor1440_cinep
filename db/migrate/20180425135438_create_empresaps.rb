# encoding: utf-8

class CreateEmpresaps < ActiveRecord::Migration[5.2]
  def up
    create_table :empresaps do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end

    execute <<-SQL
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (2, 'COMPENSAR', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (3, 'COOMEVA', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (4, 'FAMISANAR', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (5, 'NUEVA EPS', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (6, 'SALUD TOTAL', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (7, 'SANITAS', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO empresaps (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (8, 'SURA', '2018-04-25', '2018-04-25', '2018-04-25');
    SQL
  end

  def down
    drop_table :empresaps
  end
end
