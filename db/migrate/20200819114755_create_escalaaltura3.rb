include Sip::MigracionHelper

class CreateEscalaaltura3 < ActiveRecord::Migration[6.0]
  def up
    create_table :escalaaltura3 do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('escalaaltura3', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO escalaaltura3 (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, '1 Alto',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaaltura3 (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, '2 Medio',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaaltura3 (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, '3 Bajo',
        '2020-08-05', '2020-08-05', '2020-08-05');
      SELECT setval('escalaaltura3_id_seq', 100);
    SQL
  end

  def down
    drop_table :escalaaltura3
  end
end
