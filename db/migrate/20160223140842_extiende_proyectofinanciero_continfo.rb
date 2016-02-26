class ExtiendeProyectofinancieroContinfo < ActiveRecord::Migration
  def change
    remove_column :cor1440_gen_proyectofinanciero, :rendimientosfinancieros,
      :decimal, precision: 20, scale: 2
    add_column :cor1440_gen_proyectofinanciero, :rendimientosfinancieros, 
      :string, limit: 500

    add_column :cor1440_gen_proyectofinanciero, :contrapartida, :bool
   
    add_column :cor1440_gen_proyectofinanciero, :informesnarrativos, 
     :string, limit: 500
    add_column :cor1440_gen_proyectofinanciero, :informesfinancieros, 
     :string, limit: 500
    add_column :cor1440_gen_proyectofinanciero, :informesauditoria, 
     :string, limit: 500
    add_column :cor1440_gen_proyectofinanciero, :formatosespecificos, 
     :string, limit: 500
    add_column :cor1440_gen_proyectofinanciero, :formatossolicitudpago, 
     :string, limit: 500
    add_column :cor1440_gen_proyectofinanciero, :anotacionescontab, 
     :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :gestiones, 
     :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :copiasdesoporte, 
     :string, limit: 500
    add_column :cor1440_gen_proyectofinanciero, :autenticarcompulsar, 
     :string, limit: 500
  end
end
