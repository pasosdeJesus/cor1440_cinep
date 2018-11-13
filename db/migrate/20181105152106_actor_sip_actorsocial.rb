class ActorSipActorsocial < ActiveRecord::Migration[5.2]
  def change
    add_column :sip_actorsocial, :personacontacto, :string, limit: 100
    add_column :sip_actorsocial, :cargo, :string, limit: 100
    add_column :sip_actorsocial, :correo, :string, limit: 100
    add_column :sip_actorsocial, :celular, :string, limit: 100
    add_column :sip_actorsocial, :ciudad, :string, limit: 100
    add_column :sip_actorsocial, :nivelrelacion_id, :integer
    add_foreign_key :sip_actorsocial, :nivelrelacion, column: :nivelrelacion_id
    add_column :sip_actorsocial, :lineabase20182020, :boolean
    add_column :sip_actorsocial, :fechadeshabilitacion, :date
  end
end
