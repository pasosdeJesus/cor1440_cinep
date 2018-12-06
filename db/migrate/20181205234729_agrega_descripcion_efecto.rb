class AgregaDescripcionEfecto < ActiveRecord::Migration[5.2]
  def up
    change_column :efecto, :nombre, :string, limit: 500
    add_column :efecto, :descripcion, :string, limit: 5000
  end
  def down
    remove_column :efecto, :descripcion
    change_column :efecto, :nombre, :string, limit: 128
  end
end
