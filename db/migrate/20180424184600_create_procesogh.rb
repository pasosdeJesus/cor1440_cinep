class CreateProcesogh < ActiveRecord::Migration[5.2]
  def up
    create_table :procesogh do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO procesogh (id, nombre,
        fechacreacion, created_at, updated_at) 
        VALUES (1, 'SIN INFORMACIÓN', 
        '2018-04-24', '2018-04-24', '2018-04-24');
      INSERT INTO procesogh (id, nombre, 
        fechacreacion, created_at, updated_at) 
        VALUES (2, 'APOYO', 
        '2018-04-24', '2018-04-24', '2018-04-24');
      INSERT INTO procesogh (id, nombre,
        fechacreacion, created_at, updated_at) 
        VALUES (3, 'OPERATIVO',
        '2018-04-24', '2018-04-24', '2018-04-24');
      INSERT INTO procesogh (id, nombre,
        fechacreacion, created_at, updated_at) 
        VALUES (4, 'DIRECTIVO',
        '2018-04-24', '2018-04-24', '2018-04-24');
    SQL
  end

  def down
    drop_table :procesogh
  end
end
