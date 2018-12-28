class AmpliaMindicadorpf < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_pmindicadorpf, :urlev1, :string, limit: 1024
    add_column :cor1440_gen_pmindicadorpf, :urlev2, :string, limit: 1024
    add_column :cor1440_gen_pmindicadorpf, :urlev3, :string, limit: 1024
  end
end
