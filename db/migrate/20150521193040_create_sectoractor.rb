class CreateSectoractor < ActiveRecord::Migration
  def up
    create_table :sectoractor do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.boolean :enplantrienal
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (1,'SIN INFORMACIÓN', 'f', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (2,'ACADEMIA', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (3,'IGLESIA', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (4,'ORGANIZACIÓN DE BASE', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (5,'GOBIERNO', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (6,'OTRAS ONGS NACIONALES', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (7,'OTRAS ONGS INTERNACIONALES', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (8,'GREMIOS', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (9,'OBSERVATORIOS DE PROGRAMAS DE PAZ Y DESARROLLO', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (10,'EMPRESA PRIVADA', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (11,'ORGANIZACIÓN SINDICAL', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (12,'ORGANIZACIÓN ESTUDIANTIL', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (13,'POBLADORES URBANOS', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (14,'ESTUDIANTES', 't', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (15, 'MEDIOS DE COMUNICACIÓN', 'f', '2015-05-21', '2015-05-21', '2015-05-21');
      INSERT INTO sectoractor(id, nombre, enplantrienal, fechacreacion, created_at, updated_at) 
        VALUES (16, 'ORGANIZACIÓN RELIGIOSA', 'f', '2015-05-21', '2015-05-21', '2015-05-21');
    SQL
  end

  def down
    drop_table :sectoractor
  end
end
