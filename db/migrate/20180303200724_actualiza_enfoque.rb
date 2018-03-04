class ActualizaEnfoque < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_actividad, :sexo_onr, :integer
    add_column :cor1440_gen_actividad, :etnia_onr, :integer
    add_column :cor1440_gen_actividad, :creadopor_id, :integer
    add_foreign_key :cor1440_gen_actividad, :usuario, column: :creadopor_id
  end
end
