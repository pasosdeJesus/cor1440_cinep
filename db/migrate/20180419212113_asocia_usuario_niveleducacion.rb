class AsociaUsuarioNiveleducacion < ActiveRecord::Migration[5.2]
  def change
    add_column :usuario, :niveleducacion_id, :integer, default: 1
    add_foreign_key :usuario, :niveleducacion
  end
end
