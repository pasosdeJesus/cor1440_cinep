class CreateAcpformap < ActiveRecord::Migration[6.0]
  def up
    create_table :acpformap do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO acpformap (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpformap (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (2, 'ORGANIZADA', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpformap (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (3, 'NO ORGANIZADA', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpformap (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (4, 'NO APLICA', 
        '2020-08-05', '2020-08-05', '2020-08-05');
      SELECT setval('acpformap_id_seq', 100);
    SQL
  end

  def down
    drop_table :acpformap
  end
end
