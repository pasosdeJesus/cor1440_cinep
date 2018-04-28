class CreaDesembolso < ActiveRecord::Migration[4.2]
  def change
    create_table :desembolso do |t|
      t.integer :proyectofinanciero_id, null: false
      t.string :detalle, limit: 500
      t.date :fechaplaneada
      t.decimal :valorplaneado, precision: 20, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :desembolso, :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
  end
end
