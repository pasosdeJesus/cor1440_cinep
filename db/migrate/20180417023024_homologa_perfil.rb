class HomologaPerfil < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE proyectofinanciero_usuario SET 
        perfilprofesional_id=perfilprofesional.id
        FROM cargo, perfilprofesional WHERE 
          cargo.nombre = perfilprofesional.nombre AND 
          cargo_id=cargo.id;
    SQL
  end

  def down

  end
end
