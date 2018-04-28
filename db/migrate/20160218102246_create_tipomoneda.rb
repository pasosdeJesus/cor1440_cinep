class CreateTipomoneda < ActiveRecord::Migration[4.2]
  def change
    create_table :tipomoneda do |t|
      t.string :nombre, limit: 500, null: false
      t.string :codiso4217, limit: 3, null: false
      t.string :simbolo, limit: 10
      t.integer :pais_id
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps null: false
    end
    add_foreign_key :tipomoneda, :sip_pais, column: :pais_id
  end
end
