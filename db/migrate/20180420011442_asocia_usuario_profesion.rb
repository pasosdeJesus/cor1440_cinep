class AsociaUsuarioProfesion < ActiveRecord::Migration[5.2]
  def change
    add_column :usuario, :profesion_id, :integer, default: 1
    add_foreign_key :usuario, :profesion
  end
end
