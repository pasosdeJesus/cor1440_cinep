include Sip::MigracionHelper

class CreateCsivitema < ActiveRecord::Migration[6.0]
  def up
    create_table :csivitema do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('csivitema', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, 'SIN INFORMACIÓN', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, 'Reforma rural integral', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, 'Participación política',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        4, 'Fin del conflicto',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, 'Solución al problema de las drogas ilícitas',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        6, 'Víctimas',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        7, 'Implementación, verificación y refrendación',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        8, 'Enfoque étnico y Enfoque de género',
        '2020-08-05', '2020-08-05', '2020-08-05');
      SELECT setval('csivitema_id_seq', 100);
    SQL
    add_column :sip_actorsocial, :csivitema_id, :integer
    add_foreign_key :sip_actorsocial, :csivitema, column: :csivitema_id
  end

  def down
    drop_foreign_key :sip_actorsocial, :csivitema
    drop_column :sip_actorsocial, :csivitema_id
    drop_table :csivitema
  end

end
