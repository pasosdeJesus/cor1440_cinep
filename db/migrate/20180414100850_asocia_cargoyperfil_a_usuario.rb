class AsociaCargoyperfilAUsuario < ActiveRecord::Migration[5.2]
  def up
    add_column :usuario, :perfilprofesional_id, :integer
    add_column :usuario, :cargo_id, :integer
    add_foreign_key :usuario, :perfilprofesional, column: :perfilprofesional_id
  end
end
