class CreateAnexoProyectofinanciero < ActiveRecord::Migration[4.2]
  def change
    create_table :anexo_proyectofinanciero do |t|
      t.integer :anexo_id
      t.integer :proyectofinanciero_id
      t.integer :tipoanexo_id
    end
    add_foreign_key :anexo_proyectofinanciero, :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
    add_foreign_key :anexo_proyectofinanciero, :sip_anexo, column: :anexo_id
    add_foreign_key :anexo_proyectofinanciero, :tipoanexo, column: :tipoanexo_id

  end
end
