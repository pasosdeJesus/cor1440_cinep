class ActorEfecto < ActiveRecord::Migration[5.2]
  def up
    create_join_table :actor, :efecto, {
      table_name: 'actor_efecto' 
    }
    add_foreign_key :actor_efecto, :actor
    add_foreign_key :actor_efecto, :efecto
    execute <<-SQL
      INSERT INTO actor_efecto (SELECT DISTINCT actor_id, id as efecto_id 
        FROM efecto WHERE actor_id IS NOT NULL);
    SQL
    remove_foreign_key :efecto, :actor
    rename_column :efecto, :actor_id, :actor_id_porborrar
  end

  def down
    rename_column :efecto, :actor_id_porborrar, :actor_id
    add_foreign_key :efecto, :actor
    remove_foreign_key :actor_efecto, :actor
    remove_foreign_key :actor_efecto, :efecto
    drop_table :actor_efecto
  end
end
