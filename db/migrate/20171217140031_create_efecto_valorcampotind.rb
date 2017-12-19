class CreateEfectoValorcampotind < ActiveRecord::Migration[5.1]
  def change
    create_table :efecto_valorcampotind do |t|
      t.integer :efecto_id
      t.integer :valorcampotind_id
    end
    add_foreign_key :efecto_valorcampotind, :efecto, column: :efecto_id
    add_foreign_key :efecto_valorcampotind, :cor1440_gen_valorcampotind, 
      column: :valorcampotind_id
  end
end
