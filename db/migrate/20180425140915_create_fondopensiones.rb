# encoding: utf-8

class CreateFondopensiones < ActiveRecord::Migration[5.2]
  def up
    create_table :fondopensiones do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end

    execute <<-SQL
      INSERT INTO fondopensiones (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO fondopensiones (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (2, 'COLFONDOS', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO fondopensiones (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (3, 'OLD MUTUAL', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO fondopensiones (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (4, 'PORVENIR', '2018-04-25', '2018-04-25', '2018-04-25');
      INSERT INTO fondopensiones (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (5, 'PROTECCIÓN', '2018-04-25', '2018-04-25', '2018-04-25');
    SQL
  end

  def down
    drop_table :fondopensiones
  end
end
