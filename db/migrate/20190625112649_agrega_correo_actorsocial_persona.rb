# encoding: UTF-8

class AgregaCorreoActorsocialPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :sip_actorsocial_persona, :correo, :string, limit: 254
    add_column :sip_actorsocial_persona, :cargo, :string, limit: 254
  end
end
