-- Volcado de tablas basicas

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: sectoractor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'EMPRESA PRIVADA', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:26:43.926178');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'RAMA JUDICIAL DE COLOMBIA', '', false, '2015-07-02', NULL, '2015-07-02 14:10:01.235085', '2017-10-20 20:30:28.690403');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CAMPESINOS', '', true, '2015-07-06', NULL, '2015-07-06 16:42:53.864868', '2015-07-06 16:42:53.864868');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'INDÍGENAS', '', true, '2015-07-06', NULL, '2015-07-06 16:43:06.605376', '2015-07-08 16:10:55.529329');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'AFRO', '', true, '2015-07-06', NULL, '2015-07-06 16:43:21.009592', '2015-07-06 16:43:44.308433');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'LGBT', '', true, '2015-07-06', NULL, '2015-07-06 16:44:09.327762', '2015-07-06 16:44:09.327762');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'TRABAJADORES', '', true, '2015-07-06', NULL, '2015-07-06 16:44:32.688661', '2015-07-06 16:44:32.688661');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'VÍCTIMAS', '', true, '2015-07-06', NULL, '2015-07-06 16:44:47.571089', '2015-07-06 16:44:47.571089');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ORGANIZACIÓN SINDICAL', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:30:08.112476');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (112, 'ORGANIZACIONES ECLESIALES', '', true, '2015-07-06', NULL, '2015-07-06 16:45:35.839411', '2015-07-06 16:45:35.839411');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (113, 'MUJERES', '', true, '2015-07-06', NULL, '2015-07-06 17:07:38.092972', '2015-07-06 17:07:38.092972');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (114, 'DERECHOS HUMANOS', '', false, '2015-07-09', NULL, '2015-07-09 22:12:59.378821', '2015-07-09 22:12:59.378821');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (115, 'CUERPO DIPLOMÁTICO ACREDITADO EN COLOMBIA', '', false, '2015-07-12', NULL, '2015-07-12 15:23:26.978361', '2015-07-12 15:23:26.978361');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (116, 'COMUNIDAD EDUCATIVA', 'Equipo Ciudadnia y Paz. Juan Carlos sugirió.', false, '2017-02-20', NULL, '2017-02-20 16:53:32.643025', '2017-10-20 20:30:59.920274');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (117, 'FUERZA PUBLICA', '', false, '2017-10-20', NULL, '2017-10-20 20:27:31.381285', '2017-10-20 20:27:31.381285');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (118, 'REDES SOCIALES Y PLATAFORMAS', '', false, '2017-10-20', NULL, '2017-10-20 20:28:10.908229', '2017-10-20 20:28:10.908229');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (119, 'AMBIENTALISTAS', '', false, '2017-10-20', NULL, '2017-10-20 20:29:24.779438', '2017-10-20 20:29:24.779438');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ORGANIZACIÓN ESTUDIANTIL', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:29:54.28059');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (120, 'JÓVENES', '', false, '2017-10-20', NULL, '2017-10-20 20:30:12.872261', '2017-10-20 20:30:12.872261');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (121, 'JUNTAS DE ACCIÓN COMUNAL', '', false, '2017-10-20', NULL, '2017-10-20 20:35:26.722204', '2017-10-20 20:35:26.722204');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (122, 'ASOCIACIONES PRODUCTIVAS', '', false, '2017-10-20', NULL, '2017-10-20 20:36:33.580785', '2017-10-20 20:36:33.580785');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (123, 'ENTIDADES PÚBLICAS', '', false, '2017-10-20', NULL, '2017-10-20 20:38:22.321086', '2017-10-20 20:38:22.321086');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (124, 'REDES Y OBRAS DE LA COMPAÑÍA DE JESÚS', '', false, '2017-10-20', NULL, '2017-10-20 20:39:19.560834', '2017-10-20 20:39:19.560834');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'POBLADORES URBANOS', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ESTUDIANTES', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'MEDIOS DE COMUNICACIÓN', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-07-13 21:53:23.234082');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'AGENCIA COOPERANTE/FINANCIADORA', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-07-06 20:39:28.071497');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'FORMULA POLÍTICAS PÚBLICAS', NULL, NULL, '2018-02-03', NULL, '2018-02-03 00:00:00', '2018-02-03 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ACADEMIA', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:26:08.80564');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ORGANIZACIÓN DE BASE', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:28:52.006934');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'GOBIERNO', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:26:56.324982');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ONG NACIONAL', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:28:39.047376');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ONG INTERNACIONAL', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:28:25.783732');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'GREMIOS', '', true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:27:05.261764');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OBSERVATORIOS DE PROGRAMAS DE PAZ Y DESARROLLO', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2017-10-20 20:27:26.87071');


