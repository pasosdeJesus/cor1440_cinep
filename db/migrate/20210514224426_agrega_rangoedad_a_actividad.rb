class AgregaRangoedadAActividad < ActiveRecord::Migration[6.1]
  def change
    add_column :cor1440_gen_actividad, :jovenes, :integer
    add_column :cor1440_gen_actividad, :rangoedad_onr, :integer
  end
end
