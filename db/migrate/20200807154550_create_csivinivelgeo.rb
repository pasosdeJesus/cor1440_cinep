include Sip::MigracionHelper

class CreateCsivinivelgeo < ActiveRecord::Migration[6.0]
  def up
    create_table :csivinivelgeo do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('csivinivelgeo', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO csivinivelgeo (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivinivelgeo (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (2, 'INTERNACIONAL', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivinivelgeo (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (3, 'NACIONAL', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivinivelgeo (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (4, 'LOCAL', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      SELECT setval('csivinivelgeo_id_seq', 100);
    SQL
    add_column :sip_actorsocial, :csivinivelgeo_id, :integer
    add_foreign_key :sip_actorsocial, :csivinivelgeo, column: :csivinivelgeo_id
  end

  def down
    drop_foreign_key :sip_actorsocial, :csivinivelgeo
    drop_column :sip_actorsocial, :csivinivelgeo_id
    drop_table :csivinivelgeo
  end
end
