class RegionesQuinquenal < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO "regiongrupo" ("id", "nombre", "observaciones", "fechacreacion", 
        "created_at", "updated_at") VALUES ('20', 'CARIBE', 'Plan quinquenal 2018-2022',
        '2017-10-25', '2017-10-25', '2017-10-25');
  
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '1117');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '1257');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '22');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '1452');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '640');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '604');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '718');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '720');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '741');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '784');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '41');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '793');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '927');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '945');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '963');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '49');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '1183');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '53');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '1313');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '55');
      INSERT INTO "regiongrupo_sip_municipio" ("regiongrupo_id", "sip_municipio_id") VALUES ('20', '1462');


      INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'FRONTERA COLOMBO VENEZOLANA', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 12:54:14.72199', '2017-10-26 12:54:14.72199');
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 18);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 1056);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 258);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 32);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 110);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 481);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 877);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 1058);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 1193);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 1320);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (21, 1398);
      
      
      INSERT INTO regiongrupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'MAGDALENA MEDIO', 'Plan Quinquenal 2018-2022', '2017-10-26', NULL, '2017-10-26 12:56:30.833328', '2017-10-26 12:56:30.833328');
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (22, 1319);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (22, 652);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (22, 812);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (22, 1014);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (22, 1095);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (22, 1204);
      
      
      INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'ANDINA', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:00:07.044693', '2017-10-26 13:00:07.044693');
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 861);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 19);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1091);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 28);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 243);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 336);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 478);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 112);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 664);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 719);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 38);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 42);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 44);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 929);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 46);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 936);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1030);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1136);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1145);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1125);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1203);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1265);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1340);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1344);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (23, 1411);
      
      
      INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'BOGOTA Y ALREDEDORES', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:01:14.728238', '2017-10-26 13:01:14.728238');
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (24, 24);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (24, 469);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (24, 1216);
      
      
      INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'ANDÉN PACÍFICO', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:02:18.195017', '2017-10-26 13:02:18.195017');
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (25, 213);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (25, 566);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (25, 618);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (25, 48);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (25, 1028);
      INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (25, 1345);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id>='20' AND regiongrupo_id<='25';
      DELETE FROM regiongrupo WHERE id>='20' AND id<='25';
    SQL
  end
end
