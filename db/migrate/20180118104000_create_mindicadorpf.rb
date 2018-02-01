class CreateMindicadorpf < ActiveRecord::Migration[5.1]
  def change
    create_table :cor1440_gen_mindicadorpf do |t|
      t.integer :proyectofinanciero_id
      t.integer :indicadorpf_id
      t.string :formulacion, limit: 512
      t.integer :frecuenciaanual

      t.timestamps
    end
    add_foreign_key :cor1440_gen_mindicadorpf, :cor1440_gen_proyectofinanciero,
      column: :proyectofinanciero_id
    add_foreign_key :cor1440_gen_mindicadorpf, :cor1440_gen_indicadorpf,
      column: :indicadorpf_id
  end
end
