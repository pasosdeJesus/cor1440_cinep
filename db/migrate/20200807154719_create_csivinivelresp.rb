include Sip::MigracionHelper

class CreateCsivinivelresp < ActiveRecord::Migration[6.0]
  def up
    create_table :csivinivelresp do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('csivinivelresp', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO csivinivelresp (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, 'SIN INFORMACIÓN', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivinivelresp (id, nombre, observaciones,
        fechacreacion, created_at, updated_at) VALUES (
        2, 'Primario', 'Actores con responsabilidad directa en la implementación',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO csivinivelresp (id, nombre, observaciones,
        fechacreacion, created_at, updated_at) VALUES (
        3, 'Secundario', 'Actores con responsabilidad indirecta con la implementación',
        '2020-08-05', '2020-08-05', '2020-08-05');

      SELECT setval('csivinivelresp_id_seq', 100);
    SQL
    add_column :sip_actorsocial, :csivinivelresp_id, :integer
    add_foreign_key :sip_actorsocial, :csivinivelresp, column: :csivinivelresp_id
  end

  def down
    drop_foreign_key :sip_actorsocial, :csivinivelresp
    drop_column :sip_actorsocial, :csivinivelresp_id
    drop_table :csivinivelresp
  end
end
