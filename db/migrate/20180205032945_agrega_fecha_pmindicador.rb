class AgregaFechaPmindicador < ActiveRecord::Migration[5.1]
  def change
    add_column :cor1440_gen_pmindicadorpf, :fecha, :date
  end
end
