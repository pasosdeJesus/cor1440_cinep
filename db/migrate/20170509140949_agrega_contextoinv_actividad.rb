class AgregaContextoinvActividad < ActiveRecord::Migration[5.0]
  def change
    add_column :cor1440_gen_actividad, :contextoinv_id, :integer
    add_foreign_key :cor1440_gen_actividad, :contextoinv
  end
end
