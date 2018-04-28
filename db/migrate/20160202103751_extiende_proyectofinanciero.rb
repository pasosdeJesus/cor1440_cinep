class ExtiendeProyectofinanciero < ActiveRecord::Migration[4.2]
  def change
    add_column :cor1440_gen_proyectofinanciero, :referencia, :string, limit: 1000
    add_column :cor1440_gen_proyectofinanciero, :referenciacinep, 
      :string, limit: 1000
    add_column :cor1440_gen_proyectofinanciero, :fuentefinanciacion, 
      :string, limit: 1000
    add_column :cor1440_gen_proyectofinanciero, :respagencia, 
      :string, limit: 100
    add_column :cor1440_gen_proyectofinanciero, :emailrespagencia, 
      :string, limit: 100
    add_column :cor1440_gen_proyectofinanciero, :telrespagencia, 
      :string, limit: 100
    add_column :cor1440_gen_proyectofinanciero, :fechaliquidacion, :date
  end
end
