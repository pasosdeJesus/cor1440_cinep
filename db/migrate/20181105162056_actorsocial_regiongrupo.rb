class ActorsocialRegiongrupo < ActiveRecord::Migration[5.2]
  def up
    create_join_table :sip_actorsocial, :regiongrupo, {
      table_name: 'actorsocial_regiongrupo' 
    }
    add_foreign_key :actorsocial_regiongrupo, :sip_actorsocial
    add_foreign_key :actorsocial_regiongrupo, :regiongrupo
    rename_column :actorsocial_regiongrupo, :sip_actorsocial_id,
      :actorsocial_id
    execute <<-SQL
      INSERT INTO actorsocial_regiongrupo (actorsocial_id, regiongrupo_id)
        (SELECT actor_id, regiongrupo_id FROM actor_regiongrupo);
    SQL
  end
  def down
    drop_table :actorsocial_regiongrupo
  end
end
