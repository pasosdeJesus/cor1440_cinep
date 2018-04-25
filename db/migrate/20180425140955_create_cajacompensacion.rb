# encoding: utf-8

class CreateCajacompensacion < ActiveRecord::Migration[5.2]
  def up
    create_table :cajacompensacion do |t|
      t.string :nombre, limit: 500
      t.string :observaciones, limit: 5000
      t.date :fechacreacion
      t.date :fechadeshabilitacion
      t.timestamp :created_at
      t.timestamp :updated_at
    end

    execute <<-SQL
      INSERT INTO cajacompensacion (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO cajacompensacion (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (2, 'CAFAM', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO cajacompensacion (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (3, 'COLSUBSIDIO', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO cajacompensacion (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (4, 'COMPENSAR', '2018-04-25', '2018-04-25', '2018-04-25');
    SQL
  end
  
  def down
    drop_table :cajacompensacion
  end
end
