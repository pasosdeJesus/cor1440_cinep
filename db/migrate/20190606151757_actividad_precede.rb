class ActividadPrecede < ActiveRecord::Migration[6.0]
  def change
    add_column :cor1440_gen_actividad, :precedidapor, :integer
    add_foreign_key :cor1440_gen_actividad, :cor1440_gen_actividad, 
      column: :precedidapor
  end
end
