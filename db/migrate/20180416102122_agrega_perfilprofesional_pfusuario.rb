class AgregaPerfilprofesionalPfusuario < ActiveRecord::Migration[5.2]
  def change
    add_column :proyectofinanciero_usuario, :perfilprofesional_id, 
      :integer
    add_foreign_key :proyectofinanciero_usuario, :perfilprofesional
  end
end
