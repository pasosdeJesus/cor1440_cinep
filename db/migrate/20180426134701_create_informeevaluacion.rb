class CreateInformeevaluacion < ActiveRecord::Migration[5.2]
  def change
    create_table :informeevaluacion do |t|
      t.integer :proyectofinanciero_id, null: false
      t.string :detalle, limit: 5000
      t.date :fechaplaneada
      t.date :fechareal
      t.string :resultado, limit: 5000
    end
    add_foreign_key :informeevaluacion, :cor1440_gen_proyectofinanciero,
      column: :proyectofinanciero_id
  end
end
