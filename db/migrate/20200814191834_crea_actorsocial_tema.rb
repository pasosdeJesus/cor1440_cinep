class CreaActorsocialTema < ActiveRecord::Migration[6.0]
  def up
    create_join_table :sip_actorsocial, :csivitema, {
      table_name: 'actorsocial_csivitema'
    }
    add_foreign_key :actorsocial_csivitema, :sip_actorsocial
    add_foreign_key :actorsocial_csivitema, :csivitema
    rename_column :actorsocial_csivitema, :sip_actorsocial_id,
      :actorsocial_id
    execute <<-SQL
      INSERT INTO actorsocial_csivitema (actorsocial_id, csivitema_id)
        (SELECT id, csivitema_id FROM sip_actorsocial 
          WHERE csivitema_id IS NOT NULL);
    SQL
    remove_column :sip_actorsocial, :csivitema_id
  end
  def down
    add_column :sip_actorsocial, :csivitema_id, :integer
    execute <<-SQL
      UPDATE sip_actorsocial SET csivitema_id=at.csivitema_id FROM
        actorsocial_tema AS at WHERE at.actorsocial_id=sip_actorsocial.id
        LIMIT 1;
    SQL
    drop_table :actorsocial_csivitema
  end
end
