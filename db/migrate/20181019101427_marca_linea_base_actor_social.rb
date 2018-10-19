class MarcaLineaBaseActorSocial < ActiveRecord::Migration[5.2]
  def change
    add_column :actor, :lineabase20182020, :bool, default: false
  end
end
