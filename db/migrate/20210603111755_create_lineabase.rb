class CreateLineabase < ActiveRecord::Migration[6.1]
  include Sip::MigracionHelper
  def up
    create_table :lineabase do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamps
    end
    cambiaCotejacion('lineabase', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO lineabase (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, 'PLAN TRIENAL 2018-2020',
        '2021-06-03', '2021-06-03', '2021-06-03');
      INSERT INTO lineabase (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, 'PLAN TRIENAL 2021-2023',
        '2021-06-03', '2021-06-03', '2021-06-03');
      SELECT pg_catalog.setval('public.lineabase_id_seq', 100, true);
    SQL
  end

  def down
    drop_table :lineabase
  end
end
