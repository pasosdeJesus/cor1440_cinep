class CreaCor1440GenCambiosproyectofinanciero < ActiveRecord::Migration[5.1]
  def change
    create_table :cor1440_gen_cambiosproyectofinanciero do |t|
      t.datetime :cuando
      t.string :ip, limit: 100
      t.integer :usuario_id
      t.integer :proyectofinanciero_id
      t.string :cambios, limit: 5000
      t.string :comentarios, limit: 5000
    end
    add_foreign_key :cor1440_gen_cambiosproyectofinanciero, :usuario
    add_foreign_key :cor1440_gen_cambiosproyectofinanciero, 
      :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
  end
end
