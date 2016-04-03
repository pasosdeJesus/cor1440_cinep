class AdaptaProyectofinanciero < ActiveRecord::Migration
  def change
    remove_column :cor1440_gen_proyectofinanciero, :rendimientosfinancieros, :string
    remove_column :cor1440_gen_proyectofinanciero, :autenticarcompulsar, :string
    remove_column :cor1440_gen_proyectofinanciero, :formatossolicitudpago, :string
    remove_column :cor1440_gen_proyectofinanciero, :formatosespecificos, :string

    add_column :cor1440_gen_proyectofinanciero, :reportarrendimientosfinancieros, :boolean
    add_column :cor1440_gen_proyectofinanciero, :reinvertirrendimientosfinancieros, :boolean
    add_column :cor1440_gen_proyectofinanciero, :autenticarcompulsar, :boolean
    add_column :cor1440_gen_proyectofinanciero, :anotacionesdb, :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :anotacionesrh, :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :anotacionesre, :string, limit: 5000
    add_column :cor1440_gen_proyectofinanciero, :anotacionesinf, :string, limit: 5000
  end
end
