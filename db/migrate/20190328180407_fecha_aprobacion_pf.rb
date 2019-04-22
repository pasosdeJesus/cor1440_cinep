class FechaAprobacionPf < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_proyectofinanciero, :fechaaprobacion, :date
  end
end
