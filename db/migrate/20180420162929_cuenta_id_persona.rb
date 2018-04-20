class CuentaIdPersona < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      SELECT pg_catalog.setval('sip_persona_id_seq', 1+GREATEST(MAX(id), 100), false) FROM sip_persona;
    SQL
  end

  def down
  end
end
