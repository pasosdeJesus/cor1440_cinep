class CreateNiveleducacion < ActiveRecord::Migration[5.2]
  def up
    create_table :niveleducacion do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end

    execute <<-SQL
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (1, 'SIN INFORMACIÓN', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (2, 'BACHILLER', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (3, 'DOCTORADO', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (4, 'ESPECIALIZACION', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (5, 'ESTUDIANTE', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (6, 'MAESTRIA', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (7, 'PREGRADO', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (8, 'TECNICO', '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO niveleducacion(id, nombre, fechacreacion, created_at, updated_at) 
      VALUES (9, 'TECNOLOGO ', '2018-04-19', '2018-04-19', '2018-04-19');
    SQL
  end

  def down
    drop_table :niveleducacion
  end
end
