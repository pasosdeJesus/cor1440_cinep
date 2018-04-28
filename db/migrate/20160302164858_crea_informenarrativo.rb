class CreaInformenarrativo < ActiveRecord::Migration[4.2]
  def change
    create_table :informenarrativo do |t|
      t.integer :proyectofinanciero_id, null: false
      t.string :detalle, limit: 500
      t.date :fechaplaneada

      t.timestamps null: false
    end
    add_foreign_key :informenarrativo, :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
  end
end
