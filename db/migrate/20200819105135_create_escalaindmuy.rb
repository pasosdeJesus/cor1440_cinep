include Sip::MigracionHelper

class CreateEscalaindmuy < ActiveRecord::Migration[6.0]
  def up
    create_table :escalaindmuy do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('escalaindmuy', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO escalaindmuy (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, '1 Indiferente',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaindmuy (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, '2 Sin importancia',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaindmuy (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, '3 Poco importante',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaindmuy (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        4, '4 Importante',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaindmuy (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, '5 Muy importante',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escalaindmuy (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        6, '6 N/C',
        '2020-08-05', '2020-08-05', '2020-08-05');
      SELECT setval('escalaindmuy_id_seq', 100);
    SQL
  end
  def down
    drop_table :escalaindmuy
  end
end
