include Sip::MigracionHelper
class CreateEscalaempeoramejora < ActiveRecord::Migration[6.0]
  def up
    create_table :escalaempeoramejora do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('escalaempeoramejora', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO escalaempeoramejora (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, '1 Indiferente',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaempeoramejora (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, '2 Empeora mucho',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaempeoramejora (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, '3 Empeora',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaempeoramejora (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        4, '4 Mejora',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaempeoramejora (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, '5 Mejora mucho',
        '2020-08-05', '2020-08-05', '2020-08-05');
      SELECT setval('escalaempeoramejora_id_seq', 100);
    SQL
  end

  def down
    drop_table :escalaempeoramejora
  end
end
