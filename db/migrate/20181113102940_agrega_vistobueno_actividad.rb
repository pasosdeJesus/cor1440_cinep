class AgregaVistobuenoActividad < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_actividad, :vistobuenocoord, :boolean
    add_column :cor1440_gen_actividad, :vistobuenodir, :boolean
  end
end
