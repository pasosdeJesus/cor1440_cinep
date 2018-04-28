class CambiaMonto < ActiveRecord::Migration[4.2]
  def change
    change_column :cor1440_gen_proyectofinanciero, :monto, :decimal,
            precision: 20, scale: 2
  end
end
