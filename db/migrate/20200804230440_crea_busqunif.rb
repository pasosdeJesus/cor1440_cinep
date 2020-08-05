class CreaBusqunif < ActiveRecord::Migration[6.0]
  def change
    create_table :busqunif do |t|
      t.string :base, limit: 5, null: false
      t.integer :idbase, null: false
      t.string :url, limit: 1024, null: false
      t.date  :fecha, null: false
      t.string  :departamento, limit: 1024
      t.string  :municipio, limit: 1024
      t.string  :descripcion, limit: 6000, null: false
    end
  end
end
