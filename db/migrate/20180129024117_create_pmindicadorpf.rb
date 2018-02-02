class CreatePmindicadorpf < ActiveRecord::Migration[5.1]
  def change
    create_table :cor1440_gen_pmindicadorpf do |t|
      t.integer :mindicadorpf_id
      t.date :finicio
      t.date :ffin
      t.string :restiempo, limit: 128
      t.float :dmed1
      t.float :dmed2
      t.float :dmed3
      t.json :datosmedicion
      t.float :rind
      t.float :meta
      t.json :resindicador
      t.float :porcump
      t.string :analisis, limit: 5000
      t.string :acciones, limit: 5000
      t.string :responsables, limit: 5000
      t.string :plazo, limit: 5000
    end
    add_foreign_key :cor1440_gen_pmindicadorpf, :cor1440_gen_mindicadorpf, 
      column: :mindicadorpf_id
  end
end
