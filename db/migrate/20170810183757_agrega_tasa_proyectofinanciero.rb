class AgregaTasaProyectofinanciero < ActiveRecord::Migration[5.1]
  def change
    add_column :cor1440_gen_proyectofinanciero, :tasaformulacion_id, :integer
    add_foreign_key :cor1440_gen_proyectofinanciero,
      :tasacambio, column: :tasaformulacion_id
  end
end
