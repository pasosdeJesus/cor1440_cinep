class AgregaAnotacionespresupuestoProyectofinanciero < ActiveRecord::Migration
  def change
    add_column :cor1440_gen_proyectofinanciero, :apresupuesto, :string, 
      limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :aaportes, :string, 
      limit: 5000
  end
end
