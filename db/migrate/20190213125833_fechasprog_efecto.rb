class FechasprogEfecto < ActiveRecord::Migration[5.2]
  def change
    add_column :efecto, :fecha20, :date
    add_column :efecto, :fecha40, :date
    add_column :efecto, :fecha60, :date
    add_column :efecto, :fecha80, :date
    add_column :efecto, :fecha100, :date

    add_column :cor1440_gen_tipoindicador, :desc20, :string, limit: 128
    add_column :cor1440_gen_tipoindicador, :desc40, :string, limit: 128
    add_column :cor1440_gen_tipoindicador, :desc60, :string, limit: 128
    add_column :cor1440_gen_tipoindicador, :desc80, :string, limit: 128
    add_column :cor1440_gen_tipoindicador, :desc100, :string, limit: 128
  end
end
