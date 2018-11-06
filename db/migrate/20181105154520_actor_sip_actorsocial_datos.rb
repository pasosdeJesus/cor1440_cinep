class ActorSipActorsocialDatos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO sip_grupoper(id, nombre, anotaciones)
        (SELECT id, nombre, observaciones FROM actor);
      SELECT setval('sip_grupoper_id_seq', MAX(id)) FROM 
        (SELECT 100 as id UNION
          SELECT MAX(id) FROM sip_grupoper) AS s;

      INSERT INTO sip_actorsocial(id,  grupoper_id, nivelrelacion_id,
        personacontacto, cargo, correo, telefono, fax, celular, direccion, 
        ciudad, pais_id, lineabase20182020,
        fechadeshabilitacion, created_at, updated_at)
        (SELECT id, id, nivelrelacion_id,
          personacontacto, cargo, correo, telefono, fax, celular, direccion, 
          ciudad, pais_id, lineabase20182020,
          fechadeshabilitacion, created_at, updated_at
          FROM actor);
      SELECT setval('sip_actorsocial_id_seq', MAX(id)) FROM 
        (SELECT 100 as id UNION
          SELECT MAX(id) FROM sip_actorsocial) AS s;

      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT actor_id, sectoractor_id FROM actor_sectoractor);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sip_actorsocial_sectoractor;
      DELETE FROM sip_actorsocial;
      DELETE FROM sip_grupoper;
    SQL
  end
end
