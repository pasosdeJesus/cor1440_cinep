class AgregaTelefonosUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuario, :telefonos, :string, limit: 256
    add_column :usuario, :extension, :string, limit: 128
  end
end
