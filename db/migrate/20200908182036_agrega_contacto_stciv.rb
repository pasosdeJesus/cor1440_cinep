class AgregaContactoStciv < ActiveRecord::Migration[6.0]
  def change
    add_column :sip_actorsocial_persona, :stciv, :bool, null: false, 
      default: false
  end
end
