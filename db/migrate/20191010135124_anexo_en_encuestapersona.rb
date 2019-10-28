class AnexoEnEncuestapersona < ActiveRecord::Migration[6.0]
  def change
    add_column :mr519_gen_encuestapersona, :anexo_id, :integer
    add_foreign_key :mr519_gen_encuestapersona, :sip_anexo, column: :anexo_id
  end
end
