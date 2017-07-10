class AgregaEstadoCompromiso < ActiveRecord::Migration[5.0]
  def change
    add_column :cor1440_gen_proyectofinanciero, :respgp_id, :integer
    add_column :cor1440_gen_proyectofinanciero, :estado, :string, limit: 1
    add_column :cor1440_gen_proyectofinanciero, :dificultad, :string, limit: 1
    add_foreign_key :cor1440_gen_proyectofinanciero, :usuario, column: :respgp_id
  end
end
