class AgregaDescintMindicadorpf < ActiveRecord::Migration[5.1]
  def change
    add_column :cor1440_gen_mindicadorpf, :descd1, :string, limit: 500
    add_column :cor1440_gen_mindicadorpf, :descd2, :string, limit: 500
    add_column :cor1440_gen_mindicadorpf, :descd3, :string, limit: 500
  end
end
