class Estadoporomision < ActiveRecord::Migration[5.1]
  def up
    change_column_default(:cor1440_gen_proyectofinanciero, :estado, 'E')
    execute <<-SQL
    UPDATE cor1440_gen_proyectofinanciero SET estado='E' WHERE estado IS NULL;
    SQL
    execute <<-SQL
    ALTER TABLE cor1440_gen_proyectofinanciero
      ALTER COLUMN fechaformulacion SET DEFAULT current_date;
    SQL
    execute <<-SQL
    UPDATE cor1440_gen_proyectofinanciero SET 
      fechaformulacion=fechainicio-interval '1 month' WHERE 
      fechaformulacion IS NULL AND fechainicio IS NOT NULL;
    UPDATE cor1440_gen_proyectofinanciero SET 
      fechaformulacion=current_date WHERE 
      fechaformulacion IS NULL AND fechainicio IS NULL;
    SQL

    change_column :cor1440_gen_proyectofinanciero, :fechaformulacion, 
      :date, null: false
  end
  def down
    change_column :cor1440_gen_proyectofinanciero, :fechaformulacion, 
      :date, null: true
    change_column_default(:cor1440_gen_proyectofinanciero, :fechaformulacion, nil)
    change_column_default(:cor1440_gen_proyectofinanciero, :estado, nil)
  end
end
