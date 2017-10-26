class AmpliaActorsocialQuinquenal < ActiveRecord::Migration[5.1]
  def change
    create_join_table :actor, :sip_grupo, {
      table_name: 'actor_grupo' 
    }
    add_foreign_key :actor_grupo, :actor, column: :actor_id
    add_foreign_key :actor_grupo, :sip_grupo, column: :sip_grupo_id

    create_join_table :actor, :regiongrupo, {
      table_name: 'actor_regiongrupo' 
    }
    add_foreign_key :actor_regiongrupo, :actor, column: :actor_id
    add_foreign_key :actor_regiongrupo, :regiongrupo, column: :regiongrupo_id
  end
end
