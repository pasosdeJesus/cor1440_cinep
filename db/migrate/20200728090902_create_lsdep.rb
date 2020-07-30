class CreateLsdep < ActiveRecord::Migration[6.0]
  def change
    create_table :lsdep do |t|
      t.integer :ls_id, null: false
      t.integer :departamento_id, null: false
      t.integer :orden, null: false # registro
      t.string :fuente, limit: 512
      t.date :ffuente
      t.date :ffuen_1
      t.string :descripcion, limit: 5000
    end
    add_foreign_key :lsdep, :ls
    add_foreign_key :lsdep, :sip_departamento, column: :departamento_id
  end
end
