class AgregaPresupuesto < ActiveRecord::Migration[4.2]
  def change
    add_column :cor1440_gen_proyectofinanciero, :presupuestototal, :decimal,
      precision: 20, scale: 2
    add_column :cor1440_gen_proyectofinanciero, :aportecinep, :decimal,
      precision: 20, scale: 2
    add_column :cor1440_gen_proyectofinanciero, :otrosaportescinep, :string, 
      limit: 500
    add_column :cor1440_gen_proyectofinanciero, :empresaauditoria, :string, 
      limit: 500
  end
end
