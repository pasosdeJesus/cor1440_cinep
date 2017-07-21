class AgregagaCgseg < ActiveRecord::Migration[5.1]
  def change
    add_column :cor1440_gen_proyectofinanciero, :objeto, :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :observacionestramite, :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :observacionesejecucion, :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :observacionescierre, :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :fechaformulacion, :date
    add_column :cor1440_gen_proyectofinanciero, :montopesos, :decimal
  end
end
