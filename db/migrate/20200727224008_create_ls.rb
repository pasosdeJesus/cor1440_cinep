class CreateLs < ActiveRecord::Migration[6.0]
  def change
    create_table :ls do |t|
      t.date :fecha, null: false
      t.boolean :mes_inexacto
      t.integer :cobertura_id
      t.integer :convocante_id
      t.string :orgconvocante, limit: 512
      t.string :dirig1, limit: 512
      t.string :dirig2, limit: 512
      t.string :dirig3, limit: 512
      t.integer :actor
      t.string :partici1, limit: 512
      t.string :partici2, limit: 512
      t.string :partici3, limit: 512
      t.string :tipo_lucha, limit: 3
      # t.integer :accion  Se deduce de tipo_lucha
      t.integer :motivopl
      t.string :motivopp, limit: 512
      t.string :motivo2, limit: 512
      t.string :motivo3, limit: 512
      t.string :motivo4, limit: 512
      t.string :motivo5, limit: 512
      t.integer :adversario
      t.string :entidad1, limit: 512
      t.string :entidad2, limit: 512
      t.string :entidad3, limit: 512
      t.string :fuente, limit: 512
      t.date :ffuente
      t.date :ffuen_1
      t.string :descripcion, limit: 5000
    end
  end
end
