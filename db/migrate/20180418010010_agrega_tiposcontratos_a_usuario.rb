class AgregaTiposcontratosAUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuario, :tipocontrato_id, :integer, default: 1
    add_foreign_key :usuario, :tipocontrato
  end
end
