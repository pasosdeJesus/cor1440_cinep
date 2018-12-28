class AmpliaMindicadorpfUrlevrind < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_pmindicadorpf,
      :urlevrind, :string, limit: 1024
  end
end
