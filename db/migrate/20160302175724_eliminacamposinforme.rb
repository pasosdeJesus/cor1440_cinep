class Eliminacamposinforme < ActiveRecord::Migration
  def change
    remove_column :cor1440_gen_proyectofinanciero, :informesnarrativos, :string
    remove_column :cor1440_gen_proyectofinanciero, :informesfinancieros, :string
    remove_column :cor1440_gen_proyectofinanciero, :informesauditoria, :string
  end
end