--
-- Name: sectoractor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sectoractor_id_seq', 124, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (1, 'PASOS DE JESÚS', 'Vladimir Támara Patiño', 'Desarrollador', 'vtamara@pasosdeJesus.org', '', '', '3165383162', '', 'Bogotá', 170, '', '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-07-06 17:21:32.831135', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (102, 'BANCO DE DATOS DEL CINEP', 'Yebrail Alvarez', 'Coordinador', 'lutas@nocheyniebla.org', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, '', '2015-05-21', NULL, '2015-05-22 01:52:05.633562', '2018-05-23 17:53:00.838886', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (103, 'CINEP/PPP', 'Luis Guillermo Guerrero', 'Director', 'direccion@cinep.org.co', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, ' ', '2015-05-21', NULL, '2015-05-22 01:55:42.597229', '2015-07-06 17:00:57.711824', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (104, 'DIÓCESIS DE ISTIMA - TADO - BANCO DE DATOS', 'Diócesis de Istmina-Tadó', 'Vicaría de Pastoral Indígena de la Diócesis de Istmina-Tadó', '', '', '', '', '', 'Istmina', 170, 'Nivel 1. Responsable: Yebrail', '2015-05-21', NULL, '2015-05-22 02:40:32.355268', '2018-05-23 17:55:56.518506', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (105, 'EQUIPO JURÍDICO PUEBLOS - BANCO DE DATOS', '', '', '', '', '', '', '', 'Bucaramanga', 170, 'Nivel 1. Responsable: Yebrail. ', '2015-05-21', NULL, '2015-05-22 02:42:09.48448', '2018-05-23 17:56:54.617881', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (106, 'MESA DE ORGANIZACIONES DE MUJERES DE SOACHA - BANCO DE DATOS', 'Clemencia', 'Directora', '', '', '', '', '', 'Soacha', 170, 'Nivel 1. Responsable: Angela', '2015-05-21', NULL, '2015-05-22 02:44:12.537794', '2018-05-23 17:57:17.232758', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (107, 'BANCO DE DATOS DE RIOSUCIO', '', '', '', '', '', '', '', '', NULL, 'Nivel 2. Responsable: Yebrail. ASCOBA Y CRPC', '2015-05-21', NULL, '2015-05-22 02:45:36.428287', '2018-05-23 17:52:30.405163', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (108, 'COCOCAUCA - BANCO DE DATOS GUAPI', '', '', '', '', '', '', '', 'Guapi', 170, 'Nivel 3. Responsable: Yebrail', '2015-05-21', NULL, '2015-05-22 02:46:50.363918', '2018-05-23 17:55:21.295566', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (109, 'BANCO DE DATOS DEL SURORIENTE COLOMBIANO', 'Cristina', '', '', '', '', '', '', 'Villavicencio', 170, 'Nivel 3. Responsable: William. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:47:54.635613', '2018-05-23 17:53:53.512174', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (110, 'DIÓCECIS DE QUIBDÓ - BANCO DE DATOS', '', '', '', '', '', '', '', '', NULL, 'Nivel 3. Responsable: Yebrail', '2015-05-21', NULL, '2015-05-22 02:48:30.46108', '2018-05-23 17:55:39.176165', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (111, 'OBSERVATORIO DE PAZ INTEGRAL - OPI - BANCO DE DATOS', '', '', '', '', '', '', '', 'Barrancabermeja', 170, 'Nivel 3. Responsable: Yebrail. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:49:25.335373', '2018-05-23 17:57:59.783761', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (112, 'DIÓCESIS DE TUMACO - BANCO DE DATOS', '', '', '', '', '', '', '', 'Tumaco', 170, 'Nivel 3. Responsable: Yebrail. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:50:51.544947', '2018-05-23 17:56:15.289256', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (113, 'COLECTVIO TIERRA DE TODOS', '', '', '', '', '', '', '', 'Bogotá', 170, 'Nivel 3. Responsable: Carlos. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:51:23.55079', '2015-07-06 17:16:53.366817', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (114, 'BANCO DE DATOS DEL VALLE', 'Cristian Llanos', 'Investigador ', 'Cllanos@cinep.org.co, cristianbandatosvalle@nocheyniebla.org', '', '', '', '', 'Cali', 170, 'Nivel 3. Tiene base. NO APARECE LA REGIÓN', '2015-05-21', NULL, '2015-05-22 02:52:01.219649', '2018-05-23 17:54:39.455994', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (115, 'TERRITORIOS POR VIDA DIGNA - BANCO DE DATOS', 'Fabiana Carvajal', '', '', '', '', '', '', 'Popayan', 170, 'Nivel 3. Responsable: Christian. Tiene base. NO HAY REGIÓN ASIGNADA', '2015-05-21', NULL, '2015-05-22 02:52:49.695242', '2018-05-23 18:00:44.281644', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (116, 'OBSERVATORIO SURCOLOMBIANO DE VIOLENCIA POLÍTICA Y DERECHOS HUMANOS - OBSURDH - BANCO DE DATOS', 'Rosita', 'Directora', '', '', '', '3002428654', 'Cr 13 #3-62 Piso 2', 'Neiva', 170, 'Nivel 3. Responsable: Yebrail. Tiene base. NO HAY REGIÓN', '2015-05-21', NULL, '2015-05-22 02:53:33.06302', '2018-05-23 17:59:33.134107', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (117, 'BANCO DE DATOS BOYACÁ', '', '', '', '', '', '', '', '', NULL, 'Nivel 3. Responsable: Angela. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:54:11.140198', '2018-05-23 17:50:57.376981', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (118, 'BANCO DE DATOS DEL NORTE DE SANTANDER SJR', '', '', '', '', '', '', '', 'Cúcuta', 170, 'Nivel 3. Responsable: Carlos. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:55:00.020101', '2018-05-23 17:53:23.458627', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (119, 'BANCO DE DATOS COSTA CARIBE', 'Jerry Garavito', '', '', '', '', '', '', 'Barranquilla', 170, 'Nivel 3. Responsable: Jerry.', '2015-05-21', NULL, '2015-05-22 02:55:48.656073', '2018-05-23 17:51:26.865342', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (120, 'OBSERVATORIO DEL EJE CAFETERO - BANCO DE DATOS', 'Carlos', '', '', '', '', '', '', 'Armenia', 170, 'Nivel 3. Responsable: Christian. Tiene base. NO APARECE LA REGIÓN', '2015-05-21', NULL, '2015-05-22 02:57:02.952872', '2018-05-23 17:58:53.251202', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (121, 'AECID', '', '', '', '', '', '', '', '', NULL, '', '2015-04-27', NULL, '2015-06-13 01:29:37.286017', '2018-05-03 19:28:48.670905', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (122, 'AMNISTIA INTERNACIONAL', '', '', '', '', '', '', '', '', NULL, '', '2015-04-27', NULL, '2015-06-13 01:30:15.588115', '2015-07-06 16:53:02.626606', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (123, 'COLCIENCIAS', '', '', '', '', '', '', '', '', 170, '', '2015-04-27', NULL, '2015-06-13 01:30:39.565354', '2015-06-13 01:30:56.739134', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (124, 'DIAKONIA SUECIA', '', '', '', '', '', '', '', '', 752, '', '2015-04-27', NULL, '2015-06-13 01:31:27.308013', '2015-07-06 17:04:25.317908', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (125, 'MISEREOR', '', '', '', '', '', '', '', '', 276, '', '2015-04-27', NULL, '2015-06-13 01:32:03.364246', '2015-07-06 17:06:48.473933', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (126, 'UTL SENADOR IVAN CÉPEDA', 'IVAN CEPEDA', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 14:57:56.516594', '2015-07-06 17:11:17.771722', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (127, 'UTL REPRESENTANTE ALIRIO URIBE', 'ALIRIO URIBE', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 14:58:18.354831', '2015-07-06 17:11:03.432317', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (128, 'CORPORACIÓN CLARETIANA NORMAN PEREZ BELLO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 14:58:47.497459', '2015-07-06 17:02:49.194686', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (129, 'CORPORACIÓN COLECTIVO ORLANDO FALS BORDA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 14:59:29.07717', '2015-07-06 17:03:03.75505', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (130, 'CONSEJERÍA DE PROYECTOS PCS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 14:59:54.64912', '2015-07-06 17:02:24.653984', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (131, 'COMISIÓN INTERECLESIAL DE JUSTICIA Y PAZ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 15:00:13.177712', '2015-07-06 17:02:11.234219', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (132, 'CORPORACIÓN AVRE', '', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 15:08:08.774401', '2015-07-06 15:08:08.774401', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (134, 'EMBAJADA DE SUECIA EN BARRANQUILLA', '', '', '', '', '', '', '', 'BARRANQUILLA', 170, '', '2015-07-06', NULL, '2015-07-06 15:54:28.582626', '2015-07-06 17:06:08.591612', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (135, 'BANCO DE DATOS PEREIRA', '', '', '', '', '', '', '', '', NULL, 'NO APARECE LA REGIÓN', '2015-07-06', NULL, '2015-07-06 17:12:00.713287', '2018-05-23 17:55:00.288477', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (136, 'CORPORACIÓN JUSTICIA Y DIGNIDAD', 'ALEXANDER MONTAÑA', '', '', '', '', '', '', 'CALI', 170, '', '2015-07-06', NULL, '2015-07-06 18:34:17.307016', '2015-07-06 18:34:17.307016', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (137, 'FCSPP', '', '', '', '', '', '', '', 'CALI', 170, '', '2015-07-06', NULL, '2015-07-06 18:41:27.202159', '2015-07-06 18:41:27.202159', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (138, 'UNIVERSIDAD AUTONOMA DE COLOMBIA', 'ANA CAROLINA GUATAME', 'PROFESORA', '', '', '', '', '', '', NULL, '', '2015-07-08', NULL, '2015-07-08 14:26:19.229236', '2015-07-08 14:26:19.229236', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (139, 'CORTE PENAL INTERNACIONAL ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 15:15:52.96283', '2015-07-09 15:15:52.96283', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (140, 'MESA SOBRE EJECUCIONES EXTRAJUDICIALES DEL OBSERVATORIO DE DDHH DE LA COORDINACIÓN COLOMBIA, EUROPA, ESTADOS UNIDOS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 15:19:30.130512', '2015-07-09 15:19:30.130512', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (141, 'MOVICE', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 15:26:31.261031', '2015-07-09 15:26:31.261031', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (142, 'MOVIMIENTO POPULAR DE FACATATIVA ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 15:39:07.548559', '2015-07-09 15:39:07.548559', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (143, 'GRUPO DE FAMILIARES DE VÍCTIMAS DE CRÍMENES DE ESTADO DE BOYACÁ ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 15:54:16.323715', '2015-07-09 15:54:16.323715', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (144, 'UNIVERSIDAD DISTRITAL FRANCISCO JOSE DE CALDAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 16:17:02.569926', '2015-07-09 16:17:02.569926', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (145, 'COLEGIO TRINIDAD DEL MONTE ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 16:34:52.510101', '2015-07-09 16:34:52.510101', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (146, 'FRESNO PACIFIC UNIVERSITY', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 16:44:31.599855', '2015-07-09 16:44:31.599855', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (147, 'JUSTAPAZ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 16:46:01.599056', '2015-07-09 16:48:08.889441', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (148, 'CENTRO DE ATENCION PSICOSOCIAL ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 16:52:17.410575', '2015-07-09 16:52:17.410575', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (149, 'EMBAJADA SUIZA BOGOTÁ ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:18:33.64137', '2015-07-09 17:18:33.64137', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (150, 'CENTRO DE RECURSOS PARA EL ANÁLISIS DE CONFLICTOS - CERAC', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:20:22.260154', '2018-02-06 04:15:16.085502', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (151, 'FRENTE AMPLIO POR LA PAZ ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:21:12.289797', '2015-07-09 17:21:12.289797', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (152, 'PASTORAL SOCIAL ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:23:12.920832', '2015-07-09 17:23:12.920832', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (153, 'INTERMON OXFAM ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:29:49.706518', '2015-07-09 17:29:49.706518', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (154, 'AFAVIT', '', '', '', '', '', '', '', '', NULL, 'NO APARECE REGIÓN', '2015-07-09', NULL, '2015-07-09 17:32:40.334859', '2018-05-23 18:12:20.537784', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (155, 'RESGUARDO TOCANCIPA ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:46:10.622393', '2015-07-09 17:46:10.622393', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (156, 'ASOLIBERTAD ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:58:03.504746', '2015-07-09 17:58:03.504746', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (157, 'PROGRAMA SOMOS DEFENSORES', 'CARLOS GUEVARA', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 22:12:27.449788', '2015-07-09 22:12:27.449788', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (158, 'COMITÉ POR LA DEFENSA DE LA VIDA Y EL PÁRAMO DE SANTURBÁN', 'JORGE CASTELLANOS', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 22:16:00.076406', '2015-07-09 22:16:00.076406', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (159, 'CENTRO AGUSTIN PRO (JESUITAS DE MEXICO)', 'JORGE ATILANO', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 19:47:00.466071', '2015-07-10 19:47:00.466071', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (160, 'FUNDACIÓN PROGRESAR', 'WILFREDO CAÑIZARES', 'DIRECTOR', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 20:51:16.864992', '2015-07-10 20:51:16.864992', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (161, 'PROCURA-NORTE', 'CARLOS BOLIVAR', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 20:52:28.156909', '2015-07-10 20:52:28.156909', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (162, 'OBSERVATORIO DE DH DEL CENTRO NACIONAL DE MEMORIA HISTORICA', 'CAROLINA ROJAS', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:08:30.29087', '2015-07-10 21:08:30.29087', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (163, 'COLOMBIA DIVERSA', 'MAURICIO ALBARRACIN', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:27:24.008959', '2015-07-10 21:27:24.008959', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (164, 'FONDO DE FORTALECIMIENTO Y PROTECCIÓN', 'PABLO CASTILLO', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:28:31.512074', '2015-07-10 21:28:31.512074', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (165, 'CENTRO DE ESTUDIOS PARA LA JUSTICIA SOCIAL TIERRA DIGNA', 'XIMENA GONZALEZ', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:32:01.065243', '2015-07-10 21:32:01.065243', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (166, 'RUTA PACIFICA DE LAS MUJERES', 'MARINA GALLEGO', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:33:11.536571', '2015-07-10 21:33:11.536571', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (167, 'FIAN HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:44:46.84387', '2015-07-10 21:44:46.84387', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (168, 'ANAFAE-HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:45:30.076446', '2015-07-10 21:45:30.076446', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (169, 'CENPRODEC-HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:45:58.592716', '2015-07-10 21:45:58.592716', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (170, 'COPINH-HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:46:26.190066', '2015-07-10 21:46:26.190066', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (171, 'COMITE AMBIENTALISTA DEL VALLE DEL SIRIA-HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:47:24.598179', '2015-07-10 21:47:24.598179', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (172, 'ERIC-HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:48:05.449235', '2015-07-10 21:48:05.449235', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (173, 'MOVIMIENTO AMPLIO POR LA DIGNIDAD Y LA JUSTICIA-HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:48:38.083716', '2015-07-10 21:48:38.083716', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (174, 'FUNDACIÓN SAN ALONSO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:49:07.070605', '2015-07-10 21:49:07.070605', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (175, 'COFAMIPRO-HONDURAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:49:46.065187', '2015-07-10 21:49:46.065187', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (176, 'FORO DE MUJERES POR LA VIDA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:50:10.514185', '2015-07-10 21:50:10.514185', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (177, 'FUNAPIB', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:50:41.63898', '2015-07-10 21:50:41.63898', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (178, 'ORGANIZACION DE DH QUINUA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 21:57:03.895166', '2015-07-10 21:57:03.895166', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (179, 'CORPORACION RETOÑOS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 22:11:17.060114', '2015-07-10 22:11:17.060114', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (180, 'PASTORAL SOCIAL DEL META', '', '', '', '', '', '', '', 'VILLAVICENCIO', 170, '', '2015-07-10', NULL, '2015-07-10 22:11:40.534589', '2017-10-31 19:47:59.288415', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (181, 'COORDINACIÓN REGIONAL DEL PACÍFICO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 23:31:24.993325', '2015-07-10 23:31:24.993325', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (182, 'FUNDACIÓN PAZ Y RECONCILIACIÓN', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 23:36:44.240794', '2015-07-10 23:36:44.240794', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (183, 'EMBAJADA DE SUIZA EN COLOMBIA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-12', NULL, '2015-07-12 15:22:32.265815', '2015-07-12 15:22:32.265815', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (184, 'COMUNIDAD DE PAZ DE SAN JOSÉ DE APARTADO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-12', NULL, '2015-07-12 16:10:39.063736', '2015-07-12 16:10:39.063736', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (185, 'AMOVI - ARCHIVO DE MEMORIA ORAL DE VÍCTIMAS', 'IVONNE SUÁREZ', '', '', '', '', '', '', '', NULL, '', '2015-07-12', NULL, '2015-07-12 16:12:53.317524', '2015-07-12 16:12:53.317524', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (186, 'MINISTERIO MENONITA EN SAN NICOLAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-12', NULL, '2015-07-12 16:27:09.360101', '2015-07-12 16:27:09.360101', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (187, 'CPDH NARIÑO', 'JAVIER DORADO', '', '', '', '', '', '', '', NULL, '', '2015-07-12', NULL, '2015-07-12 16:38:30.929106', '2015-07-12 16:38:30.929106', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (189, 'FUNDACIÓN TEJIENDO PAZ PUTUMAYO', '', '', '', '', '', '', '', 'MOCOA', 170, '', '2015-07-13', NULL, '2015-07-13 13:58:05.377772', '2015-07-13 13:58:34.114455', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (190, 'CASA CULTURAL TEJIENDO SORORIDADES', '', '', '', '', '', '', '', 'CALI', 170, '', '2015-07-13', NULL, '2015-07-13 14:32:33.240931', '2015-07-13 14:32:33.240931', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (191, 'OBSERVATORIO DE REALIDADES SOCIALES DE LA ARQUIDIÓCESIS DE CALI', '', '', '', '', '', '', '', 'CALI', 170, '', '2015-07-13', NULL, '2015-07-13 14:59:04.371982', '2015-07-13 14:59:04.371982', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (192, 'MINISTERIO INTERIOR', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:04:10.372526', '2017-06-08 12:35:58.716375', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (193, 'ASOCIACIÓN ECATE', 'LUA MARINA PALACIOS', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:05:04.539664', '2017-12-06 15:10:21.623841', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (194, 'CPDH VALLE DEL CAUCA', 'MILENA OLAVE', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:06:18.915788', '2017-12-06 15:10:46.491202', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (195, 'OFICINA DE GESTIÓN DE PAZ DE LA GOBERNACIÓN DEL VALLE DEL CAUCA', 'FRANGEY RENDÓN', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:10:38.409748', '2017-12-06 15:11:15.750308', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (196, 'ASOCIACIÓN PARA LA INVESTIGACIÓN Y ACCIÓN SOCIAL NOMADESC', 'BERENICE CELEITA', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:19:08.992302', '2017-12-06 15:11:48.977943', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (197, 'MOVIMIENTO DE VÍCTIMAS DE CRÍMENES DE ESTADO CAPITULO VALLE DEL CAUCA', 'MARTHA GIRALDO ', '', '', '', '', '', '', 'CALI', 170, '', '2015-07-13', NULL, '2015-07-13 15:19:37.692932', '2015-07-14 03:23:18.97383', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (198, 'ESCUELA DE TRABAJO SOCIAL UNIVERSIDAD DEL VALLE DEL CAUCA', 'ALBA NUBIA RODRÍGUEZ', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:20:49.778506', '2017-12-06 15:14:45.3637', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (199, 'DEPARTAMENTO DE HISTORIA UNIVERSIDAD DEL VALLE', 'GERMAN FEIJO; NANCY MOTTA G. ', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:21:28.806579', '2017-12-06 15:15:10.090109', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (200, 'INSTITUTO DE ESTUDIOS INTERCULTURALES PONTIFICIA UNIVERSIDAD JAVERIANA CALI', 'Manuel  Ramiro Muñoz', 'Director', 'mrmunoz@javeriancali.edu.co', '3218200 Extensio 8888', '', '', 'Calle 18 # 118 250 Vía Pance Pontificia Universidad Javeriana-Cali', 'Cali', 170, '', '2015-07-13', NULL, '2015-07-13 15:22:44.019566', '2017-10-27 15:36:22.516548', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (202, 'ALCALDIA MUNICIPAL DE SAN JOSÉ DEL GUAVIARE', 'ANDREA RODRIGUEZ', 'GESTORA SOCIAL DE LA ALCALDIA', '', '', '', '', '', '', NULL, 'FALTA REGIÓN', '2015-07-13', NULL, '2015-07-13 19:06:19.686297', '2018-05-23 18:14:46.863198', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (203, 'RED ALAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 20:57:24.520643', '2015-07-13 20:57:24.520643', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (204, 'PRENSA - VERDAD ABIERTA', 'MARIA VICTORIA CALLE', '', '', '', '', '', '', '', 170, '', '2015-07-13', NULL, '2015-07-13 22:00:17.618967', '2015-07-13 22:00:17.618967', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (205, 'PRENSA - EL TIEMPO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:00:37.393429', '2015-07-13 22:00:37.393429', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (206, 'PRENSA - EL ESPECTADOR', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:00:53.770609', '2015-07-13 22:00:53.770609', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (207, 'PRENSA - SEMANA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:01:07.711589', '2015-07-13 22:01:07.711589', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (208, 'PRENSA - AGENCIA EFE', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:01:26.953234', '2015-07-13 22:01:26.953234', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (209, 'PRENSA -AGENCIA AP', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:01:43.860833', '2015-07-13 22:01:43.860833', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (210, 'PRENSA - LAS 2 ORILLAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:02:01.991496', '2015-07-13 22:02:01.991496', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (211, 'PRENSA - RCN RADIO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:05:10.481492', '2015-07-13 22:05:10.481492', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (212, 'PRENSA - CARACOL RADIO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:05:26.134433', '2015-07-13 22:05:26.134433', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (213, 'PRENSA - W RADIO COLOMBIA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:05:44.990213', '2015-07-13 22:05:44.990213', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (214, 'PRENSA - BLURADIO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:06:20.886054', '2015-07-13 22:06:20.886054', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (215, 'PRENSA - BBC', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:06:46.975139', '2015-07-13 22:06:46.975139', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (216, 'PRENSA - TELESUR', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:07:21.123124', '2015-07-13 22:07:21.123124', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (217, 'PRENSA - IPS NEWS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:07:48.45032', '2015-07-13 22:07:48.45032', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (218, 'COMITÉ DE LA MEMORIA DE EL CASTILLO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 22:47:44.984562', '2015-07-13 22:47:44.984562', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (219, 'FAMILIARES DE DESAPARECIDOS Y DETENIDOS POR RAZONES POLÍTICAS ', 'GRACIELA LOIS', '', '', '', '', '', '', '', 32, '', '2015-07-13', NULL, '2015-07-14 02:59:49.45359', '2015-07-14 03:00:10.130362', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (220, 'UNIVERSIDAD DE BUENOS AIRES', 'CRISTINA CALVO', 'PROFESORA DE POSGRADO ', '', '', '', '', '', '', 32, '', '2015-07-13', NULL, '2015-07-14 03:01:28.13319', '2015-07-14 03:24:57.205003', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (221, 'ASOCIACIÓN CIVIL POR LA IGUALDAD Y LA JUSTICIA LA OTRA TRAMA ', 'FERNANDO BRACACCINI', '', '', '', '', '', '', '', 32, '', '2015-07-13', NULL, '2015-07-14 03:02:47.794073', '2015-07-14 03:02:47.794073', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (222, 'FORO DE PERIODISMO ARGENTINO LA OTRA TRAMA', 'GABRIEL MICHI', '', '', '', '', '', '', '', 32, '', '2015-07-13', NULL, '2015-07-14 03:03:48.665021', '2015-07-14 03:03:48.665021', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (223, 'FUNDACIÓN ALAMEDA / RED NACIONAL ANTI MAFIA ', 'LUCAS MANJON', '', '', '', '', '', '', '', 32, '', '2015-07-13', NULL, '2015-07-14 03:04:46.3808', '2015-07-14 03:04:46.3808', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (224, 'MOVIMIENTO DE VÍCTIMAS DE CRÍMENES DE ESTADO CAPITULO CALDAS', 'MARIA CARDONA', '', '', '', '', '', '', 'MANIZALES ', 170, '', '2015-07-13', NULL, '2015-07-14 03:05:48.65429', '2015-07-14 03:05:48.65429', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (225, 'COLECTIVO DE ABOGADO "JOSE ALVEAR RESTREPO"', 'MARIA DEL PILAR SILVA GARAY ', '', '', '', '', '', '', 'BOGOTA D.C.', 170, '', '2015-07-13', NULL, '2015-07-14 03:06:54.457423', '2015-07-14 03:06:54.457423', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (226, 'CASA B', 'DARIO SENDOYA ', '', '', '', '', '', '', 'BOGOTA D.C.', 170, '', '2015-07-13', NULL, '2015-07-14 03:07:41.44335', '2015-07-14 03:07:41.44335', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (227, 'COLOMBIA SIN HERIDAS', 'LAURA GIL ', '', '', '', '', '', '', 'BOGOTA D.C.', 170, '', '2015-07-13', NULL, '2015-07-14 03:08:25.555528', '2015-07-14 03:08:25.555528', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (228, 'PROGRAMA DE DESARROLLO PAZ DEL MAGDALENA MEDIO PDPMM', 'UBENCEL DUMAS', '', '', '', '', '', '', '', 170, '', '2015-07-13', NULL, '2015-07-14 03:09:23.780077', '2018-03-05 20:54:32.00412', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (229, 'ONG KIMIRINA', 'AMIRA HERDOIZA - BOLIVAR ANTONIO MARTINEZ', '', '', '', '', '', '', '', 218, '', '2015-07-13', NULL, '2015-07-14 03:10:33.469229', '2015-07-14 03:10:33.469229', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (230, 'ONG SEDEM', 'IDUVINA HERNANDEZ', '', '', '', '', '', '', '', 320, '', '2015-07-13', NULL, '2015-07-14 03:11:42.574559', '2015-07-14 03:11:42.574559', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (231, 'OFICINA DE DERECHOS HUMANOS DE CIUDAD DE GUATEMALA ', 'NERI RODENAS ', '', '', '', '', '', '', '', 320, '', '2015-07-13', NULL, '2015-07-14 03:14:45.592338', '2015-07-14 03:14:45.592338', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (232, 'MOVIMIENTO SALVADOREÑO DE MUJERES ', 'ISABEL LOPEZ', '', '', '', '', '', '', '', 222, '', '2015-07-13', NULL, '2015-07-14 03:16:16.490339', '2015-07-14 03:16:16.490339', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (233, 'INSTITUTO CONCECAO MACEDO ', 'PADRE ALFREDO DOREA', '', '', '', '', '', '', '', 76, '', '2015-07-13', NULL, '2015-07-14 03:17:21.300492', '2015-07-14 03:17:21.300492', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (234, 'MOVIMIENTO SIN TIERRA ', 'SALETE CAROLLO', '', '', '', '', '', '', '', 76, '', '2015-07-13', NULL, '2015-07-14 03:18:17.370949', '2015-07-14 03:18:17.370949', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (235, 'UNIVERSIDAD DE RIO DE JANEIRO ', 'DARIO SOUSSA SILVA', 'PROFESOR DE POSGRADO SOCIOLOGIA ', '', '', '', '', '', '', 76, '', '2015-07-13', NULL, '2015-07-14 03:19:20.418642', '2015-07-14 03:19:20.418642', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (236, 'COMISSAO PASTORAL DA TERRA', 'JOAO ANTONIO MOREIRA FRANÇA', '', '', '', '', '', '', '', 76, '', '2015-07-14', NULL, '2015-07-14 15:41:46.551242', '2015-07-14 15:41:46.551242', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (237, 'APEA', 'MAYA KOSHY', '', '', '', '', '', '', '', 68, '', '2015-07-14', NULL, '2015-07-14 15:42:20.871379', '2015-07-14 15:42:20.871379', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (238, 'FUNDACION MUNASIM KULLAKIT ', 'JOSE LUIS ZARATE ZARRAGA', '', '', '', '', '', '', '', 68, '', '2015-07-14', NULL, '2015-07-14 15:43:11.340769', '2015-07-14 15:43:11.340769', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (239, 'COORDINADORA NACIONAL DE ORGANIZACIONES AFECTADOS POR LA VIOLENCIA POLÍTICA ', 'LUIS ARONES HUALLANCA ', '', '', '', '', '', '', '', 604, '', '2015-07-14', NULL, '2015-07-14 15:44:24.280428', '2015-07-14 15:44:24.280428', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (240, 'CENTRO DE INVESTIGACIÓN DROGAS Y DERECHOS HUMANOS', 'JUAN MANUEL TORRES ', '', '', '', '', '', '', '', 604, '', '2015-07-14', NULL, '2015-07-14 15:45:08.700177', '2015-07-14 15:45:08.700177', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (241, 'ESPACIO LIBRE INDEPENDIENTE MARABUNTA A.C.', 'CARLA RIIOS', '', '', '', '', '', '', '', 484, '', '2015-07-14', NULL, '2015-07-14 15:46:30.745172', '2015-07-14 15:46:30.745172', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (242, 'BARRIO ACTIVO ', 'EDGAR MÉNDEZ ', '', '', '', '', '', '', '', 484, '', '2015-07-14', NULL, '2015-07-14 15:47:39.346585', '2015-07-14 15:47:39.346585', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (243, 'FUERZAS UNIDAS POR NUESTROS DESAPARECIDO EN MÉXICO FUNDEM', 'VICTOR ROLON ', '', '', '', '', '', '', '', 484, '', '2015-07-14', NULL, '2015-07-14 15:48:53.236485', '2015-07-14 15:48:53.236485', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (244, 'FUERZAS UNIDAS POR NUESTROS DESAPARECIDO EN MÉXICO FUNDEM', 'MARIA ANTONIA MELO ', '', '', '', '', '', '', '', 484, '', '2015-07-14', NULL, '2015-07-14 15:50:00.203283', '2015-07-14 15:50:00.203283', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (245, 'UNIVERSIDAD DE COLUMBIA ', 'EDGARDO BUSCAGLIA ', '', '', '', '', '', '', '', 484, '', '2015-07-14', NULL, '2015-07-14 15:51:05.325116', '2015-07-14 15:51:05.325116', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (246, 'COORDINADORA CIVIL ', 'LUISA MOLINA ', '', '', '', '', '', '', '', 558, '', '2015-07-14', NULL, '2015-07-14 15:52:12.462334', '2015-07-14 15:52:12.462334', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (247, 'AVINA', 'PABLO VAGLIENTE; VALERIA SCORZA ', '', '', '', '', '', '', '', 32, '', '2015-07-14', NULL, '2015-07-14 15:53:41.11152', '2015-07-14 15:53:41.11152', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (248, 'CORTE PENAL LATINOAMERICA ', 'FERNANDO IGLESIAS ', '', '', '', '', '', '', '', 32, '', '2015-07-14', NULL, '2015-07-14 15:54:38.107246', '2015-07-14 15:54:38.107246', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (249, 'LIBERA', 'GIULIA BARUZZO; MONICA USAI; LUIGI PELLEGRINO; STEFANO FUMARULO', '', '', '', '', '', '', '', 380, '', '2015-07-14', NULL, '2015-07-14 15:56:02.550822', '2017-12-06 15:16:28.410977', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (250, 'UNIVERSIDAD MILAN', 'THOMAS AURELIANI', '', '', '', '', '', '', '', 380, '', '2015-07-14', NULL, '2015-07-14 15:57:09.182675', '2015-07-14 15:57:09.182675', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (251, 'CAUCE CIUDADANO', 'CARLOS CRUZ; ERIKA LLANOS; AVELINA FONSECA; LAURA GARCÍA', '', '', '', '', '', '', '', 484, '', '2015-07-14', NULL, '2015-07-14 15:58:42.671137', '2015-07-14 15:58:42.671137', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (252, 'CORTE SUPREMA DE JUSTICIA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-14', NULL, '2015-07-14 20:10:16.945869', '2015-07-14 20:10:16.945869', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (253, 'FISCALÍA GENERAL DE LA NACIÓN', '', '', '', '', '', '', '', '', NULL, '', '2015-07-14', NULL, '2015-07-14 20:10:47.224465', '2015-07-14 20:10:47.224465', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (254, 'TRIBUNAL SUPERIOR DE BOGOTÁ, SALA DE JUSTICIA Y PAZ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-14', NULL, '2015-07-14 20:11:34.565226', '2015-07-14 20:11:34.565226', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (255, 'POLICÍA NACIONAL', '', '', '', '', '', '', '', '', NULL, '', '2015-07-14', NULL, '2015-07-14 20:24:13.285859', '2015-07-14 20:24:13.285859', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (256, 'GOBERNACIÓN DEL ATLÁNTICO', '', '', '', '', '', '', '', '', NULL, '', '2015-07-14', NULL, '2015-07-14 20:24:29.979003', '2015-07-14 20:24:29.979003', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (257, 'ASOCIACIÓN POR UNA SOCIEDAD MAS JUSTA ', 'OMAR EDGARDO RIVERA PACHECO', '', '', '', '', '', '', '', 340, '', '2015-07-15', NULL, '2015-07-15 14:20:53.734654', '2015-07-15 14:20:53.734654', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (258, 'ALCALDÍA MAYOR DE BOGOTÁ D.C.', 'ANA TERESA BERNAL', 'ALTA CONSEJERÍA PARA VICTIMAS', '', '', '', '', '', '', NULL, '', '2015-07-21', NULL, '2015-07-21 20:09:07.370736', '2015-07-21 20:09:07.370736', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (259, 'INSTITUTO COLOMBIANO DE MEDICINA LEGAL Y CIENCIAS FORENSES', 'CARLOS VALDÉS', '', '', '', '', '', '', '', NULL, '', '2015-07-21', NULL, '2015-07-21 20:10:05.958062', '2015-07-21 20:10:05.958062', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (260, 'VIDAS SILENCIADAS', 'DOMINIQUE, NICO CASSANO', '', '', '', '', '', '', '', NULL, '', '2015-07-28', NULL, '2015-07-29 00:02:26.388183', '2017-12-07 14:53:32.180387', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (261, 'SEMINARIO ARQUIDIOCESANO SAN JOSE ', '', 'RECTOR', '', '', '', '', '', 'BOGOTA', 170, '', '2015-08-19', NULL, '2015-08-19 14:56:05.968268', '2015-08-19 14:56:05.968268', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (262, 'FUNDACIÓN VISIÓN Y GESTIÓN DE LA PLATAFORMA DE DDHH DE CALDAS', 'CAROLINA LÓPEZ GIRALDO', '', 'ddhhcaldas@gmail.com', '317 438 5035', '', '', 'Carrera 23 Nº 32 22', 'Manizales', 170, 'Posible Banco Regional contactado por Christian. PENDIENTE POR FIRMAR CONVENIO ', '2015-09-11', NULL, '2015-09-11 18:17:50.27034', '2018-05-24 11:27:46.74548', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (263, 'UNIVERSIDAD INDUSTRIAL DE SANTANDER', 'IVONNE SUÁREZ', 'PROFESORA', '', '', '', '', '', '', NULL, '', '2015-09-13', NULL, '2015-09-13 08:12:56.146556', '2015-09-13 08:12:56.146556', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (264, 'CENTRO NACIONAL DE MEMORIA HISTÓRICA', '', '', '', '', '', '', '', '', NULL, '', '2015-09-13', NULL, '2015-09-13 08:27:27.702346', '2015-09-13 08:27:27.702346', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (265, 'MUSEO DE MEMORIA Y DERECHOS HUMANOS, CHILE', '', '', '', '', '', '', '', '', 152, '', '2015-09-13', NULL, '2015-09-13 08:29:18.950396', '2015-09-13 08:29:18.950396', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (266, 'ARCHIVO PROVINCIAL DE LA MEMORIA DE CÓRDOBA, ARGENTINA', '', '', '', '', '', '', '', '', 32, '', '2015-09-13', NULL, '2015-09-13 08:31:06.543586', '2015-09-13 08:31:06.543586', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (267, 'ARCHIVO GENERAL DE CENTRO AMÉRICA, GUATEMALA', '', '', '', '', '', '', '', '', 320, '', '2015-09-13', NULL, '2015-09-13 08:32:32.116529', '2015-09-13 08:32:32.116529', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (268, 'MEMORIA ABIERTA, ARGENTINA', 'Alejandra Oberti', 'Directora', '', '', '', '', '', '', 32, '', '2015-09-13', NULL, '2015-09-13 08:34:39.598807', '2015-09-13 08:35:02.56923', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (269, 'MOVIMIENTO CAMPESINO DE CAJIBÍO', 'MARILEN SERNA ', 'MIEMBRO DE LA JUNTA DIRECTIVA', 'cajibio@gmail.com', '3128908790', '', '3128908790', '', 'POPAYÁN', 170, '', '2015-11-12', NULL, '2015-11-13 15:33:24.692938', '2015-11-13 15:33:24.692938', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (270, 'FUNDACIÓN TERRITORIOS POR VIDA DIGNA', 'Fabiana Carvajal ', 'Investigadora y responsable del Banco de Datos del Cauca', 'bdcauca@nocheyniebla.org', '315 5853862 ', '', '320 5289616', '', 'POPAYÁN', 170, '', '2015-11-24', NULL, '2015-11-24 16:14:52.918678', '2015-11-24 16:14:52.918678', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (271, 'COMITÉ PERMANENTE POR LA DEFENSA DE LOS DERECHOS HUMANOS DE CALDAS; MOVICE CALDAS', 'MARIA CARDONA MEJÍA ', '', 'caldas@movimientodevictimas.org', '3182101238', '', '3182101238', '', 'MANIZALES', 170, 'TAMBIÉN HACE PARTE DEL MOVICE CALDAS', '2015-11-24', NULL, '2015-11-24 21:02:58.154382', '2015-11-24 21:02:58.154382', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (272, 'ORGANIZACIÓN DE PENSIONADOS DE COLOMBIA OCP', 'JAVIER ARROYAVE, SERRGIO DÍAZ F. ', '', 'arroyavejavier@yahoo.com; serdif62@yahoo.es', '3215725168', '', '3164818462', '', 'MANIZALES', 170, '', '2015-11-24', NULL, '2015-11-24 21:06:05.240788', '2015-11-24 21:06:05.240788', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (273, 'SEMILLERO "PENSANDO LO PÚBLICO" DE LA ESCUELA SUPERIOR DE ADMINISTRACIÓN PÚBLICA ESAP', 'FERNANDO TORO SANCHEZ  ', '', 'fertoro60@yahoo.es', '3206988754', '', '3206988754', '', 'MANIZALES', 170, '', '2015-11-24', NULL, '2015-11-24 21:08:20.928167', '2015-11-24 21:08:20.928167', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (274, 'VEEDURIA MACROPROYECTO SAN JOSÉ', 'ERNESTO QUINTERO', '', 'veedores_ambientales@yahoo.es', '3218558146', '', '3218558146', '', 'MANIZALES', 170, '', '2015-11-24', NULL, '2015-11-24 21:10:58.840432', '2015-11-24 21:10:58.840432', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (275, 'SISTEMA DE ALERTAS TEMPRANAS DE LA DEFENSORIA DEL PUEBLO DE CALDAS', 'LUISA FERNANDA MONTES', 'ENCARGA DEL SAT ', 'Sat.caldas@gmail.com', '3214267143', '', '3214267143', '', 'MANIZALES', 170, '', '2015-11-24', NULL, '2015-11-24 21:15:02.230605', '2015-11-24 21:15:02.230605', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (276, 'COPA/HONDURAS', 'WALESKA LINAREZ', '', '', '96432399', '', '', '', 'TOCOA', 340, '', '2015-12-15', NULL, '2015-12-15 15:59:52.073306', '2015-12-15 15:59:52.073306', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (277, 'OBSERVATORIO DE DH DEL AGUAN', 'HERIBERTO ALEMAN', 'COORDINADOR', 'defensoralemanyahoo.es', '98506437', '', '', '', 'TOCOA', 340, '', '2015-12-15', NULL, '2015-12-15 16:03:02.648039', '2015-12-15 16:03:02.648039', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (278, 'CARITAS SAN PEDRO SULA/HONDURAS', 'MIRNA ORELLANA', '', 'mirnaore8hotmail.com', '25534591', '', '', '', 'SAN PEDRO SULA', 340, '', '2015-12-15', NULL, '2015-12-15 16:08:48.746574', '2015-12-15 16:08:48.746574', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (279, 'TROCAIRE-HONDURAS', 'HERVE BUND', 'COORDINADOR', 'HERVE_BUND@TROCAIRES.ORG', '', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:13:05.36148', '2015-12-15 16:13:05.36148', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (280, 'OXFAM-HONDURAS', 'CLAUDIO ESCOBAR', '', 'ESCOBAR@OXFAM.ORG.HN', '22392120', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:14:27.309744', '2015-12-15 16:14:27.309744', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (281, 'DCA-HONDURAS', 'MARCELO ABATE', 'COORDINADOR', '', '94897346', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:16:00.584151', '2015-12-15 16:16:00.584151', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (282, 'PBI-HONDURAS', 'MARIPAZ GALLARDO', '', 'APOYO@PBIHONDURAS.ORG', '', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:17:47.901388', '2015-12-15 16:17:47.901388', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (283, 'RED NACIONAL DE DEFENSORAS-HONDURAS', 'KATHERIN CRUZ', '', 'KPC2391@HOTMAIL.COM', '95240936', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:19:51.503276', '2015-12-15 16:19:51.503276', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (284, 'CIPRODEH-HONDURAS', 'ANNY MATAMOROS', '', 'ANNYMATAMOROSP8@GMAIL.COM', '98436712', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:21:25.272613', '2015-12-15 16:21:25.272613', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (285, 'C-LIBRE', 'ARNOLD GUIFARRO', '', 'ARNOLGUIFARRO@GMAIL.COM', '88099279', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:22:54.872961', '2015-12-15 16:22:54.872961', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (286, 'ADEPES-HONDURAS', 'MYNOR LENIN CARBAJAL', '', 'MYNORADEPES@GMAIL.COM', '32967470', '', '', '', 'TEGUCIGALPA', 340, 'NO APLICA REGIÓN', '2015-12-15', NULL, '2015-12-15 16:24:28.976097', '2018-05-23 18:03:39.789916', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (287, 'CPTRT-HONDURAS', 'JUAN ALMENDAREZ', 'COORDINADOR', '', '', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:27:36.10409', '2015-12-15 16:27:36.10409', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (288, 'CENTRO DE DERECHOS DE MUJERES,CDM-HONDURAS', 'HILDA RIVERA', 'COORDINADOR', '', '', '', '', '', 'TEGUCIGALPA', 340, '', '2015-12-15', NULL, '2015-12-15 16:28:42.61874', '2015-12-15 16:28:42.61874', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (289, 'ASOCIACION DE JUECES POR LA DEMOCRACIA-HONDURAS', '', '', '', '', '', '', '', 'SAN PEDRO SULA', 340, '', '2015-12-15', NULL, '2015-12-15 16:36:25.206181', '2015-12-15 16:36:25.206181', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (290, 'UNIVERSIDAD JAVERIANA BOGOTA', 'MARIA FERNANDA SANUDO', 'PROFESORA E INVESTIGADORA', '', '', '', '', '', '', NULL, '', '2016-03-08', NULL, '2016-03-08 14:54:14.008379', '2016-03-08 14:54:14.008379', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (291, 'COEUROPA', 'LOURDES CASTRO', 'SECRETARIA TÉCNICA', 'Lourdes Castro <lourdescastro@coeuropa.org.co>', '', '', '', '', '', NULL, '', '2016-03-09', NULL, '2016-03-09 21:20:03.907543', '2016-03-09 21:20:03.907543', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (292, 'DHCOLOMBIA - RED DE DEFENSORES DE DDHH DE COLOMBIA', 'GERMAN ROMERO', 'REPRESENTANTE LEGAL', '', '', '', '', '', '', NULL, '', '2016-03-09', NULL, '2016-03-09 22:55:18.829311', '2016-03-09 22:55:18.829311', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (293, 'UNIVERSIDAD IBEROAMERICANA PROGRAMAS DE INCIDENCIA', 'PABLO REYNA ESTEVES ', 'DIRECTOR DE PROGRAMAS DE INCIDENCIA ', 'pablo.reyna@ibero.mx', '59504000 ext 7582', '', '', 'Prolongación Paseo de la Reforma 880 Lomas de Santa Fe, 01219 ', 'México DF', 484, '', '2016-03-28', NULL, '2016-03-28 21:48:19.642593', '2016-03-28 21:48:19.642593', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (294, 'SERVICIO JESUITA A MIGRANTES', 'RITA ROBLES', '', '', '', '', '', '', '', 484, '', '2016-03-28', NULL, '2016-03-28 23:17:12.496868', '2016-03-28 23:17:12.496868', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (295, 'COMITÉ DE SOLIDARIDAD CON LOS PRESOS POLÍTICOS VALLE DEL CAUCA', 'WALTER AGREDO M.', 'COORDINADOR DE LA SECCIONAL ', 'FCSPPVALLE@GMAIL.COM', '3206898114', '', '', '', 'CALI', 170, '', '2016-04-04', NULL, '2016-04-04 22:33:50.205494', '2016-04-04 22:33:50.205494', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (296, 'DIOCESIS DE TUMACO', 'DORA VARGAS', 'DIRECTORA DE PASTORAL SOCIAL', 'pastoralsocialtumaco@yahoo.es', '3155531304', '', '3155531304', 'CALLE NUEVA CREACION CON CALLE POPAYAN', 'TUMACO', 170, '', '2016-04-05', NULL, '2016-04-05 14:36:13.717671', '2016-04-05 14:36:13.717671', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (297, 'BANCO DE DATOS DE QUINDÍO', 'CARLOS ANDRÉS QUINTANA ', 'ENCARGADO', 'BANDATOSQUINDIO@GMAIL.COM', '', '', '', '', '', NULL, '', '2016-04-08', NULL, '2016-04-08 23:07:44.922833', '2018-05-23 17:52:03.392295', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (299, 'PERSONERÍA DEL MUNICIPIO DE SAN PEDRO VALLE DEL CAUCA', 'EDGAR M. CALERO ', 'PERSONERO MUNICIPAL', '', '2238376 EXT 27', '', '', '', 'SAN PEDRO ', 170, '', '2016-07-19', NULL, '2016-07-19 15:45:55.41489', '2016-07-19 15:45:55.41489', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (300, 'UNIVERSIDAD JAVERIANA CALI', '', '', '', '', '', '', '', '', NULL, '', '2016-07-19', NULL, '2016-07-19 16:26:34.210831', '2016-07-19 16:26:34.210831', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (301, 'MESA DE DERECHOS HUMANOS DE RISARALDA', 'JAVIER VALENCIA Y LUISA FERNANDA ARENAS', '', 'jvalenciaorozco@gmail.com; mechitta@gmail.com', '', '', '3175124337', '', 'PEREIRA', 170, '', '2016-07-19', NULL, '2016-07-19 19:49:15.693878', '2016-07-19 19:49:15.693878', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (302, 'ORGANIZACIÓN REGIONAL INDÍGENA DEL VALLE DEL CAUCA, ORIVAC', 'RAFAEL ULCUE', 'CONSEJERO', 'rafaelulcue24@gmail.com', '2 3711173', '', '', '', 'CALI', 170, '', '2016-07-19', NULL, '2016-07-19 21:43:36.843967', '2016-07-19 21:43:36.843967', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (303, 'OBSERVACIóN Y SOLIDARIDAD CON ARAUCA - OBSAR', '', '', '', '', '', '', '', 'ARAUCA', 170, 'CONTACTO WILLIAM ROZO', '2016-08-04', NULL, '2016-08-05 00:25:17.953632', '2016-08-05 00:25:17.953632', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (304, 'CSOFB', '', '', '', '', '', '', '', '', 170, 'CONTACTO WILLIAM ROZO', '2016-08-04', NULL, '2016-08-05 00:25:48.411825', '2016-08-05 00:25:48.411825', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (306, 'PBI - COLOMBIA', '', '', '', '', '', '', '', '', 170, '', '2016-10-17', NULL, '2016-10-17 15:14:44.943551', '2016-10-17 15:14:44.943551', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (307, 'MESA HIDRICA DEL GUAVIARE', 'GIVANNI GOMEZ', '', '', '', '', '', '', 'SAN JOSÉ DEL GUAVIARE', 170, '', '2016-10-17', NULL, '2016-10-17 15:15:40.217215', '2016-10-17 15:15:40.217215', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (308, 'DHCOLOMBIA - ASOCIACIÓN RED DE DEFENSORES DE DERECHOS HUMANOS DE COLOMBIA', 'JORGE ELIÉCER MOLANO RODRIGUEZ', 'REPRESENTANTE LEGAL', 'jorge_molano@hotmail.com', '3106786091', '', '', 'Av Calle 19 No. 4-71 oficina 801', 'Bogota', 170, '', '2016-10-17', NULL, '2016-10-17 15:17:55.692868', '2016-10-17 15:17:55.692868', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (309, 'INSTITUTO PENSAR PUJ', 'FERNANDA SANUDO, Martha Márquez', 'INVESTIGADOR', '', '', '', '', '', 'BOGOTÁ', 170, '', '2016-12-12', NULL, '2016-12-13 00:57:12.833819', '2017-12-20 15:03:45.722463', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (310, 'CSIETE', 'GIOVANNI CRUZ', 'DIRECTOR', 'contacto@bsidesco.org', '', '', '', '', 'BOGOTÁ', 170, 'http://www.csiete.org/', '2016-12-13', NULL, '2016-12-13 15:58:35.758317', '2016-12-13 16:00:49.49045', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (311, 'SEGURATEC', '', '', '', '', '', '', '', '', 170, 'http://seguratec.com.co/', '2016-12-13', NULL, '2016-12-13 16:00:05.370549', '2016-12-13 16:00:05.370549', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (312, 'COPARTES MISEREOR', 'Viviana Pinzón Rodríguez', 'Secretaria Técnica', 'secretariatecnica@corporacionclaretiana.org', ' PBX (57-1) 2822260', '', '', ' Cra. 15 No. 10. 41 Piso 3', 'Bogotá – Colombia', 170, '', '2017-07-28', NULL, '2017-07-29 00:04:33.012967', '2017-07-29 00:04:46.058643', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (313, 'MESA SOBRE DESAPAFICIÓN FORZADA DEL GUAVIARE', 'CICR', 'JEFE MISIÓN MISSING', 'wrozo@cinep.org.co', '', '', '', '', '', 170, '', '2017-08-29', NULL, '2017-08-29 21:04:42.326014', '2017-08-29 21:04:42.326014', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (314, 'COMITÉ INTERNACIONAL DE LA CRUZ ROJA CICR', 'JOELLE KUHN', 'COORDINADORA ADJUNTA PROYECCION', 'jkuhn@icrc.org', '310 756 07 37', '', '', '', '', 170, '', '2017-08-30', NULL, '2017-08-30 18:26:40.153092', '2017-08-30 18:26:40.153092', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (315, 'SJR COLOMBIA', 'MAURICIO GARCÍA', 'DIRECTOR', '', '2456181', '', '', 'CR 5 # 33B-02', 'BOGOTÁ', 170, '', '2017-09-09', NULL, '2017-09-09 22:15:39.099128', '2017-09-09 22:15:39.099128', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (316, 'SJR LAC', 'LUIS PINILLA', 'DIRECTOR ADJUNTO', '', '', '', '', '', 'BOGOTÁ', 170, '', '2017-09-09', NULL, '2017-09-09 22:16:11.085664', '2017-09-09 22:16:11.085664', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (317, 'EMPRESARIOS POR LA EDUCACIÓN', '', '', '', '', '', '', '', '', 170, '', '2017-09-12', NULL, '2017-09-12 21:50:27.254554', '2017-09-12 21:52:15.984085', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (318, 'ABOGADOS SIN FRONTERAS.', 'Johan Felipe López Castillo', 'Asistente de comunicación', 'jhoan.lopez@asfcanada.ca', '3219790625', '', '0317225092', 'calle 33 nro. 19-59 piso 2', 'Bogotá', 170, 'Estefania Vargas Villabona Asesora Juridica', '2017-10-20', NULL, '2017-10-20 20:13:13.957872', '2018-02-06 11:41:57.540682', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (319, 'MESA SIRDEC GUAVIARE', 'JOELLE KUNH', 'COORDINADORA DESAPERECIDOS CICR COLOMBIA', '', '', '', '', '', '', NULL, '', '2017-10-30', NULL, '2017-10-30 20:04:45.07646', '2017-10-30 20:04:45.07646', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (320, 'CICR - COMITÉ INTERNACIONAL DE LA CRUZ ROJA', '', '', '', '', '', '', '', '', NULL, '', '2017-10-30', NULL, '2017-10-30 20:05:37.966641', '2017-10-30 20:05:37.966641', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (321, 'INSTITUTO MAYOR CAMPESINO IMCA', 'ERMINSU DAVID PABÓN, PEDRO OJEDA PINTA', '', '', '', '', '', '', NULL, NULL, 'DIRECTOR DEL IMCA. Promotor Social - IMCA', '2017-11-25', NULL, '2017-11-25 16:10:16.270042', '2018-05-24 11:48:18.095486', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (323, 'UNIVERSIDAD SURCOLOMBIANA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 13:59:51.705172', '2017-12-06 13:59:51.705172', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (324, 'COLOMBIA SUPPORT NETWORK', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 14:17:13.418043', '2017-12-06 14:17:13.418043', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (325, 'CORTE INTERAMERICANA DE DERECHOS HUMANOS', 'Javier Giraldo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 14:19:00.16024', '2017-12-06 14:19:00.16024', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (326, 'ASHOKA', 'Sybil Caballero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:10:24.960013', '2017-12-06 16:10:24.960013', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (327, 'NATURA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:11:46.370463', '2017-12-06 16:11:46.370463', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (328, 'COMPAÑIA DE JESUS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:14:36.925628', '2017-12-06 16:14:36.925628', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (329, 'RELIGIOSAS LAURITAS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:16:51.105334', '2017-12-06 16:16:51.105334', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (330, 'COMISIÓN COLOMBIANA DE JURISTAS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:18:44.402654', '2017-12-06 16:18:44.402654', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (331, 'REVISTA ALETEIA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:24:05.726414', '2017-12-06 16:24:05.726414', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (332, 'INSTITUTO IBEROAMERICANO DE BERLÍN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:25:35.398932', '2017-12-06 16:25:35.398932', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (333, 'PERIÓDICO PERIFERIA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:27:09.203816', '2017-12-06 16:27:09.203816', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (334, 'UNIVERSIDAD DE TOKIO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:28:11.754524', '2017-12-06 16:28:11.754524', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (335, 'UNIDAD DE VÍCTIMAS DE SOACHA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:29:28.873288', '2017-12-06 16:29:50.997473', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (336, 'ASCOA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:31:22.766912', '2017-12-06 16:31:22.766912', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (337, 'ORGANIZACIÓN MUNDIAL CONTRA LA TORTURA. OMCT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:32:14.764327', '2017-12-06 16:32:14.764327', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (338, 'CISCA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:34:32.034179', '2017-12-06 16:34:32.034179', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (339, 'FAMILIARES DE VICTIMAS DE LA MASACRE DEL PARAMO DE LA SARNA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:50:21.958156', '2017-12-06 16:50:21.958156', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (340, 'UNIVERSIDAD NACIONAL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:51:51.166007', '2017-12-06 16:51:51.166007', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (341, 'UNIDAD DE BÚSQUEDA DE PERSONAS DESAPARECIDAS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:52:51.015521', '2017-12-06 16:52:51.015521', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (342, 'SINDICATO DE TRABAJADORES UNIVERSITARIOS DE COLOMBIA, SINTRAUNICOL', 'JOSÉ MILCIADES SÁNCHEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 16:52:53.609507', '2017-12-06 16:52:53.609507', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (343, 'EMBAJADA DE CUBA EN BOGOTÁ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 17:00:49.898232', '2017-12-06 17:00:49.898232', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (344, 'ASOCIACIÓN PEQUEÑOS PRODUCTORES DE FRUTA, VEREDA MIRAFLORES', 'A TRAVÉS DEL IMCA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SE ATENDIO EL CASO DE DESPLAZAMIENTO DE UNA PERSONA ADULTA DE 53 AÑOS Y SU SOBRINO ', '2017-12-06', NULL, '2017-12-06 17:01:06.762117', '2017-12-06 17:01:06.762117', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (345, 'DIÓCESIS DE ISTMINA-TADO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 17:03:33.556073', '2017-12-06 17:03:33.556073', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (346, 'CONTAGIO RADIO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 17:04:06.452187', '2017-12-06 17:04:06.452187', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (347, 'GRUPO DE IMPULSO A ACTOS DE PERDON DE CATOLICOS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 17:05:11.710706', '2017-12-06 17:05:11.710706', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (348, 'RED DE DERECHOS HUMANOS DEL TOLIMA', 'ÁNGELA OSORIO ', '', '', '', '', '', '', NULL, NULL, 'INTEGRANTE DE LA SECCIONAL TOLIMA DE LA FUNDACIÓN COMITÉ DE SOLIDARIDAD CON LOS PRESOS POLÍTICOS. ESPACIO AL QUE PERTENCEN DIVERSAS OSRGANIZACIONES ', '2017-12-06', NULL, '2017-12-06 17:05:30.208819', '2018-05-24 11:32:42.075991', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (349, 'LIDERES CRISTIANOS Y SOCIALES SOBRE DERECHOS HUMANOS Y PROCESOS DE PAZ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 17:07:13.624702', '2017-12-06 17:07:13.624702', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (350, 'ELN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 17:09:33.125886', '2017-12-06 17:09:33.125886', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (351, 'LIDERES PROGRESISTAS DE IGLESIAS CRISTIANA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 17:11:34.567117', '2017-12-06 17:11:34.567117', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (352, 'PRENSA - FRANCE24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 21:19:20.822025', '2017-12-06 21:19:20.822025', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (353, 'UNIDAD DE VÍCTIMAS - UARIV', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 21:22:23.070244', '2017-12-06 21:25:32.739245', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (354, 'DEFENSORÍA DEL PUEBLO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 21:28:03.547333', '2017-12-06 21:28:03.547333', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (355, 'MISIÓN DE APOYO AL PROCESO DE PAZ EN COLOMBIA DE LA ORGANIZACIÓN DE LOS ESTADOS AMERICANOS MAPP/OEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-06', NULL, '2017-12-06 21:35:07.233126', '2017-12-06 21:35:07.233126', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (356, 'CARIBE AFIRMATIVO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:36:16.738225', '2017-12-07 14:36:16.738225', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (357, 'MUJER Y FUTURO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:38:52.941448', '2017-12-07 14:38:52.941448', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (358, 'CONCEJO MUNICIPAL DE TURMEQUÉ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:42:16.696924', '2017-12-07 14:42:16.696924', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (359, 'INSTITUCION EDUCATIVA DIEGO DE TORRES EN TURMEQUÉ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:43:43.462905', '2017-12-07 14:43:43.462905', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (360, 'RED ECLESIAL PANAMAZONICA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:45:36.434051', '2017-12-07 14:45:36.434051', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (361, 'GRUPO DE HOMOLOGOS DE DERECHOS HUMANOS Y ECOLOGÍA INTEGRAL DE LA RED SOCIAL CPAL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:47:46.260206', '2017-12-07 14:47:46.260206', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (362, 'AGENCIA DE COOPERACION ALEMANA GIZ', 'Christian Voelkel', '', '', '', '', '', '', NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:49:07.59123', '2018-05-23 18:13:04.125123', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (363, 'INSTITUTO KROC', 'BORJA PALADINI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:55:24.312047', '2017-12-07 14:55:24.312047', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (364, 'UTL CONGRESISTA ANGELA MARIA ROBLEDO', 'Paola Fonseca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-07', NULL, '2017-12-07 14:57:10.407556', '2017-12-07 14:57:10.407556', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (365, 'FUNDACIÓN SUMAPAZ', 'Winston Gallego', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-13', NULL, '2017-12-13 22:47:27.993028', '2017-12-13 22:47:27.993028', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (366, 'CORPORACIÓN VIVA LA CIUDADANIA', 'Luciano Sanín', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-18', NULL, '2017-12-18 22:18:46.273749', '2017-12-18 22:18:46.273749', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (367, 'COMISION DE DERECHOS HUMANOS DE MARCHA PATRIOTICA', 'Cristian Delgado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-18', NULL, '2017-12-18 22:23:04.29526', '2017-12-18 22:23:04.29526', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (368, 'CONSEJERÍA PRESIDENCIAL PARA LOS DERECHOS HUMANOS', 'Claudia Santamaría-Paula Gaviria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-18', NULL, '2017-12-18 22:25:50.818925', '2017-12-18 22:25:50.818925', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (369, 'OFICINA DEL ALTO COMISIONADO DE NACIONES UNIDAS PARA LOS DERECHOS HUMANOS EN COLOMBIA', 'Guillermo Fernández', '', '', '', '', '', '', NULL, NULL, '', '2017-12-18', NULL, '2017-12-18 22:27:37.087033', '2018-03-05 14:17:41.647929', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (370, 'COORDINACIÓN COLOMBIA EUROPA ESTADOS UNIDOS', 'Mildrey Corrales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-18', NULL, '2017-12-18 22:29:49.856891', '2017-12-18 22:29:49.856891', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (371, 'CENTRO INTERNACIONAL PARA LA JUSTICIA TRANSICIONAL-ICTJ', 'Maria Camila Moreno', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-18', NULL, '2017-12-18 22:31:13.500675', '2017-12-18 22:31:13.500675', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (372, 'COMISIÓN DE SEGUIMIENTO, IMPULSO Y VERIFICACIÓN A LA IMPLEMENTACIÓN DEL ACUERDO FINAL-CSIVI', 'Diego Martínez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-18', NULL, '2017-12-18 22:33:02.582685', '2017-12-18 22:33:02.582685', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (373, 'CONSEJO COMUNITARIO DE LOS RÍOS LA LARGA Y TUMARADÓ. COCOLATU', 'Pablo Antonio López Moreno - 310 549 71 18 / pablo-noan@hotmail.com / consejococolatu@gmail.com', '', '', '', '', '', '', NULL, NULL, 'El territorio colectivo de COCOLATU, se encuentra ubicado en la subregión del Bajo Atrato (Chocó). Su territorio comprende actualmente parte del municipio de Riosucio (Chocó), Turbo y Mutata (Antioquia). El territorio adjudicado, tiene una cabida superficiaria de CIENTO SIETE MIL SESENTA Y CUATRO HECTÁREAS, CON MIL SETECIENTOS SESENTA METROS CUADRADOS (107.064 Hect. – 1.760 m2).  Etnia: Afro y Mestizo.  Número de comunidades: 49 Consejos Comunitarios Locales. Censos: En el territorio habitan aproximadamente 3.057 personas, 1.493 mujeres y 1.564 hombres, distribuidas en 1.155 en hogares, identificándose el 100% de las personas censadas como población afrocolombiana. La población del Consejo está compuesta en un 66% por adultos (desde los 18 años hasta los 60), en un 17% por primera infancia y niños (desde los 0 hasta los 6 años) y un 17% por adolecentes.', '2017-12-19', NULL, '2017-12-19 15:19:02.937408', '2018-05-24 11:42:47.857991', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (374, 'ASOCIACIÓN DE CONSEJOS COMUNITARIOS Y ORGANIZACIONES DEL BAJO ATRATO. ASCOBA', 'Zenaida Edith Martinez --  311 620 14 62 -- asociacionascoba@yahoo.es', '', '', '', '', '', '', NULL, NULL, 'Municipios de Riosucio y Carmen del Darién – Chocó. 13 Consejos Comunitarios Mayores de la subregión del bajo Atrato.   58 Consejos Locales, que conforman ocho (8) cuencas (Quiparadó, Truandó, Domingodó, Salaquí, Curbaradó, La Larga Tumaradó, Pedeguita Mancilla y Atrato).   ASCOBA articula 2.562 familias / 7.238 hombres / 7.768 mujeres. ', '2017-12-19', NULL, '2017-12-19 15:28:55.249462', '2018-05-24 11:36:31.852803', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (375, 'BANCO DIOCESANO DE ALIMENTOS', 'Danwuil Bacca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 13:38:09.357263', '2017-12-20 13:38:09.357263', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (376, 'CORPORACIÓN SERVICIO PASTORAL SOCIAL - COSPAS', 'Abimael Bacca Pbro.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 13:41:13.698534', '2017-12-20 13:41:13.698534', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (377, 'COLEGIO PETRÓLEA', 'Daine Durán ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Municipio de Tibú, Corregimiento Petrólea.', '2017-12-20', NULL, '2017-12-20 13:45:36.388908', '2017-12-20 13:45:36.388908', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (378, 'ASOCIACIÓN CIVIL CÁTEDRA DE LA PAZ', 'Walter Trejo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 13:49:22.814535', '2017-12-20 13:49:22.814535', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (379, 'SERVICIO JESUITA A REFUGIADOS VENEZUELA (SJR)', 'Yovanny Bermúdez, S.J.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 13:51:29.050602', '2017-12-20 13:51:29.050602', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (380, 'UNIVERSIDAD CATÓLICA DEL TÁCHIRA (UCAT)', 'Wilfredo Rafael González, S.J. ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 14:33:38.349266', '2017-12-20 14:33:38.349266', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (381, 'ASOCIACIÓN FAMILIAS DESPLAZADAS DE LOS HATICOS', 'Janer Martínez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 14:40:29.837019', '2017-12-20 14:40:29.837019', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (382, 'CENTRO DE ATENCIÓN AL MIGRANTE REFUGIADO', 'Jheimmy Naizzir Velásquez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 14:43:39.142495', '2017-12-20 14:43:39.142495', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (383, 'PASTORAL SOCIAL DIÓCESIS DE RIOHACHA', 'Ascanio Vega', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 14:45:34.021987', '2017-12-20 14:45:34.021987', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (384, 'FE Y ALEGRÍA REGIÓN OCCIDENTE', 'Yenny Marín ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 14:48:01.520284', '2017-12-20 14:48:01.520284', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (385, 'PASTORAL SOCIAL CARITAS ARAUCA', 'Luis Fernando Millán Pbro. ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 14:57:19.344061', '2017-12-20 14:57:19.344061', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (386, 'DIÓCESIS DE GUASDUALITO', 'Monseñor Pablo Modesto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 14:58:38.313037', '2017-12-20 14:58:38.313037', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (387, 'FE Y ALEGRÍA OFICINA REGIÓN FRONTERA GUASDUALITO', 'Valeria Abreu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-12-20', NULL, '2017-12-20 15:01:15.401281', '2017-12-20 15:01:15.401281', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (388, 'FUERZA DE MUJERES WAYUU.FMW', 'Angelica Ortiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-01-17', NULL, '2018-01-17 13:37:21.19666', '2018-01-17 13:37:21.19666', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (389, 'CONSEJO COMUNITARIO AFRODESCENDIENTE DE ROCHE', 'Roberto Ramirez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-01-17', NULL, '2018-01-17 13:39:51.293194', '2018-01-17 13:39:51.293194', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (390, 'CONSEJO COMUNITARIO AFRODESCENDIENTE DE TABACO', 'Rogelio Ustate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-01-17', NULL, '2018-01-17 13:40:28.82273', '2018-01-17 13:40:28.82273', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (391, 'MESA DE DEFENSA TERRITORIAL DEL CERRO DE LA POPA', 'Rafael Caraballo', '', '', '', '', '', '', NULL, NULL, '', '2018-01-17', NULL, '2018-01-17 13:41:47.366177', '2018-05-22 14:56:29.694626', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (392, 'AFROCARIBE', 'Jorge Hernández', '', '', '', '', '', '', NULL, NULL, '', '2018-01-17', NULL, '2018-01-17 13:42:22.960018', '2018-05-23 18:12:41.105348', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (393, 'CENTRO ETNOEDUCATIVO DE CHERÚA', 'Nestor Montero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-01-17', NULL, '2018-01-17 13:45:14.028699', '2018-01-17 13:45:14.028699', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (394, 'DIÁLOGO INTERECLESIAL POR LA PAZ DE COLOMBIA (DIPAZ)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-01-24', NULL, '2018-01-24 21:59:48.719716', '2018-01-24 21:59:48.719716', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (395, 'IDUCA INSTITUTO DE DERECHOS HUMANOS DE LA UCA - SAN SALVADOR - CENTRO AMÉRCIA', 'Verónica Hinestroza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Contacto de Marcela Salazar P. - Gerente de Proyectos. Visista por Luis Guillermo Guerrero G. y por John Jairo Montoya S.J. en octubre de 2017 en Londres para conocer la actividad del Instituto y del CINEP/PPP', '2018-02-04', NULL, '2018-02-05 00:30:32.541115', '2018-02-05 00:30:32.541115', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (396, 'IDUCA', 'Verónica Hinestroza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Contacto de Marcela Salazar P. - Gerente de Proyectos. Visista por Luis Guillermo Guerrero G. y por John Jairo Montoya S.J. en octubre de 2017 en Londres para conocer la actividad del Instituto y del CINEP/PPP', '2018-02-04', NULL, '2018-02-05 00:32:16.858908', '2018-02-05 00:32:16.858908', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (397, 'ASCAFESAGRADO', 'Yelizze Dayana Martínez Polania', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:32:14.345698', '2018-02-05 20:32:14.345698', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (398, 'SENA TOLIMA', 'NORMA SALAZAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:32:24.074829', '2018-02-05 20:48:17.739161', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (399, 'ASMUCONPO', 'Danny Ospina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:33:54.481125', '2018-02-05 20:33:54.481125', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (400, 'ATACONDOR', 'Jackeline García Valencia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:34:49.214955', '2018-02-05 20:34:49.214955', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (401, 'ASORPOANDES', 'ANGIE CAVIEDES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:34:51.002612', '2018-02-05 20:34:51.002612', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (402, 'ASTRACATOL', 'Antonio Garcia', '', '', '', '', '', '', NULL, NULL, 'Dato contacto:  320 835 6294', '2018-02-05', NULL, '2018-02-05 20:35:10.932688', '2018-05-24 11:40:49.376422', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (403, 'I.E. EL RUBI', 'EVERCELIO AVILÉS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:37:23.552214', '2018-02-05 21:02:06.878194', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (404, 'CORPOSANTAFE', 'Flor Alba Castillo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Numero de Contacto: 311 820 6279', '2018-02-05', NULL, '2018-02-05 20:38:10.609488', '2018-02-05 20:38:10.609488', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (405, 'COMUNIDAD INDÍGENA MPCLM', 'Diana Maritza Figueroa Ortiz ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:38:33.295245', '2018-02-05 20:38:33.295245', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (406, 'I.E SANTO DOMINGO SAVIO', 'ARBEY LUQUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:38:35.253051', '2018-02-05 20:38:35.253051', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (407, 'I.E. ANTONIO NARIÑO', 'Olmedo Oyola Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:39:49.38045', '2018-02-05 20:39:49.38045', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (408, 'I.E ANTONIO NARIÑO', 'HERMES AVENDAÑO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:39:56.032138', '2018-02-05 20:39:56.032138', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (409, 'I.E. JORGE ELIÉCER GAITÁN', 'Nohora Constanza Cardona Daza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:40:29.609187', '2018-02-05 20:40:29.609187', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (410, 'ASOMUPOR', 'Nelcy Sanchez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dato de Contacto: 322 331 9620', '2018-02-05', NULL, '2018-02-05 20:41:02.237337', '2018-02-05 20:41:02.237337', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (411, 'I.E. MARTÍN POMALA', 'Julio César Tacorena D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:41:14.639985', '2018-02-05 20:41:14.639985', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (412, 'ASOMUFAMEDIO', 'BETSABE PRIETO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:41:26.370718', '2018-02-05 20:41:26.370718', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (413, 'I.E. SANTIAGO PÉREZ', 'Jhon Jairo Tafur Lozano ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:43:25.681369', '2018-02-05 20:43:25.681369', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (414, 'I.E LA PRIMAVERA', 'MARIA NORIS VARGAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:45:13.642505', '2018-02-05 20:45:13.642505', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (415, 'COMUNIDAD PIJAO DE ATACO TOLIMA', 'Carlos Augusto Rodríguez M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:45:36.78092', '2018-02-05 20:45:36.78092', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (416, 'SECRETARÍA DE EDUCACIÓN TOLIMA', 'Ilva Inés Vargas Caviedes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:46:20.188813', '2018-02-05 20:46:20.188813', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (417, 'EMISORA COMUNITARIA RIOBLANCO SR', 'Maria Naudis Guerrero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dato contacto: 321 376 4496', '2018-02-05', NULL, '2018-02-05 20:46:22.969101', '2018-02-05 20:46:22.969101', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (418, 'I.E. LOS ANDES', 'JOSE DARIO ENCISO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:46:29.441221', '2018-02-05 20:46:29.441221', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (419, 'ASOPROCARIO', 'Raul Palma ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:48:25.456474', '2018-02-05 20:48:25.456474', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (420, 'ALCALDÍA CHAPARRAL', 'Manuel Oviedo Oviedo', '', '', '', '', '', '', NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:49:39.838287', '2018-02-06 16:58:02.262541', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (421, 'I.E VILLA LUZ', 'DANIEL RIVERA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:49:54.841409', '2018-02-05 20:49:54.841409', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (422, 'ART TOLIMA', 'Carolina Vásquez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:50:38.731467', '2018-02-05 20:50:38.731467', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (423, 'ASDEVIR', 'Adonai Rincon', '', '', '', '', '', '', NULL, NULL, 'Asociación de Victimas de Rioblanco. Telefono contacto: 321 818 9014', '2018-02-05', NULL, '2018-02-05 20:51:55.966906', '2018-05-24 11:40:02.006511', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (424, 'ASADAMAGUA', 'Carmen Emilia Moreno Tique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:51:58.729111', '2018-02-05 20:51:58.729111', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (425, 'BPM GAITANA', 'DAYERN RODRIGUEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:52:47.024308', '2018-02-05 20:52:47.024308', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (426, 'ASOCIACIÓN EL SEMBRADOR', 'María De Los Ángeles Bueno Rojas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:54:03.925165', '2018-02-05 20:54:03.925165', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (427, 'ALCALDÍA PLANADAS', 'JORGE ALFONSO RIVAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:54:39.727116', '2018-02-05 20:54:39.727116', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (428, 'ASOJUNTAS CHAPARRAL', 'Mariano Pérez Castro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:55:15.215799', '2018-02-05 20:55:15.215799', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (429, 'ALCALDÍA MUNICIPAL DE RIOBLANCO', 'Carmen Elena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Enlace de Educación Administración Municipal de Rioblanco ', '2018-02-05', NULL, '2018-02-05 20:55:32.369672', '2018-02-05 20:55:32.369672', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (430, 'ASOPADRES CHAPARRAL', 'Doris Devia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:55:39.74306', '2018-02-05 20:55:39.74306', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (431, 'ASOGRADEP', 'DUVADIER AVILÉS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:55:46.057423', '2018-02-05 20:55:46.057423', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (432, 'CASA DE LA CULTURA CHAPARRAL', 'Carolina García Trujillo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:56:30.838585', '2018-02-05 20:56:30.838585', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (433, 'CASA DE LA JUSTICIA - RIOBLANCO', 'Hector Ferney Rodriguez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:57:05.066153', '2018-02-05 20:57:05.066153', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (434, 'NASA WES´X RÍZÑI', 'EDWIN MEDINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:58:34.16887', '2018-02-05 20:58:34.16887', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (435, 'CONCEJO MUNICIPAL - RIOBLANCO', 'Angel Maria Suarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:58:42.690184', '2018-02-05 20:58:42.690184', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (436, 'CASA DE JUSTICIA CHAPARRAL', 'Amanda Castro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:58:44.559292', '2018-02-05 20:58:44.559292', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (437, 'CASA LÚDICA CHAPARRAL', 'Gloria González', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 20:59:53.130671', '2018-02-05 20:59:53.130671', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (438, 'I.E. BILBAO', 'LUIS HERMES DÍAZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:00:06.742269', '2018-02-05 21:00:06.742269', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (439, 'IE JESUS ANTONIO AMEZQUITA', 'Giovanny Martinez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:00:11.180492', '2018-02-05 21:00:11.180492', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (440, 'CONSEJO MUNICIPAL CHAPARRAL', 'Ana Astrid Camacho', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:00:35.048974', '2018-02-05 21:00:35.048974', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (441, 'DEFENSA CIVIL CHAPARRAL', 'Eurima Lezama', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:01:06.926285', '2018-02-05 21:01:06.926285', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (442, 'IE EL QUEBRADON', 'Martha Cecilia Moreno', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:01:39.267608', '2018-02-05 21:01:39.267608', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (443, 'ESAP', 'José Antonio Masmela', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:01:51.290267', '2018-02-05 21:01:51.290267', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (444, 'IE SAN RAFAEL', 'Yurany Azuero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:02:33.45691', '2018-02-05 21:02:33.45691', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (445, 'FUNDACIÓN JÓVENES ACTIVOS', 'Jhonnatan Perdomo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:02:44.828218', '2018-02-05 21:02:44.828218', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (446, 'IE JOSE MARIA CORDOBA', 'Henry Lopez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:03:01.411242', '2018-02-05 21:03:01.411242', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (447, 'I.E. ALVARO MOLINA', 'Jaime Aldana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:03:20.199946', '2018-02-05 21:03:20.199946', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (448, 'IE LUIS ERNETOS VANEGAS NEIRA', 'Hector Pachon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:03:56.479908', '2018-02-05 21:03:56.479908', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (449, 'I.E. CAMACHO ANGARITA', 'Flor Idaly García', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:04:37.364249', '2018-02-05 21:04:37.364249', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (450, 'IE FRANCISCO JULIAN OLAYA', 'Danilo Robayo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:04:58.438406', '2018-02-05 21:04:58.438406', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (451, 'I.E. LA RISARALDA', 'Dominga Leyton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:05:10.529975', '2018-02-05 21:05:10.529975', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (452, 'PERSONERÍA MUNICIPAL PLANADAS', 'HAROL DONOSO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:05:19.392285', '2018-02-05 21:05:19.392285', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (453, 'I.E. LAGUNILLA', 'Luz Deri Marín', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:05:58.637172', '2018-02-05 21:05:58.637172', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (454, 'I.E. MANUEL MURILLO TORO', 'Carlos Alberto Paz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:06:29.320872', '2018-02-05 21:06:29.320872', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (455, 'FUNDACIÓN ZACATIN', 'ILBA GONZALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:06:31.144212', '2018-02-05 21:06:31.144212', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (456, 'IE GENERAL SANTANDER', 'Edison Acosta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:06:51.505579', '2018-02-05 21:06:51.505579', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (457, 'I.E. MEDALLA MILAGROSA', 'Gloria Amparo Wheeler Arcila', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:07:01.940647', '2018-02-05 21:07:01.940647', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (458, 'I.E NUESTRA SEÑORA DEL ROSARIO', 'Andrea Yiceth Cuervo Leal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:08:12.165508', '2018-02-05 21:08:12.165508', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (459, 'COLECTIVO DE JOVENES DE RIOBLANCO', 'Edwin Moreno', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:08:19.187102', '2018-02-05 21:08:19.187102', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (460, 'FUNDACIÓN FAMILIA AYARA', 'JENNY TAMAYO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:08:37.812091', '2018-02-05 21:08:37.812091', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (461, 'I.E SIMON BOLIVAR', 'Francia Patricia Sarmiento Moya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:08:43.098537', '2018-02-05 21:08:43.098537', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (462, 'I.E SOLEDAD MEDINA', 'Edgar Roberto Aya Suarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:09:20.979095', '2018-02-05 21:09:20.979095', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (463, 'TOLIPAZ', 'Jorge Duran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:09:30.026711', '2018-02-05 21:09:30.026711', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (464, 'ATUNCCOL', 'JORGE ELIECER ARDILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:09:45.226418', '2018-02-05 21:09:45.226418', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (465, 'ICBF', 'Yarima Rodríguez Quiñones ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:10:13.848385', '2018-02-05 21:10:13.848385', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (466, 'RENACER', 'JOSE EMILIO OVIEDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:10:36.10287', '2018-02-05 21:10:36.10287', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (467, 'COMBITE PIJAO', 'María Del Pilar Figueroa Olaya ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:11:23.643591', '2018-02-05 21:11:23.643591', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (468, 'JAC LA UNION', 'LAUREANO SOTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:12:13.655395', '2018-02-05 21:12:13.655395', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (469, 'ITFIP', 'Gustavo Willy Trujillo Suarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:12:17.323366', '2018-02-05 21:12:17.323366', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (470, 'ASOBRIS', 'LUCY BETTY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:12:57.697237', '2018-02-05 21:12:57.697237', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (471, 'JAC LA MARINA CHAPARRAL', 'Evelli Cuadros Vargas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:13:21.027834', '2018-02-05 21:13:21.027834', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (472, 'LICEO SANTA TERESITA NIÑO JESUS', 'Edelmira Silva Ducuara ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:14:06.957799', '2018-02-05 21:14:06.957799', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (473, 'CORCOES', 'LUIS FERNEY CHAVIONES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:14:20.593265', '2018-02-05 21:14:20.593265', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (474, 'NOTICIERO ABRIENDO VENTANAS', 'Héctor Julián Gutiérrez Hoyos ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:14:42.040908', '2018-02-05 21:14:42.040908', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (475, 'ASOCIACIÓN DE CACAOTEROS DE RIOBLANCO', 'Diego', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dato contacto: 311 423 9078', '2018-02-05', NULL, '2018-02-05 21:14:55.236345', '2018-02-05 21:14:55.236345', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (476, 'RED DE MUJERES CHAPARRALUNAS', 'Zoraida Montes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:15:24.546908', '2018-02-05 21:15:24.546908', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (477, 'CONCEJO MUNICIPAL PLANADAS', 'LUIS HOOVER MORA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:15:35.834409', '2018-02-05 21:15:35.834409', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (478, 'FUNDACIÓN YAPAWAYRA', 'Martha Alfonso ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:15:39.71496', '2018-02-05 21:15:39.71496', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (479, 'I.E. SAGRADO CORAZÓN', 'Nayive Vasco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:16:06.508208', '2018-02-05 21:16:06.508208', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (480, 'UNIVERSIDAD DEL TOLIMA', 'Mercedes Salazar Fernández', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:16:57.819673', '2018-02-05 21:16:57.819673', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (481, 'HOSPITAL DE PLANADAS', 'NAYIVE TOCAREMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:17:14.315679', '2018-02-05 21:17:14.315679', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (482, 'JAC PLANADAS', 'Yisela Vargas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:21:41.290276', '2018-02-05 21:21:41.290276', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (483, 'JUNTA DE ACCIÓN COMUNAL', 'RAMON VILLAMARIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:21:55.378683', '2018-02-05 21:21:55.378683', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (484, 'I.E. PABLO SEXTO', 'Santiago Sánchez Olaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:23:12.114868', '2018-02-05 21:23:12.114868', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (485, 'JUNTA DE ACCIÓN COMUNAL PLANADAS', 'WILLIAM LEMUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-02-05', NULL, '2018-02-05 21:23:30.3099', '2018-02-05 21:23:30.3099', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (486, 'CPAL CONFERENCIA DE PROVINCIALES DE AMÉRICA LATINA', 'P. Roberto Jaramillo S.J.', 'Presidente de la CPAL', 'Roberto Jaramillo Bernal <presidente@cpalsj.org>', '', '', '', '', NULL, NULL, '', '2018-02-05', NULL, '2018-02-06 04:06:19.2143', '2018-02-06 04:06:19.2143', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (487, 'RED CENTROS SOCIALES CPAL', 'Galo Bogarin', 'Coordinador de la Red Social CPAL', 'Galo Bogarin <rcscoord@cpalsj.org>', '', '', '', '', NULL, NULL, '', '2018-02-05', NULL, '2018-02-06 04:08:06.768731', '2018-02-06 04:08:06.768731', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (488, 'FACULTAD DE ESTUDIOS AMBIENTALES Y RURALES UNIVERSIDAD JAVERIANA BOGOTA', 'Maria Adelaida Farah', 'Decana', 'María Adelaida Farah (mfarah@javeriana.edu.co)', '', '', '', '', NULL, NULL, '', '2018-02-05', NULL, '2018-02-06 04:27:30.985677', '2018-02-06 04:27:30.985677', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (489, 'CORPORACIÓN DE DESARROLLO SOLIDARIO.CDS', 'Auristella Moreno', 'Directora', 'direccion@cds.org.co', '(5) 6640871', '', '3205465641', ' Centro Sector Matuna, Edificio Gedeón Piso 7, Cartagena.', NULL, NULL, '', '2018-03-01', NULL, '2018-03-01 16:34:15.858773', '2018-03-01 16:34:15.858773', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (490, 'CORPORACIÓN PARA EL DESARROLLO SOCIAL COMUNITARIO.CORSOC', 'Pedro Acosta', 'Director', 'pedro.corsoc@gmail.com', '(4) 7869606', '', '3126986928', 'Carrera 18 A No.22 D-58 Barrio Pasatiempo, Montería.', NULL, NULL, '', '2018-03-01', NULL, '2018-03-01 16:37:06.805794', '2018-03-01 16:37:06.805794', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (491, 'CONSEJO NORUEGO PARA REFUGIADOS.NRC', 'Juan Camilo Sánchez', 'Asistente Legal', 'camilo.sanchez@nrc.no', '(5)4202168', '', '', 'Calle 11B No. 16A-57, Urb. Las Villas - Riasco, Santa Marta.', NULL, NULL, '', '2018-03-01', NULL, '2018-03-02 02:10:20.726625', '2018-03-02 02:14:42.351219', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (492, 'MOVIMIENTO SUECO POR LA RECONOCILIACIÓN.SWEFOR', 'Roberto Montoya', 'Coordinador Incidencia', 'ddhh@swefor.org', '(1)3225383', '', '3142071993', 'Carrera 28 No. 39-06, oficina 204, Bogotá.', NULL, NULL, '', '2018-03-01', NULL, '2018-03-02 02:13:10.574374', '2018-03-02 02:13:10.574374', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (493, 'UNIÓN EUROPEA', 'Francisco García; Anne Sophie Houee', 'Jefe de Cooperación, oficina de cooepracion', 'Francisco.GARCIA@eeas.europa.eu; Anne-Sophie.HOUEE@eeas.europa.eu', '+57-1 747 77 00 - ', '+57-1 747 50 57', '', 'Calle 116 número 7-15, interior 2, piso 12,  Edificio Cusezar, barrio Santa Bárbara,  Bogotá D.C', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 15:38:41.972054', '2018-03-05 15:38:41.972054', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (494, 'ACDI-VOCA', 'María Angélica Nieto', '', 'mnieto@acdivoca-co.org', '', '', '3158691305', 'Cl. 79 #7 - 32,', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 20:57:05.246859', '2018-03-05 20:57:05.246859', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (495, 'AGENCIA PARA LA REINCORPORACIÓN Y LA NORMALIZACIÓN (ARN)', 'David Marulanda', '', 'davidmarulanda@acr.gov.co', '', '', '3226404633', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:07:13.493028', '2018-03-05 23:07:13.493028', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (496, 'CIASE', 'Rosa Emilia Salamanca', '', 'rosaesalamanca@gmail.com', '', '', '3182269722', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:08:29.056077', '2018-03-05 23:08:29.056077', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (497, 'ASISTENCIA APOSTOLADOS DE LA COMPAÑÍA DE JESÚS', 'Luis Javier Sarralde ', '', 'asistenciaapostolados@jesuitas.org.co', '3314360 ext 108', '', '', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:11:00.521885', '2018-03-05 23:11:00.521885', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (498, 'COLECTIVO DE PARTICIPACIÓN E INVESTIGACIÓN SOCIAL (CPAIS)', 'Jose Ricardo Garzón', '', 'garzonjosericardoc@gmail.com', '', '', '3103126352', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:13:14.825484', '2018-03-05 23:13:14.825484', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (499, 'FUNDACIÓN IDEAS PARA LA PAZ (FIP)', 'Sergio Guarín', '', 'sguarin@ideaspaz.org', '', '', '3002116228', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:18:40.517298', '2018-03-05 23:18:40.517298', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (500, 'UNIVERSIDAD LIBRE DE BERLIN (FUB)', 'Mona Hasenstap', '', 'monaah@web.de', '', '', '3183084266', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:21:58.424404', '2018-03-05 23:21:58.424404', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (501, 'PONTIFICA UNIVERSIDAD JAVERIANA, MAESTRÍA EN ESTUDIOS DE PAZ Y RESOLUCIÓN DE CONFLICTOS', 'María Lucia Zapata', 'Directora de la Maestría', 'ml.zapata@javeriana.edu.co', '', '', '', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:24:05.765877', '2018-03-05 23:24:05.765877', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (502, 'RED PRODEPAZ', 'Astrid López', '', 'astrid.lopez@redprodepaz.org.co', '', '', '3143467016', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:33:03.89024', '2018-03-05 23:33:03.89024', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (503, 'REACCIÓN PARA LA RECONCILIACIÓN', 'Maria Angelica Bueno', '', 'mangel13bueno@gmail.com', '', '', '3208858089', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:34:08.005562', '2018-03-05 23:34:08.005562', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (504, 'ONU MUJERES', 'Margarita Muñoz', '', 'margarita.munoz@unwomen.org', '', '', '3153934741', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:35:58.799763', '2018-03-05 23:35:58.799763', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (505, 'FUNDACIÓN EL NOGAL', 'David Adams', '', 'efundacion@clubelnogal.com', '', '', '', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:38:09.327846', '2018-03-05 23:38:09.327846', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (506, 'FORO NACIONAL POR COLOMBIA', 'María Teresa Muñoz', '', 'mtmunoz@foro.org.co', '', '', '3006100003', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:40:26.181408', '2018-03-05 23:40:26.181408', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (507, 'FUNDACIÓN PARA LA RECONCILIACIÓN', 'Viviana Gutierrez', '', 'posconflicto@fundacionparalareconciliacion.org', '3214729694', '', '', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:42:41.179969', '2018-03-05 23:42:41.179969', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (508, 'IIRESODH', 'Carlos Julio Vargas', '', 'cvargasvelandia@iiresodh', '', '', '3153162320', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:44:56.180558', '2018-03-05 23:44:56.180558', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (509, 'GRUPO ECUMÉNICO DE MUJERES CONSTRUCTORAS DE PAZ (GEMPAZ)', 'Mónica Velásquez', '', 'mvelasquez58@gmail.com', '', '', '3142979592', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-05 23:46:35.133923', '2018-03-05 23:46:35.133923', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (510, 'MEDIATION SUPPORT NETWORK.', '', '', '', '', '', '', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-06 00:01:37.109031', '2018-03-06 00:01:37.109031', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (511, 'COMUNDO', '', '', '', '', '', '', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-06 00:02:20.686561', '2018-03-06 00:02:20.686561', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (512, 'SWISSPEACE', '', '', '', '', '', '', '', NULL, NULL, '', '2018-03-05', NULL, '2018-03-06 00:02:46.039138', '2018-03-06 00:02:46.039138', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (513, 'CORPONOR', 'Carlos Sanmiguel', 'Ingeniero ambiental', '', '+573183378537', '', '', '', NULL, NULL, '', '2018-03-06', NULL, '2018-03-06 12:56:05.533139', '2018-03-06 12:56:05.533139', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (514, 'ASCAMCAT', 'John Abril', 'Líder', '', '+573143605833', '', '', '', NULL, NULL, '', '2018-03-06', NULL, '2018-03-06 13:00:50.594644', '2018-03-06 13:00:50.594644', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (515, 'PLATAFORMA PAZCOMPLETA', 'Katherine Torres', 'Líder', '', '+573102875867', '', '', '', NULL, NULL, '', '2018-03-06', NULL, '2018-03-06 13:04:37.762389', '2018-03-06 13:04:37.762389', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (516, 'PARES', 'Carlos Montoya', 'Investigador', '', '', '', '3003836119', '', NULL, NULL, '', '2018-03-06', NULL, '2018-03-06 13:09:00.028289', '2018-03-06 13:09:00.028289', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (517, 'MESA SOCIAL PARA LA PAZ', 'Olimpo Cárdenas', 'Líder', '', '', '', '+573113300991', '', NULL, NULL, '', '2018-03-06', NULL, '2018-03-06 13:13:57.385242', '2018-03-06 13:13:57.385242', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (518, 'PROCLADE - ONG MISIONEROS CLARETIANOS', 'Adriana Arboleda Betancur ', 'Directora Corporación Jurídica Libertad ', 'adriana.arboledab@gmail.com', '2318355 - 2516350', '', '', '', NULL, NULL, '', '2018-04-02', NULL, '2018-04-02 14:11:33.640519', '2018-04-02 14:11:33.640519', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (519, 'FUNDACIÓN RED NACIONAL DE PROGRAMAS REGIONALES DE DESARROLLO Y PAZ - REDPRODEPAZ', 'Jorge Alberto Tovar Beltran', 'Director Fundación y Cordinador de la Redprodepaz', 'jorge.tovar@redprodepaz.org.co', '(1) 2855649', '', '3216478217', 'Calle 35 No. 7-25, Piso 10, Bogotá', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 02:31:15.99164', '2018-04-09 02:31:15.99164', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (520, 'CORPORACIÓN DE DESARROLLO Y PAZ DEL MAGDALENA MEDIO', 'Ubencel Duque', 'Director de la Coorporacion', 'ubencel@gmail.com', '3112429280', '', '3105793090', 'Cl. 49 #6b-93, Barrancabermeja, Santander', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 02:49:32.858565', '2018-04-09 02:49:32.858565', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (521, 'CORDEPAZ COPORACION DE DESARROLLO Y PAZ DEL META Y PIEDEMONTE LLANERO', 'Sonia Pabón', 'Directora Cordepaz', 'spabon@cordepaz.org', 'Teléfono: 6620320', '', '3202304618', 'Cra. 31 #39-41, Villavicencio, ', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 02:55:31.982634', '2018-04-09 02:55:31.982634', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (522, 'PRODEPAZ - CORPORACIÓN DE DESARROLLO Y PAZ DEL ORRIENTE ANTIOQUEÑO', 'Padre  Oscar David Maya Montoya', 'Director de la Corporación Prodepaz', 'omaya@prodepaz.org', '(4) 5314422', '', '3132831625', 'Cl. 64, Rionegro, Antioquia  ', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 03:05:33.559138', '2018-04-09 03:05:33.559138', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (523, 'CONSORNOC - CORPORACIÓN NUEVA SOCIEDAD DE LA REGIÓN NORORIENTAL DE COLOMBIA', 'Padre Juan Carlos Rodriguez', 'Director Consornoc', 'consornoc.utecnica2@gmail.com', '+57 (7) 568 29 49 +57 313 261 75 35', '', '3208506681', 'Calle 6 N° 8 – 34 Santo Domingo Pamplona  ', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 03:26:50.867986', '2018-04-09 03:26:50.867986', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (524, 'CONFERENCIA EPISCOPAL DE COLOMBIA', 'Monseñor Oscar Urbina Ortega. ', 'Presidente Conferencia Episcopal. Arzobispo de Villavicencio. Presidente Cordepaz ', 'villavicencioarq@cec.org.co Carrera 39 Nº 34-19', ' 57 (1) 4375540', '', '', 'Dirección: Cra. 58 #80 - 87, Bogotá ', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 03:47:59.400384', '2018-04-09 03:47:59.400384', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (525, 'PASTORAL SOCIAL NACIONAL', 'Monseñor Hector Fabio Henao', 'Director Pastoral Social Nacional', 'mhfabiohenaog@cec.org.co; henao1@yahoo.com', '+57 (1) 4377150', ' Fax: +57 (1) 4377171', '', 'Cra. 58 #80-87, Bogotá', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 04:03:16.872929', '2018-04-09 04:03:16.872929', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (526, 'PROGRAMA DE DESARROLLO Y PAZ DEL MAGDALENA CENTRO', 'Javier Moncayo ', 'Director del PDPMC', ' javier.moncayo@pdpmagdalenacentro.org', '51-1 - 8390984', '', '3104549238', ' Cr. 3 # 15-35 La Dorada', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 04:17:51.091754', '2018-04-09 04:17:51.091754', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (527, 'COMPAÑÍA DE JESÚS - PROVINCIAL COLOMBIA', 'P. Carlos Eduardo Correa Jaramillo, S.J.', 'Provincial', 'carlosecorrea@Jesuitas.org.co', '+57 1 3314560', '', '3124803767', 'Cra. 25 #39 - 79, Bogotá Teléfono: ', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 04:37:19.396542', '2018-04-09 04:37:19.396542', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (528, 'COMPAÑÍA DE JESÚS - CURIA GENERAL', 'P. Arturo Sosa, S.J.', 'Padre General de la Compañía de Jesús', 'webmaster@sjcuria.org ', 'Tel: +39-06-689-771 Roma', '', '', ' Web: www.sjweb.info', NULL, NULL, '', '2018-04-08', NULL, '2018-04-09 04:51:57.344661', '2018-04-09 04:52:48.417402', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (529, 'ORGANIZACIÓN WIWA YUGUMAIUN BUNKUANARRUA TAYRONA (OWYBT)', 'Juan Felix Malo', 'Secretario de la organización', 'organizacionwiwa@gmail.com', '', '', '3126088981', '', NULL, NULL, '', '2018-04-24', NULL, '2018-04-24 15:06:11.20777', '2018-04-24 15:06:11.20777', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (530, 'ASCATIDAR', 'Víctor Chibaraquía', '', '', '3115389829', '', '', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 16:42:51.673364', '2018-05-08 16:42:51.673364', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (531, 'PAZ COMPLETA', 'Katherine Torres', '', '', '3102875867', '', '', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 16:52:12.437826', '2018-05-08 16:52:12.437826', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (532, 'INTERPEACE', 'Otto Argueta', 'Coordinador Programas América Latina', 'argueta@interpeace.org', '', '', '3228324132', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 16:57:56.574399', '2018-05-08 16:57:56.574399', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (533, 'INTERPEACE COLOMBIA', 'Ana Glenda Tager', 'Directora Regional', 'tager@interpeace.org', '', '', '3144267042', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 17:04:39.782651', '2018-05-08 17:04:39.782651', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (534, 'UNIPEP', 'Álvaro Pico', 'Director UNIPEP', '', '', '', '', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 17:19:05.027837', '2018-05-08 17:19:05.027837', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (535, 'POLICÍA NACIONAL UNIPEP', 'Coronel Laurangeli', 'Coronel', '', '', '', '3012020357', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 17:20:53.081111', '2018-05-08 17:20:53.081111', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (536, 'FPH', 'Louca Lerch', 'Program Manager', 'louca.lerch@fph.ch', '', '', '', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 17:25:28.217631', '2018-05-08 17:25:28.217631', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (537, 'CONSULTORIA PARA LOS DERECHOS HUMANOS Y EL DESPLAZAMIENTO.CODHES', 'Martha Salazar', 'Coordinadora Región Caribe', 'm.salazar13@hotmail.com', '', '', '3164965591', '', NULL, NULL, '', '2018-05-08', NULL, '2018-05-08 19:57:01.984499', '2018-05-08 19:57:01.984499', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (538, 'CORPORACIÓN VIDA - PAZ', 'SHIRLY ANDREA RODRUGUEZ', 'DIRECTORA EJECUTIVA', 'sarodriguezn1@gmail.com ', '', '', '311 5271360', 'San José del Guaviare', NULL, NULL, 'EL DEPARTAMENTO DEL GUAVIARE NO ESTÁ, EN ESPECIAL SAN JOSE Y CALAMAR GUAVIARE', '2018-05-15', NULL, '2018-05-15 19:56:48.812688', '2018-05-24 11:43:36.360922', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (539, 'GRUPO POR LA DEFENSA DE LA TIERRA Y EL TERRITORIO DE CÓRDOBA', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 20:33:07.70124', '2018-05-16 20:33:07.70124', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (540, 'JOVENES RURALES NO ORGANIZADOS DEL VALLE DEL CAUCA', 'PEDRO OJEDA PINTA', 'Promotor Social IMCA', 'pedroojeda136@hotmail.com', '3162809902', '', '3162809902', 'Cra 12 #35 sur 10 / Vereda Quebrada Seca - Buga Valle - Colombia', NULL, NULL, 'EL INSTITUTO MAYOR CAMPESINO DE BUGA (IMCA) ES EL CONTACTO CON LOS JOVENES NO ORGANIZADOS DEL VALLE DEL CAUCA', '2018-05-16', NULL, '2018-05-16 21:20:24.879126', '2018-05-16 21:20:24.879126', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (541, 'JOVENES RURALES NO ORGANIZADOS DEL SUR DE BOLÍVAR', 'DIANA MARCELA TORRES', 'Coordinadora regional del equipo de Magadalena Medio, SJR', 'coordinacion.mm@sjrcolombia.org', '', '', '', '', NULL, NULL, 'EL SERVICIO JESUITA PARA REFUGIADOS (SJR) ES EL CONTACTO CON LOS JOVENES RURALES NO ORGANIZADOS DEL SUR DE BOLIVAR', '2018-05-16', NULL, '2018-05-16 21:26:18.100459', '2018-05-16 21:26:18.100459', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (542, 'JOVENES RURALES NO ORGANIZADOS DE NORTE DE SANTANDER', 'Oscar Javier Calderón', 'coordinador regional del equipo de Santander Norte, SJR', 'coordinacion.nds@sjrcolombia.org', '', '', '', '', NULL, NULL, 'EL SERVICIO JESUITA PARA REFUGIADOS (SJR) ES EL CONTACTO CON LOS JOVENES RURALE NO ORFANIZADOS DE NORTE DE SANTANDER', '2018-05-16', NULL, '2018-05-16 21:28:50.018629', '2018-05-16 21:28:50.018629', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (543, 'JUNTA DE GOBIERNO CAMPESINO TCAM', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 21:46:32.443051', '2018-05-16 21:46:32.443051', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (544, 'COMITÉ DE INTEGRACIÓN DEL MACIZO COLOMBIANA- CIMA', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 21:49:29.708724', '2018-05-16 21:49:29.708724', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (545, 'GRUPO SEMILLAS DE PAZ', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:05:20.471817', '2018-05-16 22:05:20.471817', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (546, 'ESCUELA AGROAMBIENTAL EL VOLADOR . EL VOLADOR', 'Sandra  Fabiola Gaviria', '', 'gaviriaf77@gmail.com', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:06:48.344251', '2018-05-17 21:01:14.956922', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (547, 'ASOCIACIÓN AGROAMBIENTAL Y CULTURAL CIMA ARBOLEDA . ACA ROSAFLORIDA', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:08:04.059635', '2018-05-17 21:02:07.698387', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (548, 'GRUPO ASOCIATIVO UNIDAD SOCIAL', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:08:32.101787', '2018-05-16 22:08:32.101787', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (549, 'GRUPO ASOCIATIVO ANHELO VENTEÑO', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:09:06.32805', '2018-05-16 22:09:06.32805', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (550, 'ESCUELA AGROAMBIENTAL NUEVO FUTURO (JUAN SOLARTE OBANDO)', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:09:49.475824', '2018-05-16 22:09:49.475824', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (551, 'ESCUELA AGROAMBIENTAL HUELLAS (VALPARAISO)', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:10:41.959627', '2018-05-16 22:10:41.959627', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (552, 'RED SOCIAL DE FAMILIAS LORENCEÑAS LAS GAVIOTAS', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:11:21.613783', '2018-05-16 22:11:21.613783', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (553, 'ESCUELA AGROAMBIENTAL SEMBRADORES DE VIDA Y LIBERTAD', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:11:52.971942', '2018-05-16 22:11:52.971942', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (554, 'ESCUELA AMBIENTAL SOÑANDO NUEVO FUTURO', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:12:15.184981', '2018-05-16 22:12:15.184981', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (555, 'COORDINACIÓN DE MUJERES SAMPABLEÑAS (CABECERA MUNICIPAL)', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:14:18.701908', '2018-05-16 22:14:18.701908', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (556, 'ESCUELA AGROAMBIENTAL VILLANUEVA (VILLANUEVA)', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:14:53.598686', '2018-05-16 22:14:53.598686', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (557, 'ESCUELA AGROAMBIENTAL EL HELECHAL (EL HELECHAL)', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:15:19.671476', '2018-05-16 22:15:19.671476', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (558, 'ASOCIACIÓN AGROAMBIENTAL Y CULTURAL DE TAMINANGO . ASACT', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-16', NULL, '2018-05-16 22:15:48.736994', '2018-05-17 21:03:14.575026', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (559, 'COLECTIVO DE MUJERES AL DERECHO. COLEMAD', 'Luz Estella Romero', 'Directora', 'luzestellaromero@colectivomujeresalderecho.org', '3176671062', '', '3176671062', 'Clle 40 #44-39 Oficina 8H. Edificio Cámara de Comercio Barranquilla-Colombia', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 15:59:14.721045', '2018-05-17 15:59:14.721045', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (560, 'ORGANIZACIONES DE POBLACIÓN DESPLAZADAS, CAMPESINAS Y ÉTNICAS DE LOS MONTES DE MARÍA. OPDS', 'Jairo Barreto', 'Miembro - Líder', 'jaibalopez@hotmail.com', '3126754939', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 16:25:40.444701', '2018-05-17 16:25:40.444701', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (561, 'CENTRO DE ESTUDIOS DE DERECHO, JUSTICIA Y SOCIEDAD. DEJUSTICIA', 'Irina Junieles', 'Investigadora Región Caribe', 'ijunieles@dejusticia.org', '3157602722', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 16:29:32.619584', '2018-05-17 16:29:32.619584', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (562, 'ORGANIZACIÓN DE NACIONES UNIDAS PARA LA ALIMENTACIÓN Y LA AGRICULTURA. FAO. OFICINA CARIBE', 'Blanca Florián ', 'Coordinadora Técnica. Enlace Territorial de Paz Zona Norte', 'blanca.florian@fao.org.co ', '3145890163', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 16:34:06.597715', '2018-05-17 16:34:06.597715', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (563, 'ORGANIZACIÓN DE NACIONES UNIDAS PARA LA ALIMENTACIÓN Y LA AGRICULTURA. FAO COLOMBIA', 'Dora Aya', 'Enlace sociedad civil', 'dora.aya@fao.org.co', '', '', '3002897488', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 16:36:47.643888', '2018-05-17 16:36:47.643888', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (564, 'LUTHERAN WORLD RELIEF', 'Mayra Mosquera', 'Coordinadora STAA. ', 'mmosquera@lwr.org', '+51 245-1415', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 16:48:09.031709', '2018-05-17 16:48:09.031709', 3);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (565, 'OBSERVATORIO DE TERRITORIOS ÉTNICOS Y CAMPESINOS. OTEC. UNIVERSIDAD JAVERIANA.', 'Johana Herrera', 'Profesora - investigadora', 'herrera.johana@javeriana.edu.co ', '3168317331', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 16:54:00.561247', '2018-05-17 16:54:00.561247', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (566, 'ESTRATEGIA COLABORATIVA POR LA GARANTÍA A LOS DERECHOS A LA TIERRA Y AL TERRITORIO. ENI/COLOMBIA', 'Federico Giraldo', 'Facilitador ENI COLOMBIA', 'enicolombiano@gmail.com', '3124375259', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 16:56:33.726214', '2018-05-17 16:56:33.726214', 2);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (567, 'AGENCIA DE RENOVACIÓN DEL TERRITORIO REGIONAL SUR DE CÓRDOBA. ART SUR DE CÓRDOBA', 'Ladys Noble', 'Gerente Territorial', 'ladys.noble@renovacionterritorio.gov.co', '', '', '3012840021', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 20:07:00.215062', '2018-05-17 20:07:00.215062', 4);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (568, 'RESGUARDO DOCHAMA EN CONSTITUCIÓN', 'Gabriel Domicó', 'Cabildo Gobernador', 'gabril3131@hotmail.com', '', '', '3147993891', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 20:11:12.414723', '2018-05-17 20:11:12.414723', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (569, 'COCINERAS ANCESTRALES', '', '', '', '', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 21:10:24.402012', '2018-05-17 21:10:24.402012', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (570, 'CENTRO ETNOEDUCATIVO DE ATSHINTUJKUA', 'Hector mindola', 'Rector', '', '', '', '', '', NULL, NULL, '', '2018-05-17', NULL, '2018-05-17 21:12:46.831448', '2018-05-17 21:12:46.831448', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (571, 'CABILDO INDÍGENA ZENÚ “TIERRA SANTA” DE LA APARTADA ADSCRITO AL RESGUARDO INDÍGENA ZENÚ DEL ALTO SAN JORGE', 'Jemima Chica', 'Cacica', '', '', '', '3128528817', '', NULL, NULL, '', '2018-05-21', NULL, '2018-05-21 22:30:43.629673', '2018-05-22 14:15:30.327624', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (572, 'RESGUARDO INDÍGENA ZENÚ DEL ALTO SAN JORGE', 'Rafael Flores', 'Cacique', '', '', '', '3213956950', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:30:17.973312', '2018-05-22 15:03:44.926103', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (573, 'ASOCIACIÓN DE CAMPESINOS Y AGRICULTORES DEL PREDIO EL QUINDÍO. ASCADEQ', 'German Agamez', '', '', '', '', '3136633754', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:34:54.154956', '2018-05-22 14:34:54.154956', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (574, 'ASOCIACIÓN DE DESPLAZADOS UNIDOS PARA UN FUTURO MEJOR DE LAS CATAS. ASODEUFUM', 'Avinael Lozano', '', '', '', '', '3217006843', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:36:32.018311', '2018-05-22 14:36:32.018311', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (575, 'ASOCIACIÓN DE DESPLAZADOS DEL PARQUE PARAMILLO SECTOR MANSO SINÚ. ASODESPAP', 'Rogeres Higuita', 'Líder', 'sinuurra1112roger@gmail.com', '', '', '3113877626', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:39:07.144807', '2018-05-22 14:39:07.144807', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (576, 'ASOCIACIÓN DE PESCADORES CAMPESINOS, INDÍGENAS Y AFRODESCENDIENTES PARA EL DESARROLLO COMUNITARIO DE LA CIÉNAGA GRANDE DEL BAJO SINÚ. ASPROCIG', 'Candelario Álvarez', 'Líder', '', '', '', '3145675412', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:41:55.579079', '2018-05-22 14:41:55.579079', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (577, 'ASOCIACIÓN DE MUJERES LA ESMERALDA', 'Nohora Villegas', 'Líder', '', '', '', '3126904475', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:46:57.540299', '2018-05-22 14:46:57.540299', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (578, 'COOPERATIVA DE MUJERES DEL VALLE ENCANTADO', 'María Zabala ', 'Líder', '', '', '', '3135804791', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:48:31.096937', '2018-05-22 14:48:31.096937', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (579, 'RED AGROECOLÓGICA DEL CARIBE. RECAR', 'Yina Ortega', '', '', '', '', '3135418705', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 14:58:06.808232', '2018-05-22 14:58:06.808232', 1);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (580, 'ASOCIACIÓN DE PARCELEROS VÍCTIMAS DEL PREDIO COSTA DE ORO', 'Jose Orlando', '', '', '', '', '314 5508414', '', NULL, NULL, '', '2018-05-22', NULL, '2018-05-22 15:01:53.681353', '2018-05-22 15:01:53.681353', 1);


