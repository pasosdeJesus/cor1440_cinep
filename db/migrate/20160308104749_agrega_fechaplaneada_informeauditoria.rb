class AgregaFechaplaneadaInformeauditoria < ActiveRecord::Migration
  def change
    add_column :informeauditoria, :fechaplaneada, :date
  end
end
