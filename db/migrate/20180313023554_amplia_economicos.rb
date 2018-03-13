class AmpliaEconomicos < ActiveRecord::Migration[5.1]
  def change
    add_column :cor1440_gen_proyectofinanciero, :tasa, :float
    add_column :cor1440_gen_proyectofinanciero, :tasaej, :float
    add_column :cor1440_gen_proyectofinanciero, :montoej, :float
    add_column :cor1440_gen_proyectofinanciero, :aportecinepej, :float
    add_column :cor1440_gen_proyectofinanciero, :aporteotrosej, :float
    add_column :cor1440_gen_proyectofinanciero, :saldoej, :float
    add_column :cor1440_gen_proyectofinanciero, :presupuestototalej, :float
  end
end
