class ActorsocialGrupo < ActiveRecord::Migration[5.2]
  def up
    create_join_table :sip_actorsocial, :sip_grupo, {
      table_name: 'actorsocial_grupo' 
    }
    add_foreign_key :actorsocial_grupo, :sip_actorsocial
    add_foreign_key :actorsocial_grupo, :sip_grupo
    rename_column :actorsocial_grupo, :sip_actorsocial_id,
      :actorsocial_id
    rename_column :actorsocial_grupo, :sip_grupo_id,
      :grupo_id
    execute <<-SQL
      INSERT INTO actorsocial_grupo (actorsocial_id, grupo_id)
        (SELECT actor_id, sip_grupo_id FROM actor_grupo);
    SQL
  end
  def down
    drop_table :actorsocial_grupo
  end
end
