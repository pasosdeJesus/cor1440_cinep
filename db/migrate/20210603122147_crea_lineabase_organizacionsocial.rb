class CreaLineabaseOrganizacionsocial < ActiveRecord::Migration[6.1]
  def up
    create_join_table  :lineabase, :sip_actorsocial,
      table_name: 'lineabase_organizacionsocial'
    add_foreign_key :lineabase_organizacionsocial, :sip_actorsocial
    add_foreign_key :lineabase_organizacionsocial, :lineabase
    rename_column :lineabase_organizacionsocial, :sip_actorsocial_id,
      :organizacionsocial_id
    execute <<-SQL
      INSERT INTO lineabase_organizacionsocial
        (organizacionsocial_id, lineabase_id)
        (SELECT  id, 1 FROM sip_actorsocial WHERE lineabase20182020='t');
    SQL
  end
  def down
    drop_table :lineabase_organizacionsocial
  end
end
