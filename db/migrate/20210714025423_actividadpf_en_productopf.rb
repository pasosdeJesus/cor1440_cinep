class ActividadpfEnProductopf < ActiveRecord::Migration[6.1]
  def change
    remove_column :productopf, :indicadorpf_id, :integer
    add_column :productopf, :actividadpf_id, :integer
    add_foreign_key :productopf, :cor1440_gen_actividadpf, 
      column: :actividadpf_id
  end
end
