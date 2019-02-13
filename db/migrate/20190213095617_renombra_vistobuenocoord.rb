class RenombraVistobuenocoord < ActiveRecord::Migration[5.2]
  def change
    rename_column :cor1440_gen_actividad, :vistobuenocoord, :vistobuenopar
  end
end
