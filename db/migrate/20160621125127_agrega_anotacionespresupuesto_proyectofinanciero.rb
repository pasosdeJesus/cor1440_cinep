class AgregaAnotacionespresupuestoProyectofinanciero < ActiveRecord::Migration[4.2]
  def change
    add_column :cor1440_gen_proyectofinanciero, :apresupuesto, :string, 
      limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :aaportes, :string, 
      limit: 5000
  end
end
