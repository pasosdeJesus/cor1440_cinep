class ActividadActorsocial < ActiveRecord::Migration[5.2]
  def up
    create_join_table :cor1440_gen_actividad, :sip_actorsocial, {
      table_name: 'actividad_actorsocial' 
    }
    add_foreign_key :actividad_actorsocial, :cor1440_gen_actividad
    add_foreign_key :actividad_actorsocial, :sip_actorsocial
    rename_column :actividad_actorsocial, :cor1440_gen_actividad_id, 
      :actividad_id
    rename_column :actividad_actorsocial, :sip_actorsocial_id,
      :actorsocial_id
    execute <<-SQL
      INSERT INTO actividad_actorsocial (actividad_id, actorsocial_id)
        (SELECT actividad_id, actor_id FROM actividad_actor);
    SQL
  end
  def down
    drop_table :actividad_actorsocial
  end
end
