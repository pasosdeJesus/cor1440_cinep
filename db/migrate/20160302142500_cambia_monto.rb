class CambiaMonto < ActiveRecord::Migration
  def change
    change_column :cor1440_gen_proyectofinanciero, :monto, :decimal,
            precision: 20, scale: 2
  end
end
