class CreateConvenio < ActiveRecord::Migration[5.1]
  def change
    create_table :convenio do |t|
      t.string :clasificacion, limit: 1
      t.integer :tipoconvenio_id
      t.string :institucion, limit: 1000
      t.string :descripcion, limit: 5000
      t.date :fechainicio
      t.date :fechacierre
      t.timestamp :created_at
      t.timestamp :updated_at
    end
    add_foreign_key :convenio, :tipoconvenio
  end
end
