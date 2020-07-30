class CreateLscobertura < ActiveRecord::Migration[6.0]
  def up
    create_table :lscobertura do |t|
      t.string :nombre, limit: 500, null: false
      t.string :codigo, limit: 3, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (1, 'SIN INFORMACIÓN', 'SIN', '', '2020-07-22', '2020-07-22', '2020-07-22');
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (2,'DEPARTAMENTAL', 'D', '', '2020-07-22', '2020-07-22', '2020-07-22');
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (3,'INTERNACIONAL', 'I', '', '2020-07-22', '2020-07-22', '2020-07-22');
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (4,'MUNICIPAL', 'M', '', '2020-07-22', '2020-07-22', '2020-07-22');
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (5,'NACIONAL', 'N', '', '2020-07-22', '2020-07-22', '2020-07-22');
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (6,'REGIONAL', 'R', '', '2020-07-22', '2020-07-22', '2020-07-22');
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (7,'SUBMUNICIPAL', 'S', '', '2020-07-22', '2020-07-22', '2020-07-22');
      INSERT INTO lscobertura (id, nombre, codigo, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (8,'SUBREGIONAL', 'SR', '', '2020-07-22', '2020-07-22', '2020-07-22');
        SELECT setval('lscobertura_id_seq', 100);
    SQL
  end

  def down
    drop_table :lscobertura
  end
end
