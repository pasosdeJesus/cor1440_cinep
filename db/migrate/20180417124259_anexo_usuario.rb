# enconding: utf-8

class AnexoUsuario < ActiveRecord::Migration[5.2]
  def change
    create_table :anexo_usuario do |t|
      t.integer :anexo_id
      t.integer :usuario_id
    end
    add_foreign_key :anexo_usuario, :usuario, column: :usuario_id
    add_foreign_key :anexo_usuario, :sip_anexo, column: :anexo_id
  end
end
