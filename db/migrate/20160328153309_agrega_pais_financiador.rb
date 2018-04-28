class AgregaPaisFinanciador < ActiveRecord::Migration[4.2]
  def change
    add_column :cor1440_gen_financiador, :pais_id, :integer
    add_foreign_key :cor1440_gen_financiador, :sip_pais, column: :pais_id
  end
end
