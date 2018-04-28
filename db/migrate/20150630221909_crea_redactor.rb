class CreaRedactor < ActiveRecord::Migration[4.2]
  def up
    create_table :redactor do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (1, 'RED PRODEPAZ', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (2, 'COORDINACIÓN EUROPA-ESTADOS UNIDOS', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (3, 'ALIANZA POST-LONDRES', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (4, 'RED DE ONG POR LA TRANSPARENCIA', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (5, 'MESA AMBIENTAL DE LOS CERROS ORIENTALES  BOGOTÁ', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (6, 'SINERGIA', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (7, 'VIVA LA CIUDADANÍA', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (8, 'INSTITUTO INTERAMERICANO DE DERECHOS HUMANOS', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (9, 'RED DE CENTROS SOCIALES DE LA COMPAÑÍA DE JESÚS EN AMERICA LATINA', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (10, 'INTERNATIONAL COALITION FOR THE RESPONSABILITY  TO PROTECT', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (11, 'INTERNATIONAL LAND COALITION', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (12, 'ASOCIACIÓN LATINOAMERICANA DE ORGANIZACIONES DE PROMOCIÓN AL DESARROLLO A.C', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (13, 'CONSEJO LATINOAMERICANO  DE CIENCIAS SOCIALES', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (14, 'NO APLICA', '2015-06-30', '2015-06-30', '2015-06-30');
      INSERT INTO redactor(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (15, 'OTRA', '2015-06-30', '2015-06-30', '2015-06-30');
    SQL
  end

  def down
    drop_table :redactor
  end
end
