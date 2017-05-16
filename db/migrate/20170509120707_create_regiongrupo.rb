class CreateRegiongrupo < ActiveRecord::Migration[5.0]
  def change
    create_table :regiongrupo do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.integer :grupo_id
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :regiongrupo, :sip_grupo, column: :grupo_id
  end
end
