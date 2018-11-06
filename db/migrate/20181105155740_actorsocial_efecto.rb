class ActorsocialEfecto < ActiveRecord::Migration[5.2]
  def up
    create_join_table :sip_actorsocial, :efecto, {
      table_name: 'actorsocial_efecto' 
    }
    add_foreign_key :actorsocial_efecto, :sip_actorsocial
    add_foreign_key :actorsocial_efecto, :efecto
    rename_column :actorsocial_efecto, :sip_actorsocial_id, :actorsocial_id
    execute <<-SQL
      INSERT INTO actorsocial_efecto (actorsocial_id, efecto_id)
        (SELECT actor_id, efecto_id FROM actor_efecto);
    SQL
  end
  def down
    drop_table :actorsocial_efecto
  end
end
