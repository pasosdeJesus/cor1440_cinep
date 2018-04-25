class AsociaEpscajafondoUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuario, :empresaps_id, :integer 
    add_foreign_key :usuario, :empresaps
    add_column :usuario, :cajacompensacion_id, :integer 
    add_foreign_key :usuario, :cajacompensacion
    add_column :usuario, :fondopensiones_id, :integer 
    add_foreign_key :usuario, :fondopensiones
  end
end
