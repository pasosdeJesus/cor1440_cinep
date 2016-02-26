class RenombraFuentefinanciador < ActiveRecord::Migration
  def change
    rename_column :cor1440_gen_proyectofinanciero, :fuentefinanciacion,
      :fuentefinanciador
  end
end