--
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actor_id_seq', 580, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: areaestudios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'CIENCIAS SOCIALES', '', '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-20 19:14:05.958152');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INGENIERÍA', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'TÉCNICO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'CIENCIAS ADMINISTRATIVAS', '', '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-20 19:50:56.150502');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'CIENCIAS BÁSICAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CIENCIAS COMUNICATIVAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'CIENCIAS CONTABLES', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CIENCIAS EXACTAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'CIENCIAS ECONÓMICAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CIENCIAS EDUCATIVAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'CIENCIAS JURÍDICAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');


--
-- Name: areaestudios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('areaestudios_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: cajacompensacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'CAFAM', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'COLSUBSIDIO', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'COMPENSAR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: cajacompensacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cajacompensacion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'ASESOR AUXILIAR 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'PROFESIONAL 1', '', '2016-04-22', '2018-04-16', '2016-04-22 16:37:42.454072', '2016-04-22 16:37:42.454072');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'PROFESIONAL 2', '', '2016-05-17', '2018-04-16', '2016-05-17 20:46:54.205211', '2016-05-17 20:46:54.205211');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'ASESOR/A', '', '2016-08-09', NULL, '2016-08-09 19:20:15.125164', '2016-08-09 19:20:15.125164');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'ASISTENTE CONTABLE', '', '2016-08-09', NULL, '2016-08-09 19:51:56.682372', '2016-08-09 19:51:56.682372');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'ASISTENTE LOGÍSTICO', '', '2016-08-09', NULL, '2016-08-09 19:52:13.317422', '2016-08-09 19:52:13.317422');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'DOCENTE', '', '2016-11-23', NULL, '2016-11-23 19:52:07.74931', '2016-11-23 19:52:07.74931');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'TUTOR', '', '2016-11-23', NULL, '2016-11-23 19:52:19.350663', '2016-11-23 19:52:19.350663');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'PROFESIONAL 3', '', '2016-12-03', '2018-04-16', '2016-12-03 23:30:23.278065', '2016-12-03 23:30:23.278065');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'PROFESIONAL 4', '', '2016-12-03', '2018-04-16', '2016-12-03 23:30:35.784771', '2016-12-03 23:30:35.784771');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ASESOR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (110, 'PROFESIONAL 5', '', '2016-12-03', '2018-04-16', '2016-12-03 23:30:48.208192', '2016-12-03 23:30:48.208192');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (111, 'ASISTENTE 1', '', '2017-03-02', '2018-04-16', '2017-03-02 17:25:07.237839', '2017-03-02 17:25:07.237839');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (112, 'ASISTENTE 2', '', '2017-03-02', '2018-04-16', '2017-03-02 17:25:35.567871', '2017-03-02 17:25:35.567871');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (113, 'ASISTENTE 3', '', '2017-03-02', '2018-04-16', '2017-03-02 17:25:53.253494', '2017-03-02 17:25:53.253494');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (114, 'ASISTENTE 4', '', '2017-03-02', '2018-04-16', '2017-03-02 17:26:08.903612', '2017-03-02 17:26:08.903612');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (115, 'ASISTENTE 5', '', '2017-03-02', '2018-04-16', '2017-03-02 17:26:22.90822', '2017-03-02 17:26:22.90822');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (116, 'PASANTE', '', '2018-04-23', NULL, '2018-04-23 14:33:01.187561', '2018-04-23 14:33:01.187561');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (117, 'APRENDIZ', '', '2018-04-26', NULL, '2018-04-26 13:49:28.730554', '2018-04-26 13:49:28.730554');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (118, 'ASESORA PEDAGOGICA', '', '2018-04-26', NULL, '2018-04-26 16:16:10.849808', '2018-04-26 16:16:10.849808');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (119, 'VOLUNTARIO', '', '2018-04-26', NULL, '2018-04-26 17:27:31.942551', '2018-04-26 17:27:31.942551');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ASESOR JUNIOR DE INF. POLITICA Y PEDAG.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (120, 'ASISTENTE DE COMUNICACION DIGITAL Y ORGANIZACIONAL', '', '2018-04-26', NULL, '2018-04-26 19:00:53.047695', '2018-04-26 19:00:53.047695');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (121, 'GESTOR TERRITORIAL', '', '2018-04-26', NULL, '2018-04-26 19:54:13.544825', '2018-04-26 19:54:13.544825');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'ASESORA ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ASESORA ASISTENTE EN PUBLICACIONES', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'ASESORA EN COMUNICACIÓN ORG.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'ASISTENTE DE  GESTION HUMANA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'ASISTENTE DE INVESTIGACION', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'ASISTENTE DE PRODUCCION RADIAL', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'ASISTENTE DE PROYECTOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'ASISTENTE DE RECURSOS FISICOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'AUXILIAR 1 ARCHIVO DE PRENSA B.D.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'AUXILIAR DE ARCHIVO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'AUXILIAR DE BIBLIOTECA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'AUXILIAR CONTABLE', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-26 13:48:42.584294');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'AUXILIAR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'CONTADOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'CONTADORA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'CONTRATISTA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'COORDINADOR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'INVESTIGADOR', '', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-04-22 16:37:01.088463');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'COORDINADORA DE PUBLICACIONES', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'COORDINADORA PEDAGOGICA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'DIRECTOR GENERAL', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'GERENTE ADMINISTRATIVA Y FINANCIERA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'GERENTE DE PROYECTOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'INVESTIGADOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'INVESTIGADOR ASISTENTE 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'INVESTIGADOR AUXILIAR 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'INVESTIGADOR AUXILIAR 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (39, 'INVESTIGADOR JUNIOR', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ANALISTA', 'x', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-03-31 00:43:14.525044');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (40, 'INVESTIGADOR JUNIOR', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (41, 'MENSAJERO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (42, 'OFICIAL DE PROYECTOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (43, 'SUBDIRECTOR GENERAL', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (44, 'TECNOLOGO EN SISTEMAS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (45, 'TESORERA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ANALISTA DE PRENSA', 'http://empleoscolombianos.blogspot.com.co/2013/12/el-cinep-programa-por-la-paz-abre.html', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'PROFESIONAL EN CIENCIAS JURÍDICAS', 'http://empleoscolombianos.blogspot.com.co/2013/07/el-cinep-programa-por-la-paz-colombia.html', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-07-18 20:18:14.093914');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'OTRO', NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'ASESOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'ASESOR AUXILIAR 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cargo_id_seq', 121, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: empresaps; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'COMPENSAR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'COOMEVA', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FAMISANAR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'NUEVA EPS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SALUD TOTAL', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'SANITAS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'SURA', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: empresaps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('empresaps_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: fondopensiones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'COLFONDOS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'OLD MUTUAL', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'PORVENIR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'PROTECCIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: fondopensiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fondopensiones_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: nivelrelacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ACTOR DE SENTIDO', 'Trabajamos para ellos misionalmente, son beneficiarios', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ACTOR DE MISIÓN', 'Trabajamos con ellos como pares para lo misional', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACTOR ESTRATÉGICO', 'Pueden financiarnos o nos ayudan en incidencia', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-06 16:23:44.775827');
INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ACTOR DE INCIDENCIA', 'En quienes queremos influir para la toma de decisiones.  Falta limitar si solo es incidencia política,  o si por ejemplo lograr publicación en medios masivos también se considera.  Si solo es inicidencia política sobra sector formula política pública.', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-06 16:54:50.275062');


--
-- Name: nivelrelacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('nivelrelacion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: niveleducacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'LICENCIATURA', '', '2018-04-26', NULL, '2018-04-26 13:25:24.372703', '2018-04-26 13:25:24.372703');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'BACHILLER', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'DOCTORADO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ESPECIALIZACION', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ESTUDIANTE', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'MAESTRIA', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PREGRADO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'TECNICO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'TECNOLOGO ', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');


--
-- Name: niveleducacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('niveleducacion_id_seq', 101, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: nucleoconflicto; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO nucleoconflicto (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CULTURAS POLÍTICAS, IDENTIDADES Y DD-HH', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO nucleoconflicto (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'RELACIONES ESTADO Y SOCIEDAD', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO nucleoconflicto (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ALTERNATIVAS AL DESARROLLO REGIONAL', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: nucleoconflicto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('nucleoconflicto_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: perfilprofesional; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'PROFESIONAL 4', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'CONTRATISTA', '', '2018-04-26', NULL, '2018-04-26 13:30:06.761125', '2018-04-26 13:30:06.761125');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'PRACTICANTE', '', '2018-04-26', NULL, '2018-04-26 13:32:10.86939', '2018-04-26 13:34:44.476997');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'ESTUDIANTE', '', '2018-04-26', NULL, '2018-04-26 13:35:04.235253', '2018-04-26 13:35:04.235253');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'VOLUNTARIO', '', '2018-04-26', NULL, '2018-04-26 17:27:51.312572', '2018-04-26 17:27:51.312572');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'PROFESIONAL 5', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ASISTENTE 1', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:10.969263');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ASISTENTE 2', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:26.107431');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ASISTENTE 3', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:41.292283');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ASISTENTE 4', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:52.443688');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ASISTENTE 5', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:43:03.671981');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PROFESIONAL 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'PROFESIONAL 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'PROFESIONAL 3', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: perfilprofesional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('perfilprofesional_id_seq', 104, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: procesogh; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');
INSERT INTO procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'APOYO', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');
INSERT INTO procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'OPERATIVO', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');
INSERT INTO procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'DIRECTIVO', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');


--
-- Name: procesogh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('procesogh_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: profesion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'DERECHOS HUMANOS', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'DISEÑADORA GRAFICA', '', 1, '2018-04-26', NULL, '2018-04-26 13:30:46.69892', '2018-04-26 13:30:46.69892');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'AGRONOMA', '', 1, '2018-04-26', NULL, '2018-04-26 13:31:01.637064', '2018-04-26 13:31:01.637064');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'ESTUDIANTE DE FILOSOFIA', '', 1, '2018-04-26', NULL, '2018-04-26 16:56:30.797702', '2018-04-26 16:56:30.797702');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'CONTABILIDAD Y FINANZAS', '', 1, '2018-04-26', NULL, '2018-04-26 17:35:42.925583', '2018-04-26 17:35:42.925583');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'DISEÑADOR INDUSTRIAL', NULL, 11, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ECONOMISTA', NULL, 7, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'ESTUDIANTE CIENCIA DE LA INFORMACION  BIBLIOTECOLOGIA', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ESTUDIANTE DE ADMINISTRACION DE EMPRESAS', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'ESTUDIANTE DE COMERCIO INTERNACIONAL', NULL, 7, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'ESTUDIANTE DE COMUNICACIÓN', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'ESTUDIANTE DE HISTORIA', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'FILOSOFO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'TEOLOGO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ABOGADO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'GOBIERNO Y RELACIONES INTERNACIONALES', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'HISTORIADOR/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'INGENIERO/A DE SISTEMAS ', NULL, 11, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'INGENIERIA FINANCIERA', NULL, 7, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'LICENCIADO/A EN EDUCACION BASICA', NULL, 8, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'LICENCIADO/A EN MATEMATICAS Y FISICA', NULL, 8, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'LICENCIADO/A EN FILOSOFIA Y CIENCIAS RELIGIOSAS', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'MATEMATICO/A', NULL, 6, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'PERIODISMO', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ADMINISTRADOR/A PUBLICO', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'POLITOLOGO/A', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'SOCIOLOGO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'TECNICO EN ASISTENCIA EN ORGANIZACIÓN DE ARCHIVOS', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'TECNICO/A EN PERIODISMO', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'TECNOLOGO/A EN SISTEMAS', NULL, 12, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'TRABAJADOR/A SOCIAL', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'ESTUDIANTE DE CONTADURIA PUBLICA', NULL, 5, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'ZOOTECNISTA', NULL, 3, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ANTROPOLOGO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ASISTENCIA EN ORGANIZACIÓN DE ARCHIVOS', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'BACHILLER', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'COMUNICADOR/A SOCIAL', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CONTADOR/A PUBLICO', NULL, 5, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'CONTADOR/A TECNICO', NULL, 5, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');


--
-- Name: profesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('profesion_id_seq', 104, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: publicacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'NOCHE Y NIEBLA 50', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'NOCHE Y NIEBLA 49', '', '2015-07-06', NULL, '2015-07-06 16:30:08.347567', '2015-07-06 16:30:08.347567');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'NOCHE Y NIEBLA 48', '', '2015-07-06', NULL, '2015-07-06 16:30:16.182873', '2015-07-06 16:30:16.182873');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CASO TIPO FALSOS POSITIVOS', '', '2011-06-15', NULL, '2015-07-06 16:30:48.591082', '2015-07-06 16:31:08.88526');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'FOLLETO VOCES DE LA MEMORIA ', '', '2015-07-06', NULL, '2015-07-06 17:00:42.371682', '2015-07-06 17:00:42.371682');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'SIVEL BANCO DE DATOS', '', '2015-07-08', NULL, '2015-07-08 14:23:57.634467', '2015-07-08 14:23:57.634467');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'SISTEMA DE INFORMACIÓN PARA SEGUIMIENTO DE ACTIVIDADES DEL BANCO DE DATOS', '', '2015-07-08', NULL, '2015-07-08 14:24:24.397846', '2015-07-08 14:24:24.397846');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'ADJ BANCO DE DATOS', '', '2015-07-12', NULL, '2015-07-12 16:23:57.527215', '2015-07-12 17:22:53.439711');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIO', 'EL PRESENTE DOCUMENTO CONTIENE EL DESARROLLO TEMÁTICO DEL PRIMER TALLER DE FORMACIÓN DE NUEVOS LIDERAZGOS EN LA  SUBREGIÓN DEL BAJO ATRATO DEL EQUIPO CHOCÓ DEL CINEP-PROGRAMA POR LA PAZ. EN ESTE PRIMER MÓDULO, SE TRATARÁ EL TEMA  DE LEGISLACIÓN TERRITORIAL, NO SIN ANTES ECHAR UN VISTAZO A CONCEPTOS PREVIOS Y BÁSICOS PARA UN ADECUADO MANEJO DEL TEMA COMO: DERECHOS HUMANOS, DERECHOS  FUNDAMENTALES, CONSTITUCIÓN Y TIPOS DE NORMAS, QUE SON BASE PARA PODER  ENTENDER LA LEGISLACIÓN TERRITORIAL ACTUAL, SU SENTIDO Y SU ALCANCE.  A SU VEZ, SE BUSCA QUE EL TALLER NO SÓLO SIRVA PARA TRANSMITIR UN CONOCIMIENTO, SINO QUE LOS PARTICIPANTES LO ASUMAN DE UNA MANERA ANALÍTICA Y CRÍTICA. ES DECIR, QUE NO SE CONFORMEN CON SABER QUÉ DICE LA LEY, SINO QUE SEAN CAPACES DE CRITICARLA Y PROPONER ALTERNATIVAS DE ACUERDO CON SUS DINÁMICAS Y NECESIDADES COMUNITARIAS.  EL PROCESO DE FORMACIÓN QUE BRINDA EL TALLER ES INTEGRAL: SE RELACIONA CON EL ENTORNO SOCIAL COTIDIANO Y SE APOYA EN LA FORMACIÓN PERSONAL DE LOS PARTICIPANTES. ADEMÁS, BUSCA GENERAR CRÍTICA Y AUTOCRÍTICA, FORTALECIMIENTO ORGANIZATIVO, ASÍ COMO CONOCIMIENTO Y SENSIBILIZACIÓN PARA EMPRENDER LA EXIGIBILIDAD DE LOS DERECHOS. LA PUBLICACIÓN CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIOPRETENDE DAR CUENTA DEL DESARROLLO TEMÁTICO DEL PRIMER TALLER, ASÍ COMO BRINDAR HERRAMIENTAS PARA QUE LOS PARTICIPANTES, COMO NUEVOS LÍDERES Y LIDERESAS QUE SERÁN, PUEDAN REPLICAR LO APRENDIDO EN SUS COMUNIDADES. ', '2015-12-07', NULL, '2015-12-07 18:04:33.682198', '2017-11-22 00:55:09.527622');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'NOCHE Y NIEBLA 52', '', '2016-03-11', NULL, '2016-03-11 13:46:57.777308', '2016-03-11 13:47:21.298207');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (110, 'CUADERNO DE TRABAJO 1 "MUJERES VÍCTIMAS Y APROXIMACIÓN VIVENCIAL AL ENFOQUE DE GÉNERO"', 'Cuaderno de trabajo para formación y capacitación interna.', '2016-03-11', NULL, '2016-03-11 13:50:20.767632', '2016-03-11 13:50:20.767632');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (111, 'PÁGINA WEB WWW.NOCHEYNIEBLA.ORG', '', '2016-03-11', NULL, '2016-03-11 13:51:08.053337', '2016-03-11 13:51:08.053337');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (112, 'NOCHE Y NIEBLA 53', 'La revista Noche y Niebla corresponde al periodo enero junio de 2016. En circulación a partir de agosto de 2016', '2016-07-27', NULL, '2016-07-27 15:21:43.111949', '2016-07-27 15:21:43.111949');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (113, 'NOCHE Y NIEBLA 54', '', '2017-12-06', NULL, '2017-12-06 13:55:35.186569', '2017-12-06 13:55:35.186569');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (114, 'NOCHE Y NIEBLA 55', '', '2017-12-06', NULL, '2017-12-06 13:56:01.884361', '2017-12-06 13:56:01.884361');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (115, 'CONTROVERSIA N.° 204. DOSSIER CIUDADANÍA EN MOVIMIENTO (JUNIO 2015)', 'Revista', '2017-06-06', NULL, '2017-12-11 19:31:57.284963', '2017-12-11 19:34:01.582471');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (116, 'CONSTRUCCIÓN DE PAZ INTEGRAL', 'Cartilla ', '2017-06-08', NULL, '2017-12-11 19:32:27.322442', '2017-12-11 19:34:14.480412');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (117, 'ENFOQUE DE GÉNERO', 'Cartilla', '2017-06-09', NULL, '2017-12-11 19:32:44.800287', '2017-12-11 19:34:25.137064');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (118, 'EXIGIBILIDAD DE DERECHOS Y PARTICIPACIÓN POLÍTICA', 'Cartilla', '2017-06-13', NULL, '2017-12-11 19:32:57.170121', '2017-12-11 19:35:30.840991');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (119, 'TRANSICIONES POLÍTICAS PARA EL POSCONFLICTO. ¿DE PROCESOS PARTICIPATIVOS A RESULTADOS INCLUYENTES EN MATERIA DE CONSTRUCCIÓN DE ESTADO Y GOBERNANZA?', 'Libro', '2017-06-15', NULL, '2017-12-11 19:33:17.37446', '2017-12-11 19:35:47.394278');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (120, 'EL CESE BILATERAL: MÁS ALLÁ DEL FUEGO', 'Informe', '2017-07-04', NULL, '2017-12-11 19:33:37.179486', '2017-12-11 19:33:48.262365');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (121, 'RECOMENDACIÓN GENERAL NO. 34 SOBRE LOS DERECHOS DE LAS MUJERES RURALES', 'Informe', '2017-09-01', NULL, '2017-12-11 19:36:22.011099', '2017-12-11 19:36:30.62753');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (122, 'MUJERES Y RURALIDAD EN BOGOTÁ', 'Cartilla', '2017-10-02', NULL, '2017-12-11 19:36:49.841671', '2017-12-11 19:36:56.661109');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (123, 'LA SITUACIÓN DE LAS MUJERES RURALES EN PERÚ', 'Informe', '2017-10-04', NULL, '2017-12-11 19:37:24.329731', '2017-12-11 19:37:30.605128');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (124, 'MUJERES RURALES EN NICARAGUA: ENTRE HETEROGENEIDAD, CONTINUIDAD Y CAMBIOS', 'Informe', '2017-10-06', NULL, '2017-12-11 19:38:41.400699', '2017-12-11 19:39:00.542143');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (125, 'SITUACIÓN GENERAL DE LAS MUJERES RURALES E INDÍGENAS EN MÉXICO', 'Informe', '2017-10-07', NULL, '2017-12-11 19:39:16.230365', '2017-12-11 19:39:20.754459');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (126, 'MUJERES RURALES EN EL CHACO ARGENTINO', 'Informe', '2017-10-08', NULL, '2017-12-11 19:39:38.144244', '2017-12-11 19:39:45.294997');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (127, 'LAS MUJERES RURALES EN ECUADOR', 'Informe', '2017-10-09', NULL, '2017-12-11 19:39:56.627673', '2017-12-11 19:40:09.255242');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (128, 'LAS MUJERES RURALES EN GUATEMALA', 'Informe', '2017-10-11', NULL, '2017-12-11 19:40:22.247376', '2017-12-11 19:40:31.186536');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (129, 'AGENCIA DE NOTICIAS DE MUJERES INDÍGENAS Y AFRODESCENDIENTES', 'Cartilla', '2017-10-12', NULL, '2017-12-11 19:40:48.674324', '2017-12-11 19:41:15.875157');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (130, 'MESA DE INCIDENCIA POLÍTICA DE LAS MUJERES RURALES COLOMBIANAS', 'Cartilla', '2017-10-13', NULL, '2017-12-11 19:41:28.263665', '2017-12-11 19:41:34.177892');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (131, 'ALIANZA DE MUJERES POR EL ACCESO A LA TIERRA Y MEDIOS DE PRODUCCIÓN (GUATEMALA)', 'Cartilla', '2017-10-14', NULL, '2017-12-11 19:41:45.328714', '2017-12-11 19:41:50.809264');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (132, 'RESUMEN EJECUTIVO: PANORAMA DE VIOLACIONES AL DERECHO A LA VIDA, LIBERTAD E INTEGRIDAD DE LÍDERES SOCIALES Y DEFENSORES DE DD.HH.', 'Informe', '2017-10-14', NULL, '2017-12-11 19:42:08.844162', '2017-12-11 19:42:14.213262');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (133, 'PANORAMA DE VIOLACIONES AL DERECHO A LA VIDA, LIBERTAD E INTEGRIDAD DE LÍDERES SOCIALES Y DEFENSORES DE DD.HH( 2016 Y PRIMER SEMESTRE DE 2017)', 'Informe', '2017-10-15', NULL, '2017-12-11 19:42:34.481534', '2017-12-11 19:42:41.511492');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (134, 'NOCHE Y NIEBLA NO. 55', 'Revista ', '2017-10-17', NULL, '2017-12-11 19:42:58.836388', '2017-12-11 19:43:04.480154');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (135, 'HISTORIAS DE VIDA', 'Cartillas con caja contenedora', '2017-10-18', NULL, '2017-12-11 19:43:26.240175', '2017-12-11 19:43:34.875142');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (136, 'INFORME: TUMACO ¿VÍCTIMA DE QUIÉN?', 'Informe', '2017-11-01', NULL, '2017-12-11 19:44:01.336813', '2017-12-11 19:44:08.79849');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (137, 'CONTROVERSIA N.° 205. DOSSIER INTERCULTURALIDAD, CONVIVENCIAS Y GOBERNANZAS TERRITORIALES (DICIEMBRE 2015)', 'Revista', '2017-12-07', NULL, '2017-12-11 19:44:27.430707', '2017-12-11 19:45:03.948884');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (138, 'CIEN DÍAS VISTOS POR CINEP N.° 91: EL CONFLICTO DESPUÉS DE LOS FUSILES', 'Revista', '2017-12-08', NULL, '2017-12-11 19:45:28.110106', '2017-12-11 19:45:34.661222');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (139, 'DEL OTRO LADO DE LA MURALLA', 'Libro', '2017-12-11', NULL, '2017-12-11 19:46:01.542126', '2017-12-11 19:46:01.542126');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (140, 'DESPOJAR Y DESPLAZAR: ESTRATEGIA PARA EL DESARROLLO DE LA ORINOQUÍA', 'Informe ', '2017-12-11', NULL, '2017-12-11 19:46:43.522074', '2017-12-11 19:46:43.522074');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (141, 'LA GENTE DE LA MACARENA. COLONOS, CAMPESINOS E INSTITUCIONALIDAD LOCAL EN LA CONFIGURACIÓN SOCIAL DEL TERRITORIO', 'Libro', '2018-05-10', NULL, '2018-05-10 15:34:55.525964', '2018-05-10 15:34:55.525964');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'NOCHE Y NIEBLA 51', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'CASO TIPO TRUJILLO', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('publicacion_id_seq', 141, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: redactor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'RED PRODEPAZ', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'INTERNATIONAL COALITION FOR THE RESPONSABILITY  TO PROTECT', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'MESA DE TRABAJO SOBRE PNI Y EXHUMACIONES HUMANITARIAS EN COLOMBIA', 'Es un espacio informal que ha surgido como consecuencia de la Audiencia del 19 de juilio de 2010 en La Macarena (Meta) y luego con el proceso de exhumaciones humanitarias adelantada en Charras Guaviare en septiembre de 2013 y enero de 2014', '2015-07-02', NULL, '2015-07-02 14:16:57.350316', '2015-07-02 14:16:57.350316');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'RED DE BANCOS DE DATOS', '', '2015-07-06', NULL, '2015-07-06 19:43:05.67861', '2015-07-06 19:43:05.67861');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'COORDINACION REGIONAL DEL PACIFICO-CRPC', '', '2016-04-28', NULL, '2016-04-28 15:36:23.15526', '2016-04-28 15:36:23.15526');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INTERNATIONAL LAND COALITION', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ASOCIACIÓN LATINOAMERICANA DE ORGANIZACIONES DE PROMOCIÓN AL DESARROLLO A.C', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'CONSEJO LATINOAMERICANO  DE CIENCIAS SOCIALES', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'NO APLICA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'OTRA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (150, 'MESA SOCIAL POR LA PAZ', NULL, '2017-03-31', NULL, '2017-03-31 00:00:00', '2017-03-31 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (151, 'PAZ COMPLETA', NULL, '2017-03-31', NULL, '2017-03-31 00:00:00', '2017-03-31 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (152, 'MEDIATION SUPORT NETWORK ', NULL, '2017-03-31', NULL, '2017-03-31 00:00:00', '2017-03-31 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'COORDINACIÓN EUROPA-ESTADOS UNIDOS', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ALIANZA POST-LONDRES', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'RED DE ONG POR LA TRANSPARENCIA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'MESA AMBIENTAL DE LOS CERROS ORIENTALES  BOGOTÁ', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SINERGIA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'VIVA LA CIUDADANÍA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'INSTITUTO INTERAMERICANO DE DERECHOS HUMANOS', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'RED DE CENTROS SOCIALES DE LA COMPAÑÍA DE JESÚS EN AMERICA LATINA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: redactor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('redactor_id_seq', 152, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: regiongrupo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'CARIBE (QUINQUENAL 2018-2022)', 'Plan quinquenal 2018-2022', NULL, '2017-10-25', NULL, '2017-10-25 00:00:00', '2017-11-01 00:17:52.406408');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'FRONTERA COLOMBO VENEZOLANA (QUINQUENAL 2018-2022)', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 12:54:14.72199', '2017-11-01 00:18:15.827777');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'MAGDALENA MEDIO (QUINQUENAL 2018-2022)', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 12:56:30.833328', '2017-11-01 00:18:37.475643');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'ANDINA (QUINQUENAL 2018-2022)', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:00:07.044693', '2017-11-01 00:17:09.86959');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'BOGOTA Y ALREDEDORES (QUINQUENAL 2018-2022)', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:01:14.728238', '2017-11-01 00:17:37.452769');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'ANDÉN PACÍFICO (QUINQUENAL 2018-2022)', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:02:18.195017', '2017-11-01 00:17:25.143223');


--
-- Name: regiongrupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('regiongrupo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: sectorapc; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'ENTES UNIVERSITARIOS AUTÓNOMOS', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ESTADÍSTICAS', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'FUNCIÓN PÚBLICA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'HACIENDA Y CRÉDITO PÚBLICO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'INCLUSIÓN SOCIAL Y RECONCILIACIÓN', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'INTELIGENCIA ESTRATÉGICA Y CONTRAINTELIGENCIA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'INTERIOR', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'JUSTICIA Y DEL DERECHO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'MINAS Y ENERGÍA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'ORGANISMOS AUTÓNOMOS', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'AGRICULTURA Y DESARROLLO RURAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'ORGANISMOS DE CONTROL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'ORGANIZACIÓN ELECTORAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'PLANEACIÓN', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'PRESIDENCIA DE LA REPÚBLICA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'PROTECCIÓN SOCIAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'RAMA JUDICIAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'RAMA LEGISLATIVA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'RELACIONES EXTERIORES', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'SALUD Y PROTECCIÓN SOCIAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'TRANSPORTE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'AMBIENTE Y DESARROLLO SOSTENIBLE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'VIVIENDA CIUDAD Y TERRITORIO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CIENCIA, TECNOLOGÍA E INNOVACIÓN, COMERCIO, INDUSTRIA Y TURISMO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'CORPORACIONES AUTÓNOMAS REGIONALES Y DE DESARROLLO SOSTENIBLE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CULTURA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'DEFENSA NACIONAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'DEPORTE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'EDUCACIÓN NACIONAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');


--
-- Name: sectorapc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sectorapc_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: tipoanexo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'INFORME NARRATIVO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-18 00:00:00');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'PUBLICACIÓN', 'Publicación que es resultado de proyecto.', '2016-08-29', NULL, '2016-08-29 16:04:04.281782', '2016-08-29 16:04:04.281782');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'PROYECTO APROBADO', '', '2018-05-07', NULL, '2018-05-07 20:58:30.967071', '2018-05-07 20:58:30.967071');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CONVENIO', '', '2018-05-07', NULL, '2018-05-07 20:58:50.907941', '2018-05-07 20:58:50.907941');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'CONTRATO', '', '2018-05-07', NULL, '2018-05-07 20:59:00.56765', '2018-05-07 20:59:00.56765');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'ANEXO PROCEDIMIENTOS Y REQUISITOS', '', '2018-05-07', NULL, '2018-05-07 21:01:21.87277', '2018-05-07 21:01:21.87277');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'ADENDA', '', '2018-05-07', NULL, '2018-05-07 21:02:25.89866', '2018-05-07 21:02:25.89866');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'INFORME FINANCIERO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACUSE DE RECIBIDO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FORMATO DE SOLICITUD', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'OTRO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');


--
-- Name: tipoanexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipoanexo_id_seq', 107, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: tipocontrato; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 1);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (2, 'CONTRATO DE APRENDIZAJE', '', '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-20 17:12:14.736184', 2);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (3, 'CONTRATO HONORARIOS', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 3);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (4, 'CONTRATO LABORAL  T. FIJO', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (5, 'CONTRATO LABORAL  T. FIJO  1/2 T.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (6, 'CONTRATO LABORAL  T. INDF.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (7, 'CONVENIO INTERINST.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 5);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (8, 'CONVENIO PASANTIA', '', '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-23 14:34:24.213114', 2);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (9, 'CONVENIO VOLUNTARIADO', '', '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-26 17:21:22.437722', 5);


--
-- Name: tipocontrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipocontrato_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: tipoconvenio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ACTA DE COMPROMISO ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'CONVENIO DE COLABORACIÓN Y MUTUA AYUDA ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'CONVENIO DE COMODATO', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'CONVENIO DE COOPERACIÓN', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'CONVENIO DE DONACIÓN ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'CONVENIO DE OBRA ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'CONVENIO DE PRÁCTICAS', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'CONVENIO ESPECIFÍCO ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'CONVENIO ESPECIFÍCO DE COOPERACIÓN ACADÉMICA', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'CONVENIO ESPECÍFICO PARA EL DESARROLLO DEL CONTRATO DE SUBVENCIÓN ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'CONVENIO MARCO DE COOPERACIÓN ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACUERDO DE ARTICULACIÓN INTERINSTITUCIONAL', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ACUERDO DE COORDINACIÓN Y PPOYO ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ALIANZA DE COLABORACIÓN INTERINSTITUCIONAL ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'CONTRATO DE CESIÓN DE DERECHOS PATRIMONIALES DE AUTOR ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CONTRATO DE COMODATO', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');


--
-- Name: tipoconvenio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipoconvenio_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: tiponomina; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'AUXILIO', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'HONORARIOS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'SALARIO', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'N/A', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: tiponomina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tiponomina_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: tipomoneda; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PESO', 'COP', '$', 170, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'EURO', 'EUR', '€', NULL, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'DÓLAR', 'USD', 'US$', 840, '', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-05-12 19:15:03.691469');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FRANCO SUIZO', 'CHF', 'CHF', 756, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'LIBRA INGLESA', 'GBP', '£', 826, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CORONA SUECA', 'SEK', 'kr', 752, '', '2016-05-13', NULL, '2016-05-13 17:02:06.717417', '2016-05-13 17:02:06.717417');


--
-- Name: tipomoneda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipomoneda_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: tipoproductopf; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'OTRO', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'LIBRO/REVISTA IMPRESO', '', '2017-05-01', NULL, '2017-05-01 00:00:00', '2018-02-19 21:32:19.26011');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'PUBLICACIÓN', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'INFORME', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'REVISTA', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'AUDIOVISUAL', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PROGRAMA RADIAL', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CARTILLA', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'CARPETA PEDAGÓGICA', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');


--
-- Name: tipoproductopf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipoproductopf_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

