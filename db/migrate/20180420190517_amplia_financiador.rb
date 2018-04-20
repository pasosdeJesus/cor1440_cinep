class AmpliaFinanciador < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_financiador, :razonsocial, :string, limit: 511
    add_column :cor1440_gen_financiador, :nit, :string, limit: 31
    add_column :cor1440_gen_financiador, :replegal, :string, limit: 511
    add_column :cor1440_gen_financiador, :domicilio, :string, limit: 511
    add_column :cor1440_gen_financiador, :web, :string, limit: 511
  end
end
