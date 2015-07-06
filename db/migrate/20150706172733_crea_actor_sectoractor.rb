class CreaActorSectoractor < ActiveRecord::Migration
  def change
    create_join_table :actor, :sectoractor, {
      table_name: 'actor_sectoractor' 
    }
    add_foreign_key :actor_sectoractor, :actor, column: :actor_id
    add_foreign_key :actor_sectoractor, :sectoractor, column: :sectoractor_id

    execute <<-SQL
      INSERT INTO actor_sectoractor (actor_id, sectoractor_id) 
        (SELECT id, sectoractor_id FROM actor)
    SQL
  end
end
