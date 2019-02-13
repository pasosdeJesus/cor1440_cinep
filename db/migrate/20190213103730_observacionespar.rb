class Observacionespar < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_actividad, :observacionespar, :string, limit: 5000
    add_column :cor1440_gen_actividad, :observacionesdir, :string, limit: 5000
  end
end
