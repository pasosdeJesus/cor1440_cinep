class CreaInformeauditoria < ActiveRecord::Migration
  def change
    create_table :informeauditoria do |t|
      t.integer :proyectofinanciero_id, null: false
      t.string :detalle, limit: 500

      t.timestamps null: false
    end
    add_foreign_key :informeauditoria, :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
  end
end
