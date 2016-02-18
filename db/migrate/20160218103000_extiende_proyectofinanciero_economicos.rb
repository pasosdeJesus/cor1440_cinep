class ExtiendeProyectofinancieroEconomicos < ActiveRecord::Migration
  def change
    add_column :cor1440_gen_proyectofinanciero, :tipomoneda_id, :integer
    add_column :cor1440_gen_proyectofinanciero, :saldo, :decimal, 
      precision: 20, scale: 2
    add_column :cor1440_gen_proyectofinanciero, :acuse, :bool
    add_column :cor1440_gen_proyectofinanciero, :sucursal, :string, limit: 500
    add_column :cor1440_gen_proyectofinanciero, :centrocosto, :string, 
      limit: 500
    add_column :cor1440_gen_proyectofinanciero, :cuentasbancarias, :string, 
      limit: 500
    add_column :cor1440_gen_proyectofinanciero, :rendimientosfinancieros, 
      :decimal, precision: 20, scale: 2
    add_foreign_key :cor1440_gen_proyectofinanciero, :tipomoneda, column: :tipomoneda_id  
  end
end
