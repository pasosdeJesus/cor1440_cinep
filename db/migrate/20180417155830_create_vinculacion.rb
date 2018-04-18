class CreateVinculacion < ActiveRecord::Migration[5.2]
  def change
    create_table :vinculacion do |t|
      t.integer :usuario_id
      t.date :fechaini
      t.date :fechafin
      t.string :observaciones, limit: 5000
    end
    add_foreign_key :vinculacion, :usuario
  end
end
