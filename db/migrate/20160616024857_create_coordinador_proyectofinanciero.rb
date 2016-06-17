class CreateCoordinadorProyectofinanciero < ActiveRecord::Migration
  def up
    create_table :coordinador_proyectofinanciero, id: false do |t|
      t.integer :proyectofinanciero_id
      t.integer :coordinador_id
    end
    add_foreign_key :coordinador_proyectofinanciero, :usuario, column: :coordinador_id
    add_foreign_key :coordinador_proyectofinanciero, :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
    execute <<-SQL
    INSERT INTO coordinador_proyectofinanciero 
    (proyectofinanciero_id, coordinador_id) 
    (SELECT proyectofinanciero_id, usuario_id 
    FROM proyectofinanciero_usuario
    WHERE cargo_id = 2);
    SQL
    execute <<-SQL
    DELETE FROM proyectofinanciero_usuario WHERE cargo_id=2;
    DELETE FROM cargo WHERE id=2;
    SQL

  end
  
  def down
    execute <<-SQL
    INSERT INTO cargo (id, nombre, fechacreacion, created_at, updated_at) 
    VALUES ('2', 'COORDINADOR', '2016-02-18', '2016-02-18', '2016-02-18');

    INSERT INTO proyectofinanciero_usuario
    (proyectofinanciero_id, usuario_id, cargo_id, created_at, updated_at) 
    (SELECT proyectofinanciero_id, coordinador_id, 2, current_date, current_date
    FROM coordinador_proyectofinanciero);
    SQL
    drop_table :coordinador_proyectofinanciero 
  end
end
