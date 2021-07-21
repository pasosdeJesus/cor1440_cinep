class AgregaIsbnPub < ActiveRecord::Migration[6.1]
  def change
    add_column :publicacion, :isbn, :string, limit: 500
  end
end
