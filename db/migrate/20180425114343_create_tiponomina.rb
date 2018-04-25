# encoding: utf-8

class CreateTiponomina < ActiveRecord::Migration[5.2]
  def up
    create_table :tiponomina do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end

    execute <<-SQL
      INSERT INTO tiponomina (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', '2018-04-25', '2018-04-25', '2018-04-25');   
      INSERT INTO tiponomina (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (2, 'AUXILIO', '2018-04-25', '2018-04-25', '2018-04-25');   
      INSERT INTO tiponomina (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (3, 'HONORARIOS', '2018-04-25', '2018-04-25', '2018-04-25');   
      INSERT INTO tiponomina (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (4, 'SALARIO', '2018-04-25', '2018-04-25', '2018-04-25');   
      INSERT INTO tiponomina (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (5, 'N/A', '2018-04-25', '2018-04-25', '2018-04-25');   
    SQL
  end

  def down
    drop_table :tiponomina
  end
end
