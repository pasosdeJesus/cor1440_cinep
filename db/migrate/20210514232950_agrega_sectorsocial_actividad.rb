class AgregaSectorsocialActividad < ActiveRecord::Migration[6.1]
  def change
    add_column :cor1440_gen_actividad, :campesinos, :integer
    add_column :cor1440_gen_actividad, :sectorsocial_onr, :integer
  end
end
