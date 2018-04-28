class CreaActor < ActiveRecord::Migration[4.2]
  def up
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
      INSERT INTO actor (id, nombre, sectoractor_id, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'Pasos de Jesús', 16, 'Vladimir Támara Patiño', 'Desarrollador', 'vtamara@pasosdeJesus.org', NULL, NULL, '3165383162', NULL, 'BOGOTÁ', 170, NULL, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
      INSERT INTO actor (id, nombre, sectoractor_id, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'Banco de Datos del CINEP', 6, 'Yebrail Alvarez', 'Coordinador', 'lutas@nocheyniebla.org', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, '', '2015-05-21', NULL, '2015-05-22 01:52:05.633562', '2015-05-22 01:54:54.379122');
      INSERT INTO actor (id, nombre, sectoractor_id, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CINEP/PPP', 6, 'Luis Guillermo Guerrero', 'Director', 'direccion@cinep.org.co', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, ' ', '2015-05-21', NULL, '2015-05-22 01:55:42.597229', '2015-05-22 01:55:42.597229');
    SQL
  end

  def down
    drop_table :actor
  end
end
