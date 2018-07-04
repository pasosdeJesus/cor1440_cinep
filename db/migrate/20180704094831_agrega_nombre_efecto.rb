class AgregaNombreEfecto < ActiveRecord::Migration[5.2]
  def change
    add_column :efecto, :nombre, :string, limit: 500
  end
end
