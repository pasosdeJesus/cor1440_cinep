class AmpliaPublicacion2 < ActiveRecord::Migration[6.1]
  def change
    add_column :publicacion, :autor, :string, limit: 500
    add_column :publicacion, :revista, :string, limit: 500
    add_column :publicacion, :editorial, :string, limit: 500
    add_column :publicacion, :issn, :string, limit: 500
    add_column :publicacion, :categoriarevista_id, :integer
    add_foreign_key :publicacion, :categoriarevista
  end
end
