class CreateAnexoEfecto < ActiveRecord::Migration[5.1]
  def change
    create_table :anexo_efecto do |t|
      t.integer :anexo_id
      t.integer :efecto_id
    end
    add_foreign_key :anexo_efecto, :sip_anexo, column: :anexo_id
    add_foreign_key :anexo_efecto, :efecto, column: :efecto_id
  end
end
