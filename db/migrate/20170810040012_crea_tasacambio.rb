class CreaTasacambio < ActiveRecord::Migration[5.1]
  def change
    create_table :tasacambio do |t|
      t.date :fecha
      t.integer :tipomoneda_id
      t.decimal :enpesos
      t.string :observaciones, limit: 5000
    end
    add_foreign_key :tasacambio, :tipomoneda
  end
end
