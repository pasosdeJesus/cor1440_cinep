class CreaActividadActor < ActiveRecord::Migration
  def change
    create_join_table :actividad, :actor, {
      table_name: 'actividad_actor' 
    }
    add_foreign_key :actividad_actor, :cor1440_gen_actividad, column: :actividad_id
    add_foreign_key :actividad_actor, :actor, column: :actor_id
  end
end
