# enconding: utf-8

class CreaAnexoConvenio < ActiveRecord::Migration[5.2]
  def change
    create_table :anexo_convenio do |t|
      t.integer :anexo_id
      t.integer :convenio_id
    end
    add_foreign_key :anexo_convenio, :convenio, column: :convenio_id
    add_foreign_key :anexo_convenio, :sip_anexo, column: :anexo_id
  end
end
