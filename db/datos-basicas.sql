-- Volcado de tablas basicas

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;


INSERT INTO cor1440_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'C1 INVESTIGACIÓN E INCIDENCIA', '', '2014-02-08', NULL, '2014-05-15 21:54:52.38907', '2015-02-17 18:47:57.539324');
INSERT INTO cor1440_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'C2 EDUCACIÓN POPULAR, FORMACIÓN, ACOMPAÑAMIENTO E INCIDENCIA', '', '2014-09-29', NULL, '2014-09-29 14:14:53.534761', '2015-02-17 18:49:35.559975');
INSERT INTO cor1440_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'OE.1 I.1 AUMENTO ANUAL DEL 30% EN EL NÚMERO DE ESCENARIOS DE TOMA DE DECISIÓN EN LOS CUALES SE PARTICIPA CON LOS INSUMOS DE LAS INVESTIGACIONES Y/O LOS ANÁLISIS ORIENTADOS A LA TRANSFORMACIÓN DE LOS NÚCLEOS DE CONFLICTOS.', 'Aumento anual del 30% en el número de escenarios de toma de decisión en los cuales se participa con los insumos de las investigaciones y/o los análisis orientados a la transformación de los núcleos de conflictos.', '2014-09-29', NULL, '2014-09-29 14:08:40.721678', '2015-04-08 10:57:23.224326');
INSERT INTO cor1440_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'OE.1. I.2. EN EL 2017, POR LO MENOS EL 80% DE LOS ACTORES ENTREVISTADOS CON LOS CUALES EL CINEP COMPARTE ESCENARIOS DE TOMA DE DECISIÓN, USA LA INFORMACIÓN Y EL ANÁLISIS DEL CINEP PARA LA TRANSFORMACIÓN DE LOS NÚCLEOS DE CONFLICTO EN ESPACIOS DE INCIDENCIA.', '', '2014-01-29', NULL, '2014-01-29 16:15:43.824216', '2015-04-08 10:58:38.0828');
INSERT INTO cor1440_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'OE.2.I.1. AL FINALIZAR EL PROYECTO, AL MENOS EL 90% DE LOS ACTORES SOCIALES ACOMPAÑADOS EN ACCIONES DE INCIDENCIA IMPLEMENTAN POR LO MENOS UNA ACCIÓN COLECTIVA PARA INFLUIR EN LA TRANSFORMACIÓN DE NÚCLEOS DE CONFLICTO.', '', '2013-12-04', NULL, '2014-01-09 02:23:28.732636', '2015-04-08 11:00:08.176788');
INSERT INTO cor1440_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'OE.2 I.2 POR LO MENOS, EL 40% DE LAS ACCIONES COLECTIVAS ESTÁN VINCULADAS A LA REALIZACIÓN  DE DERECHOS ESPECÍFICOS DE GÉNERO Y ETNIAS', '', '2013-12-04', NULL, '2014-01-09 02:23:28.749798', '2015-04-08 11:00:32.416442');


--

INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (116, 'SIG', '2015-01-29', NULL, '2015-01-30 01:44:37.391637', '2015-02-17 18:37:47.002715', NULL);
INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (117, 'MOVILIZACIÓN, TIERRA Y TERRITORIOS', '2015-02-17', NULL, '2015-02-17 18:37:08.372954', '2015-02-17 18:38:50.200984', NULL);
INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (114, 'CIUDADANÍA Y PAZ', '2014-09-29', NULL, '2014-09-29 12:20:46.14187', '2015-02-17 18:39:40.21497', NULL);
INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (102, 'COMUNICACIONES', '2014-09-29', NULL, '2014-09-29 12:14:42.06105', '2015-02-17 18:39:48.48726', NULL);
INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (104, 'CONFLICTO, ESTADO  Y DESARROLLO', '2014-09-29', NULL, '2014-09-29 12:16:01.289514', '2015-02-17 18:39:54.205105', NULL);
INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (101, 'DERECHOS HUMANOS: BANCO DE DATOS', '2014-09-29', NULL, '2014-09-29 12:13:05.736821', '2015-02-17 18:40:03.288084', NULL);
INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (105, 'DERECHOS HUMANOS: RED DE BANCOS DE DATOS', '2014-09-29', NULL, '2014-09-29 12:16:23.068327', '2015-02-17 18:40:09.453648', NULL);
INSERT INTO sip_oficina (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (106, 'DERECHOS HUMANOS: VOCES DE LA MEMORIA', '2014-09-29', NULL, '2014-09-29 12:17:01.777941', '2015-02-17 18:40:42.749356', NULL);


--
-- Data for Name: sectoractor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'EMPRESA PRIVADA', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ORGANIZACIÓN SINDICAL', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ORGANIZACIÓN ESTUDIANTIL', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'POBLADORES URBANOS', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ESTUDIANTES', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'MEDIOS DE COMUNICACIÓN', NULL, false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'ORGANIZACIÓN RELIGIOSA', NULL, false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'AGENCIA FINANCIADORA', NULL, false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ACADEMIA', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'IGLESIA', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ORGANIZACIÓN DE BASE', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'GOBIERNO', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ONG NACIONAL', '', true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-22 01:53:32.79966');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ONG INTERNACIONAL', '', true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-22 01:53:08.383017');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'GREMIOS', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OBSERVATORIOS DE PROGRAMAS DE PAZ Y DESARROLLO', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');


--
-- Name: sectoractor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sectoractor_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO actor (id, nombre, sectoractor_id, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'Pasos de Jesús', 16, 'Vladimir Támara Patiño', 'Desarrollador', 'vtamara@pasosdeJesus.org', NULL, NULL, '3165383162', NULL, 'BOGOTÁ', 170, NULL, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO actor (id, nombre, sectoractor_id, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'Banco de Datos del CINEP', 6, 'Yebrail Alvarez', 'Coordinador', 'lutas@nocheyniebla.org', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, '', '2015-05-21', NULL, '2015-05-22 01:52:05.633562', '2015-05-22 01:54:54.379122');
INSERT INTO actor (id, nombre, sectoractor_id, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CINEP/PPP', 6, 'Luis Guillermo Guerrero', 'Director', 'direccion@cinep.org.co', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, ' ', '2015-05-21', NULL, '2015-05-22 01:55:42.597229', '2015-05-22 01:55:42.597229');


--
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actor_id_seq', 103, true);


--
-- PostgreSQL database dump complete
--

