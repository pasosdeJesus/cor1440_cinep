class AsociaProyectofinancieroSectorapc < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_proyectofinanciero, :sectorapc_id, :integer
    add_foreign_key :cor1440_gen_proyectofinanciero, :sectorapc
  end
end
