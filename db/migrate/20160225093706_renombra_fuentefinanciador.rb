class RenombraFuentefinanciador < ActiveRecord::Migration[4.2]
  def change
    rename_column :cor1440_gen_proyectofinanciero, :fuentefinanciacion,
      :fuentefinanciador
  end
end
