class CreatePlantillacorreo < ActiveRecord::Migration[6.0]
  def change
    create_table :plantillacorreo do |t|
      t.string :nombre, limit: 500, null: false
      t.string :contenido, limit: 5000
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
  end
end
