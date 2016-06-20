class CreateProyectofinancieroUresponsable < ActiveRecord::Migration
  def up
    create_table :proyectofinanciero_uresponsable do |t|
      t.integer :proyectofinanciero_id
      t.integer :uresponsable_id
      t.decimal :porcentaje
      t.timestamps null:false
    end
    add_foreign_key :proyectofinanciero_uresponsable, 
      :usuario, column: :uresponsable_id
    add_foreign_key :proyectofinanciero_uresponsable, 
      :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
    execute <<-SQL
    INSERT INTO proyectofinanciero_uresponsable
    (proyectofinanciero_id, uresponsable_id, created_at, updated_at) 
    (SELECT id, responsable_id, current_date, current_date
    FROM cor1440_gen_proyectofinanciero);
    SQL
    execute <<-SQL
    ALTER TABLE cor1440_gen_proyectofinanciero DROP COLUMN responsable_id;
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE cor1440_gen_proyectofinanciero ADD 
    COLUMN responsable_id INTEGER REFERENCES usuario;
    SQL
    execute <<-SQL
    UPDATE cor1440_gen_proyectofinanciero 
    SET responsable_id=uresponsable_id
    FROM proyectofinanciero_uresponsable
    WHERE cor1440_gen_proyectofinanciero.id=proyectofinanciero_uresponsable.proyectofinanciero_id
    SQL
    drop_table :proyectofinanciero_uresponsable
  end
end
