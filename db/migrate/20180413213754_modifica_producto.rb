class ModificaProducto < ActiveRecord::Migration[5.2]
  def change
    add_column :productopf, :fechainiprod, :date
    add_column :productopf, :fechafinprod, :date
    add_column :productopf, :costoprevisto, :decimal
  end
end
