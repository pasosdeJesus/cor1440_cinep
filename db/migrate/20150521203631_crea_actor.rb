class CreaActor < ActiveRecord::Migration
  def change
    create_table :actor do |t|
      t.string :nombre, limit: 500, null: false
      t.integer :sectoractor_id,  index: true
      t.string :personacontacto, limit: 100
      t.string :cargo, limit: 100
      t.string :correo, limit: 100
      t.string :telefono, limit: 100
      t.string :fax, limit: 100
      t.string :celular, limit: 100
      t.string :direccion, limit: 200
      t.string :ciudad, limit: 100
      t.integer :pais_id,  index: true
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :actor, :sectoractor, column: :sectoractor_id
    add_foreign_key :actor, :sip_pais, column: :pais_id
    execute <<-SQL
      INSERT INTO actor(id, nombre, sectoractor_id, personacontacto, 
        cargo, correo, telefono, fax, 
        direccion, ciudad, pais_id, 
        fechacreacion, created_at, updated_at) 
      VALUES (1, 'CINEP', '16', 'Luis Guillermo Guerrero', 
        'Director', 'direccion@cinep.org.co', '2456181', '2879089', 
        'Cr 5 # 33B-02', 'BOGOTÁ', '170', 
        '2015-05-21', '2015-05-21', '2015-05-21');
    SQL
  end

  def down
    drop_table :actor
  end
end
