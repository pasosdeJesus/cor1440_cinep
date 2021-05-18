class CreaRegionesT2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'BOGOTÁ Y ALREDEDORES (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:15:58.127129', '2021-05-18 11:15:58.127129');
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'CARIBE (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:29:36.510141', '2021-05-18 11:29:36.510141');
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'ANDINA (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:54:10.350828', '2021-05-18 11:54:10.350828');
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'ANDÉN PACÍFICO (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:56:55.289628', '2021-05-18 11:56:55.289628');
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'AMAZONAS (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:59:40.97658', '2021-05-18 11:59:40.97658');
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'FRONTERA COLOMBO VENEZOLANA (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 12:02:45.683991', '2021-05-18 12:02:45.683991');
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'MAGDALENA MEDIO (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 12:03:33.611859', '2021-05-18 12:03:33.611859');
      INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'ORINOCO (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 12:03:56.809076', '2021-05-18 12:03:56.809076');


      INSERT INTO public.regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (31, 4);

      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (31, 469);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (31, 1216);
      
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 22);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 31);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 41);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 53);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 337);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 361);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 396);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 418);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 431);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 640);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 718);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 720);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 759);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 784);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 793);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 859);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 886);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 963);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 1062);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 1066);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 1117);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 1122);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 1183);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 1336);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (32, 1424);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 19);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 27);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 28);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 38);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 42);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 44);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 46);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 243);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 478);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 805);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 823);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 929);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 1091);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 1196);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 1226);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 1315);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (33, 1422);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 48);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 86);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 213);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 256);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 566);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 723);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 733);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 766);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 799);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 1028);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 1307);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 1317);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 1345);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (34, 1348);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 40);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 51);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 707);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 940);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 942);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 1182);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 1214);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 1381);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (35, 1415);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 18);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 32);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 481);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 539);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 602);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 1056);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 1058);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 1193);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 1257);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (36, 1320);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (37, 1204);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (37, 1319);
      INSERT INTO public.regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id) VALUES (38, 57);
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM public.regiongrupo_sip_municipio 
        WHERE regiongrupo_id>=31 AND regiongrupo_id<=38;
      DELETE FROM public.regiongrupo_sip_departamento
        WHERE regiongrupo_id>=31 AND regiongrupo_id<=38;
      DELETE FROM public.regiongrupo
        WHERE id>=31 AND id<=38;
    SQL
  end
end
