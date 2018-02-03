class AsociaActorNivelrelacion < ActiveRecord::Migration[5.1]
  def change
    add_column :actor, :nivelrelacion_id, :integer
    add_foreign_key :actor, :nivelrelacion, column: :nivelrelacion_id
  end
end
