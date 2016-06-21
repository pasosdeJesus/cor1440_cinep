class AgregaPorcentajeCargo < ActiveRecord::Migration
  def change
    add_column :proyectofinanciero_usuario, :porcentaje, :integer
  end
end
