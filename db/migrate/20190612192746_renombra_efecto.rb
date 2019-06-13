class RenombraEfecto < ActiveRecord::Migration[6.0]
  def change
    rename_table :efecto, :cor1440_gen_efecto
    rename_table :actorsocial_efecto, :cor1440_gen_actorsocial_efecto
    rename_table :anexo_efecto, :cor1440_gen_anexo_efecto
  end
end
