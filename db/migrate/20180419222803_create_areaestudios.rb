class CreateAreaestudios < ActiveRecord::Migration[5.2]
  def up
    create_table :areaestudios do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end

    execute <<-SQL
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (1, 'SIN INFORMACIÓN', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (2, 'CINECIAS ADMINISTRATIVAS', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (3, 'CIENCIAS BÁSICAS', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (4, 'CIENCIAS COMUNICATIVAS', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (5, 'CIENCIAS CONTABLES', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (6, 'CIENCIAS CONTABLES', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (7, 'CIENCIAS ECONÓMICAS', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (8, 'CIENCIAS EDUCATIVAS', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (9, 'CIENCIAS JURÍDICAS', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (10, 'CIENCIAS SOCIALES', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (11, 'INGENIERÍA', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO areaestudios(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (12, 'TÉCNICO', '2018-04-19', '2018-04-19', '2018-04-19');
    SQL
  end

  def down
    drop_table :areaestudios
  end
end
