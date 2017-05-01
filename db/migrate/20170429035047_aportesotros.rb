class Aportesotros < ActiveRecord::Migration[5.0]
  def change
    add_column :cor1440_gen_proyectofinanciero, :aotrosfin, :decimal
    add_column :cor1440_gen_proyectofinanciero, :aotrosesp, :string, limit: 500
  end
end
