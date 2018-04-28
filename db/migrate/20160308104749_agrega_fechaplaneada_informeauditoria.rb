class AgregaFechaplaneadaInformeauditoria < ActiveRecord::Migration[4.2]
  def change
    add_column :informeauditoria, :fechaplaneada, :date
  end
end
