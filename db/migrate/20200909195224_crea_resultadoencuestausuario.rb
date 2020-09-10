class CreaResultadoencuestausuario < ActiveRecord::Migration[6.0]
  def change
    add_column :planencuesta, :adurl, :string, limit: 32
    add_index :planencuesta, :adurl, unique: true
  end
end
