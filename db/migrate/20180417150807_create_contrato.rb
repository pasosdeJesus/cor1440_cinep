class CreateContrato < ActiveRecord::Migration[5.2]
  def change
    create_table :contrato do |t|
      t.string :numero, limit: 127
      t.decimal :salarioanterior
      t.decimal :salario
      t.date :fechaini
      t.date :fechafin
    end

    add_column :usuario, :contrato_id, :integer
    add_foreign_key :usuario, :contrato
  end
end
