class CreaProductopf < ActiveRecord::Migration[5.0]
  def change
    create_table :productopf do |t|
      t.integer :proyectofinanciero_id, null: false
      t.integer :tipoproductopf_id, null: false
      t.string  :detalle, limit: 5000
      t.date    :fechaplaneada
      t.date    :fechareal
      t.boolean :devoluciones
      t.string  :seguimiento, limit: 5000

      t.timestamps null: false
    end
    add_foreign_key :productopf, :cor1440_gen_proyectofinanciero, 
      column: :proyectofinanciero_id
    add_foreign_key :productopf, :tipoproductopf, 
      column: :tipoproductopf_id
  end
end
