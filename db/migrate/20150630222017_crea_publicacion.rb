class CreaPublicacion < ActiveRecord::Migration[4.2]
  def up
    create_table :publicacion do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO publicacion(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (1, 'NOCHE Y NIEBLA 50', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO publicacion(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (2, 'NOCHE Y NIEBLA 51', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO publicacion(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (3, 'CASO TIPO TRUJILLO', '2015-06-30', '2015-06-30', '2015-06-30');
    SQL
  end

  def down
    drop_table :publicacion
  end
end
