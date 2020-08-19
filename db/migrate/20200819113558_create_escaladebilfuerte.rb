include Sip::MigracionHelper

class CreateEscaladebilfuerte < ActiveRecord::Migration[6.0]
  def up
    create_table :escaladebilfuerte do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('escaladebilfuerte', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO escaladebilfuerte (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, '1 Muy débil',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escaladebilfuerte (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, '2 Débil',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escaladebilfuerte (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, '3 Promedio',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escaladebilfuerte (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        4, '4 Fuerte',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO escaladebilfuerte (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, '5 Muy fuerte',
        '2020-08-05', '2020-08-05', '2020-08-05');
      SELECT setval('escaladebilfuerte_id_seq', 100);
    SQL
  end

  def down
    drop_table :escaladebilfuerte
  end
end
