class AgregaIndicadorAProductopf < ActiveRecord::Migration[6.1]
  def change
    add_column :productopf, :indicadorpf_id, :integer
    add_foreign_key :productopf, :cor1440_gen_indicadorpf, column: :indicadorpf_id  
  end
end
