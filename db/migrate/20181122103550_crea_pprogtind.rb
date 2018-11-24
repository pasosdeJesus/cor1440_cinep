class CreaPprogtind < ActiveRecord::Migration[5.2]
  def change
    create_table :cor1440_gen_pprogtind do |t|
      t.integer :tipoindicador_id, null: false
      t.string :pregunta, limit: 1024
      t.integer :porcentaje
    end
    add_foreign_key :cor1440_gen_pprogtind, :cor1440_gen_tipoindicador,
      column: :tipoindicador_id
    add_column :efecto, :porcentajeprog, :integer
  end
end
