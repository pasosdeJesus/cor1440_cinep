class CreateDescargaspublicacion < ActiveRecord::Migration[6.1]
  def change
    create_table :descargaspublicacion do |t|
      t.integer :publicacion_id, null: false
      t.integer :anio, null: false
      t.integer :descargas

      t.timestamps
    end
    add_foreign_key :descargaspublicacion, :publicacion
  end
end
