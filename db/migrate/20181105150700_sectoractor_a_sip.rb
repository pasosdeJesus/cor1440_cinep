class SectoractorASip < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      DELETE FROM sip_sectoractor;
      INSERT INTO sip_sectoractor (id, nombre, observaciones, fechacreacion,
        fechadeshabilitacion, created_at, updated_at) 
        (SELECT id, nombre, observaciones, fechacreacion,
          fechadeshabilitacion, created_at, updated_at FROM sectoractor);
      SELECT setval('sip_sectoractor_id_seq', MAX(id)) FROM 
        (SELECT 100 as id UNION
          SELECT MAX(id) FROM sip_sectoractor) AS s;
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sip_sectoractor;
    SQL
  end
end
