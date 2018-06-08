class ConteoParticipantesActividad < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_actividad, :hombres_proceso, :integer
    add_column :cor1440_gen_actividad, :mujeres_proceso , :integer
    add_column :cor1440_gen_actividad, :sexo_onr_proceso , :integer
    add_column :cor1440_gen_actividad, :hombres_nobef , :integer
    add_column :cor1440_gen_actividad, :mujeres_nobef , :integer
    add_column :cor1440_gen_actividad, :sexo_onr_nobef , :integer
    add_column :cor1440_gen_actividad, :negros_proceso , :integer
    add_column :cor1440_gen_actividad, :indigenas_proceso , :integer
    add_column :cor1440_gen_actividad, :etnia_onr_proceso , :integer
    add_column :cor1440_gen_actividad, :negros_nobef , :integer
    add_column :cor1440_gen_actividad, :indigenas_nobef , :integer
    add_column :cor1440_gen_actividad, :etnia_onr_nobef , :integer
  end
end
