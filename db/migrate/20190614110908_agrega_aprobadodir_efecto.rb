class AgregaAprobadodirEfecto < ActiveRecord::Migration[6.0]
  def change
    add_column :cor1440_gen_efecto, :aprobadodir, :boolean
    add_column :cor1440_gen_efecto, :observacionesdir, :string, limit: 1000

  end
end
