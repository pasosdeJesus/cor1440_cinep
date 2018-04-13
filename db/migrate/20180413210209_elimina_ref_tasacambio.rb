class EliminaRefTasacambio < ActiveRecord::Migration[5.2]
  def change
    remove_column :cor1440_gen_proyectofinanciero, :tasaformulacion_id, :integer
  end
end
