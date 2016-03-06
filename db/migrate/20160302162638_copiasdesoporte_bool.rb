class CopiasdesoporteBool < ActiveRecord::Migration
  def change
    remove_column :cor1440_gen_proyectofinanciero, :copiasdesoporte, :string
    add_column :cor1440_gen_proyectofinanciero, :copiasdesoporte, :boolean
  end
end
