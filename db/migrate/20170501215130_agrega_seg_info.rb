class AgregaSegInfo < ActiveRecord::Migration[5.0]
  def change
    [:informenarrativo, :informefinanciero, :informeauditoria].each do |m|
      add_column m, :fechareal, :date
      add_column m, :devoluciones, :boolean
      add_column m, :seguimiento, :string, limit: 5000
    end
  end
end
