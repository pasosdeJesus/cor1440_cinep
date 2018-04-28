class AgregaPorcentajeCargo < ActiveRecord::Migration[4.2]
  def change
    add_column :proyectofinanciero_usuario, :porcentaje, :integer
  end
end
