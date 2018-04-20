class AmpliaInformeauditoria < ActiveRecord::Migration[5.2]
  def change
    add_column :informeauditoria, :presupuestodonante, :decimal
    add_column :informeauditoria, :presupuestoorg, :decimal
  end
end
