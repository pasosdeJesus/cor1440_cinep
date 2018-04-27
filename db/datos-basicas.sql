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

INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-06 16:51:00.701971');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'EMPRESA PRIVADA', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-06 16:46:01.930712');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'RAMA JUDICIAL DE COLOMBIA', '', false, '2015-07-02', '2015-07-06', '2015-07-02 14:10:01.235085', '2015-07-06 16:50:47.590818');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CAMPESINOS', '', true, '2015-07-06', NULL, '2015-07-06 16:42:53.864868', '2015-07-06 16:42:53.864868');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'INDÍGENAS', '', true, '2015-07-06', NULL, '2015-07-06 16:43:06.605376', '2015-07-08 16:10:55.529329');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'AFRO', '', true, '2015-07-06', NULL, '2015-07-06 16:43:21.009592', '2015-07-06 16:43:44.308433');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'LGBT', '', true, '2015-07-06', NULL, '2015-07-06 16:44:09.327762', '2015-07-06 16:44:09.327762');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'TRABAJADORES', '', true, '2015-07-06', NULL, '2015-07-06 16:44:32.688661', '2015-07-06 16:44:32.688661');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'VÍCTIMAS', '', true, '2015-07-06', NULL, '2015-07-06 16:44:47.571089', '2015-07-06 16:44:47.571089');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ORGANIZACIÓN SINDICAL', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:10:05.125165');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (111, 'OTRO', '', true, '2015-07-06', NULL, '2015-07-06 16:45:21.509769', '2015-07-06 16:50:18.019689');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (112, 'ORGANIZACIONES ECLESIALES', '', true, '2015-07-06', NULL, '2015-07-06 16:45:35.839411', '2015-07-06 16:45:35.839411');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (113, 'MUJERES', '', true, '2015-07-06', NULL, '2015-07-06 17:07:38.092972', '2015-07-06 17:07:38.092972');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (114, 'DERECHOS HUMANOS', '', false, '2015-07-09', NULL, '2015-07-09 22:12:59.378821', '2015-07-09 22:12:59.378821');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (115, 'CUERPO DIPLOMÁTICO ACREDITADO EN COLOMBIA', '', false, '2015-07-12', NULL, '2015-07-12 15:23:26.978361', '2015-07-12 15:23:26.978361');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ORGANIZACIÓN ESTUDIANTIL', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:09:53.93648');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'POBLADORES URBANOS', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ESTUDIANTES', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'MEDIOS DE COMUNICACIÓN', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-07-13 21:53:23.234082');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'AGENCIA COOPERANTE/FINANCIADORA', '', false, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-07-06 20:39:28.071497');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'FORMULA POLÍTICAS PÚBLICAS', NULL, NULL, '2018-02-03', '2018-02-03', '2018-02-03 00:00:00', '2018-02-03 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ACADEMIA', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:07:24.511282');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'IGLESIA / ORGANIZACIÓN RELIGIOSA', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:08:58.851788');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ORGANIZACIÓN DE BASE', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:09:27.209828');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'GOBIERNO', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-06 16:46:38.471582');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ONG NACIONAL', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:08:44.924813');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ONG INTERNACIONAL', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:08:35.505098');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'GREMIOS', '', true, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-06 16:46:53.143003');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OBSERVATORIOS DE PROGRAMAS DE PAZ Y DESARROLLO', '', false, '2015-05-21', '2015-07-06', '2015-05-21 00:00:00', '2015-07-08 16:08:23.751062');


--
-- Name: sectoractor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sectoractor_id_seq', 115, true);


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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (102, 'BANCO DE DATOS DEL CINEP', 'Yebrail Alvarez', 'Coordinador', 'lutas@nocheyniebla.org', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, '', '2015-05-21', NULL, '2015-05-22 01:52:05.633562', '2015-07-06 21:35:55.6341', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (103, 'CINEP/PPP', 'Luis Guillermo Guerrero', 'Director', 'direccion@cinep.org.co', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, ' ', '2015-05-21', NULL, '2015-05-22 01:55:42.597229', '2015-07-06 17:00:57.711824', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (104, 'DIÓCESIS DE ISTIMA - TADO - BANCO DE DATOS', 'Diócesis de Istmina-Tadó', 'Vicaría de Pastoral Indígena de la Diócesis de Istmina-Tadó', '', '', '', '', '', 'Istmina', 170, 'Nivel 1. Responsable: Yebrail', '2015-05-21', NULL, '2015-05-22 02:40:32.355268', '2015-07-06 17:17:41.228934', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (105, 'EQUIPO JURÍDICO PUEBLOS - BANCO DE DATOS', '', '', '', '', '', '', '', 'Bucaramanga', 170, 'Nivel 1. Responsable: Yebrail. ', '2015-05-21', NULL, '2015-05-22 02:42:09.48448', '2015-07-06 17:18:56.306427', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (106, 'MESA DE ORGANIZACIONES DE MUJERES DE SOACHA - BANCO DE DATOS', 'Clemencia', 'Directora', '', '', '', '', '', 'Soacha', 170, 'Nivel 1. Responsable: Angela', '2015-05-21', NULL, '2015-05-22 02:44:12.537794', '2015-07-06 17:19:23.201239', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (107, 'BANCO DE DATOS DE RIOSUCIO', '', '', '', '', '', '', '', '', NULL, 'Nivel 2. Responsable: Yebrail. ASCOBA Y CRPC', '2015-05-21', NULL, '2015-05-22 02:45:36.428287', '2015-07-06 17:15:18.639514', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (108, 'COCOCAUCA - BANCO DE DATOS GUAPI', '', '', '', '', '', '', '', 'Guapi', 170, 'Nivel 3. Responsable: Yebrail', '2015-05-21', NULL, '2015-05-22 02:46:50.363918', '2015-07-06 21:34:40.711935', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (109, 'BANCO DE DATOS DEL SURORIENTE COLOMBIANO', 'Cristina', '', '', '', '', '', '', 'Villavicencio', 170, 'Nivel 3. Responsable: William. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:47:54.635613', '2015-07-06 17:23:36.386237', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (110, 'DIÓCECIS DE QUIBDÓ - BANCO DE DATOS', '', '', '', '', '', '', '', '', NULL, 'Nivel 3. Responsable: Yebrail', '2015-05-21', NULL, '2015-05-22 02:48:30.46108', '2015-07-12 15:24:41.571639', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (111, 'OBSERVATORIO DE PAZ INTEGRAL - OPI - BANCO DE DATOS', '', '', '', '', '', '', '', 'Barrancabermeja', 170, 'Nivel 3. Responsable: Yebrail. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:49:25.335373', '2015-07-06 17:20:45.140466', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (112, 'DIÓCESIS DE TUMACO - BANCO DE DATOS', '', '', '', '', '', '', '', 'Tumaco', 170, 'Nivel 3. Responsable: Yebrail. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:50:51.544947', '2015-07-06 17:18:28.346996', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (113, 'COLECTVIO TIERRA DE TODOS', '', '', '', '', '', '', '', 'Bogotá', 170, 'Nivel 3. Responsable: Carlos. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:51:23.55079', '2015-07-06 17:16:53.366817', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (114, 'BANCO DE DATOS DEL VALLE', 'Cristian Llanos', 'Investigador ', 'Cllanos@cinep.org.co, cristianbandatosvalle@nocheyniebla.org', '', '', '', '', 'Cali', 170, 'Nivel 3. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:52:01.219649', '2015-07-06 17:14:19.028688', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (115, 'TERRITORIOS POR VIDA DIGNA - BANCO DE DATOS', 'Fabiana Carvajal', '', '', '', '', '', '', 'Popayan', 170, 'Nivel 3. Responsable: Christian. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:52:49.695242', '2015-07-06 17:21:55.772927', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (116, 'OBSERVATORIO SURCOLOMBIANO DE VIOLENCIA POLÍTICA Y DERECHOS HUMANOS - OBSURDH - BANCO DE DATOS', 'Rosita', '', '', '', '', '', '', 'Neiva', 170, 'Nivel 3. Responsable: Yebrail. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:53:33.06302', '2015-07-06 17:20:23.589979', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (117, 'BANCO DE DATOS BOYACÁ-CASANARE', '', '', '', '', '', '', '', '', NULL, 'Nivel 3. Responsable: Angela. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:54:11.140198', '2015-07-06 17:13:41.57594', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (118, 'BANCO DE DATOS DEL NORTE DE SANTANDER SJR', '', '', '', '', '', '', '', 'Cúcuta', 170, 'Nivel 3. Responsable: Carlos. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:55:00.020101', '2015-07-06 21:36:50.84594', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (119, 'BANCO DE DATOS COSTA CARIBE', 'Jerry Garavito', '', '', '', '', '', '', 'Barranquilla', 170, 'Nivel 3. Responsable: Jerry.', '2015-05-21', NULL, '2015-05-22 02:55:48.656073', '2015-07-06 17:14:00.795954', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (120, 'OBSERVATORIO DEL EJE CAFETERO - BANCO DE DATOS', 'Carlos', '', '', '', '', '', '', 'Armenia', 170, 'Nivel 3. Responsable: Christian. Tiene base.', '2015-05-21', NULL, '2015-05-22 02:57:02.952872', '2015-07-06 17:21:09.911711', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (121, 'AECID', '', '', '', '', '', '', '', '', NULL, '', '2015-04-27', NULL, '2015-06-13 01:29:37.286017', '2015-07-06 16:52:51.176075', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (133, 'UNIVERSIDAD LIBRE DE CALI', '', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 15:49:16.663238', '2015-07-06 15:49:16.663238', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (134, 'EMBAJADA DE SUECIA EN BARRANQUILLA', '', '', '', '', '', '', '', 'BARRANQUILLA', 170, '', '2015-07-06', NULL, '2015-07-06 15:54:28.582626', '2015-07-06 17:06:08.591612', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (135, 'BANCO DE DATOS PEREIRA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-06', NULL, '2015-07-06 17:12:00.713287', '2015-07-06 17:12:00.713287', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (150, 'CENTRO DE RECURSOS PARA EL ANÁLISIS DE CONFLICTOS ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:20:22.260154', '2015-07-09 17:20:22.260154', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (151, 'FRENTE AMPLIO POR LA PAZ ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:21:12.289797', '2015-07-09 17:21:12.289797', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (152, 'PASTORAL SOCIAL ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:23:12.920832', '2015-07-09 17:23:12.920832', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (153, 'INTERMON OXFAM ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:29:49.706518', '2015-07-09 17:29:49.706518', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (154, 'AFAVIT', '', '', '', '', '', '', '', '', NULL, '', '2015-07-09', NULL, '2015-07-09 17:32:40.334859', '2018-02-09 03:12:50.456441', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (180, 'PASTORAL SOCIAL DEL META', '', '', '', '', '', '', '', '', NULL, '', '2015-07-10', NULL, '2015-07-10 22:11:40.534589', '2015-07-10 22:11:40.534589', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (192, 'MINISTERIO INTERIOR', 'x', 'y', 'z', '2', '3', '4', '5', '6', 170, 'observa', '2015-07-13', NULL, '2015-07-13 15:04:10.372526', '2017-10-26 18:27:49.818836', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (193, 'ASOCIACIÓN ECATE', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:05:04.539664', '2015-07-13 15:05:04.539664', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (194, 'CPDH VALLE DEL CAUCA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:06:18.915788', '2015-07-13 15:06:18.915788', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (195, 'OFICINA DE GESTIÓN DE PAZ DE LA GOBERNACIÓN DEL VALLE DEL CAUCA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:10:38.409748', '2015-07-13 15:10:38.409748', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (196, 'ASOCIACIÓN PARA LA INVESTIGACIÓN Y ACCIÓN SOCIAL NOMADESC', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:19:08.992302', '2015-07-13 15:19:08.992302', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (197, 'MOVIMIENTO DE VÍCTIMAS DE CRÍMENES DE ESTADO CAPITULO VALLE DEL CAUCA', 'MARTHA GIRALDO ', '', '', '', '', '', '', 'CALI', 170, '', '2015-07-13', NULL, '2015-07-13 15:19:37.692932', '2015-07-14 03:23:18.97383', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (198, 'ESCUELA DE TRABAJO SOCIAL UNIVERSIDAD DEL VALLE DEL CAUCA', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:20:49.778506', '2015-07-13 15:20:49.778506', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (199, 'DEPARTAMENTO DE HISTORIA UNIVERSIDAD DEL VALLE ', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:21:28.806579', '2015-07-13 15:21:28.806579', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (200, 'INSTITUTO DE ESTUDIOS INTERCULTURALES PONTIFICIA UNIVERSIDAD JAVERIANA CALI', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 15:22:44.019566', '2015-07-13 15:22:44.019566', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (201, 'PAZFICO NOTICIAS', '', '', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 16:03:24.273143', '2015-07-13 16:03:24.273143', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (202, 'ALCALDIA MUNICIPAL DE SAN JOSÉ DEL GUAVIARE', 'ANDREA RODRIGUEZ', 'GESTORA SOCIAL DE LA ALCALDIA', '', '', '', '', '', '', NULL, '', '2015-07-13', NULL, '2015-07-13 19:06:19.686297', '2015-07-13 19:06:19.686297', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (228, 'PRODEPAZ - PROGRAMA DE DESARROLLO PAZ DEL MAGDALENA MEDIO PDPMM', 'UBENCEL DUMAS', '', '', '', '', '', '', '', 170, '', '2015-07-13', NULL, '2015-07-14 03:09:23.780077', '2015-07-14 03:09:23.780077', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (249, 'LIBERA ', 'TONIO DELL''OLIO; GIULIA BARUZZO; MONICA USAI; LUIGI PELLEGRINO; STEFANO FUMARULO', '', '', '', '', '', '', '', 380, '', '2015-07-14', NULL, '2015-07-14 15:56:02.550822', '2015-07-14 15:56:02.550822', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (260, 'VOCES SILENCIADAS', 'DOMINIQUE', '', '', '', '', '', '', '', NULL, '', '2015-07-28', NULL, '2015-07-29 00:02:26.388183', '2015-07-29 00:02:26.388183', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (261, 'SEMINARIO ARQUIDIOCESANO SAN JOSE ', '', 'RECTOR', '', '', '', '', '', 'BOGOTA', 170, '', '2015-08-19', NULL, '2015-08-19 14:56:05.968268', '2015-08-19 14:56:05.968268', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (262, 'FUNDACIóN VISIóN Y GESTIóN DE LA PLATAFORMA DE DDHH DE CALDAS', 'Diana Marcela Muriel', '', 'ddhhcaldas@gmail.com', '317 438 5035', '', '', 'Carrera 23 Nº 32 22', 'Manizales', 170, 'Posible Banco Regional contactado por Christian.', '2015-09-11', NULL, '2015-09-11 18:17:50.27034', '2015-09-11 18:17:50.27034', NULL);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (286, 'ADEPES-HONDURAS', 'MYNOR LENIN CARBAJAL', '', 'MYNORADEPES@GMAIL.COM', '32967470', '', '', '', 'TEGUCIGALPA', 340, 'observa', '2015-12-15', NULL, '2015-12-15 16:24:28.976097', '2018-02-03 10:19:49.431304', 2);
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
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (297, 'BANCO DE DATOS DE QUINDÍO', 'CARLOS ANDRÉS QUINTANA ', 'ENCARGADO', 'BANDATOSQUINDIO@GMAIL.COM', '', '', '', '', '', NULL, '', '2016-04-08', NULL, '2016-04-08 23:07:44.922833', '2016-04-08 23:07:44.922833', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (299, 'Y', '', '', '', '', '', '', '', '', NULL, '', '2017-07-17', NULL, '2017-07-17 16:16:06.249505', '2017-07-17 16:16:06.249505', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (300, 'FULANITA MARÍA GÓMEZ', '', '', '', '', '', '', '', NULL, NULL, '', '2018-02-14', NULL, '2018-02-14 10:47:35.291261', '2018-02-14 10:47:35.291261', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (301, 'FAMILIA GÓMEZ', '', '', '', '', '', '', '', NULL, NULL, '', '2018-02-14', NULL, '2018-02-14 15:24:50.249121', '2018-02-14 15:24:50.249121', NULL);
INSERT INTO actor (id, nombre, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, nivelrelacion_id) VALUES (302, 'UNIÓN EUROPEA. UE.', '', '', '', '', '', '', '', NULL, NULL, '', '2018-02-19', NULL, '2018-02-19 19:10:32.54154', '2018-02-19 19:10:32.54154', 3);


--
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actor_id_seq', 302, true);


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
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'CIENCIAS SOCIALES', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INGENIERÍA', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'TÉCNICO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'CINECIAS ADMINISTRATIVAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
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
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ASESOR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ASESOR JUNIOR DE INF. POLITICA Y PEDAG.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
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
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'AUXILIAR DE CONTABILIDAD', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
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
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'PROFESIONAL EN CIENCICAS JURÍDICAS', 'http://empleoscolombianos.blogspot.com.co/2013/07/el-cinep-programa-por-la-paz-colombia.html', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'OTRO', NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'ASESOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'ASESOR AUXILIAR 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cargo_id_seq', 102, true);


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
INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACTOR ESTRATEGICO', 'Pueden financiarnos o nos ayudan en incidencia', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ACTOR DE INCIDENCIA', 'En quienes queremos influir para la toma de decisiones', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');


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

SELECT pg_catalog.setval('niveleducacion_id_seq', 100, true);


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
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'PROFESIONAL 5', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ANALISTA 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ANALISTA 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ANALISTA 3', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ANALISTA 4', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ANALISTA 5', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PROFESIONAL 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'PROFESIONAL 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'PROFESIONAL 3', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: perfilprofesional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('perfilprofesional_id_seq', 100, true);


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

SELECT pg_catalog.setval('profesion_id_seq', 100, true);


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
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIO', 'EL PRESENTE DOCUMENTO CONTIENE EL DESARROLLO TEMÁTICO DEL PRIMER TALLER DE FORMACIÓN DE NUEVOS LIDERAZGOS EN LA  SUBREGIÓN DEL BAJO ATRATO DEL EQUIPO CHOCÓ DEL CINEP-PROGRAMA POR LA PAZ. EN ESTE PRIMER MÓDULO, SE TRATARÁ EL TEMA  DE LEGISLACIÓN TERRITORIAL, NO SIN ANTES ECHAR UN VISTAZO A CONCEPTOS PREVIOS Y BÁSICOS PARA UN ADECUADO MANEJO DEL TEMA COMO: DERECHOS HUMANOS, DERECHOS  FUNDAMENTALES, CONSTITUCIÓN Y TIPOS DE NORMAS, QUE SON BASE PARA PODER  ENTENDER LA LEGISLACIÓN TERRITORIAL ACTUAL, SU SENTIDO Y SU ALCANCE.  A SU VEZ, SE BUSCA QUE EL TALLER NO SÓLO SIRVA PARA TRANSMITIR UN CONOCIMIENTO, SINO QUE LOS PARTICIPANTES LO ASUMAN DE
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'NOCHE Y NIEBLA 51', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'CASO TIPO TRUJILLO', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
 UNA MANERA ANALÍTICA Y CRÍTICA. ES DECIR, QUE NO SE CONFORMEN CON SABER QUÉ DICE LA LEY, SINO QUE SEAN CAPACES DE CRITICARLA Y PROPONER ALTERNATIVAS DE ACUERDO CON SUS DINÁMICAS Y NECESIDADES COMUNITARIAS.  EL PROCESO DE FORMACIÓN QUE BRINDA EL TALLER ES INTEGRAL: SE RELACIONA CON EL ENTORNO SOCIAL COTIDIANO Y SE APOYA EN LA FORMACIÓN PERSONAL DE LOS PARTICIPANTES. ADEMÁS, BUSCA GENERAR CRÍTICA Y AUTOCRÍTICA, FORTALECIMIENTO ORGANIZATIVO, ASÍ COMO CONOCIMIENTO Y SENSIBILIZACIÓN PARA EMPRENDER LA EXIGIBILIDAD DE LOS DERECHOS. LA PUBLICACIÓN CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIOPRETENDE DAR CUENTA DEL DESARROLLO TEMÁTICO DEL PRIMER TALLER, ASÍ COMO BRINDAR HERRAMIENTAS PARA QUE LOS PARTICIPANTES, COMO NUEVOS LÍDERES Y LIDERESAS QUE SERÁN, PUEDAN REPLICAR LO APRENDIDO EN SUS COMUNIDADES. ', '2015-12-07', NULL, '2015-12-07 18:04:33.682198', '2015-12-07 18:04:33.682198');


--
-- Name: publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('publicacion_id_seq', 112, true);


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

INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'COSTA-DH', '', 122, '2017-05-09', NULL, '2017-05-09 14:00:00.752746', '2017-10-26 12:51:10.249883');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'CARIBE', 'Plan quinquenal 2018-2022', NULL, '2017-10-25', NULL, '2017-10-25 00:00:00', '2017-10-25 00:00:00');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'FRONTERA COLOMBO VENEZOLANA', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 12:54:14.72199', '2017-10-26 12:54:14.72199');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'MAGDALENA MEDIO', 'Plan Quinquenal 2018-2022', 101, '2017-10-26', NULL, '2017-10-26 12:56:30.833328', '2017-10-26 12:56:30.833328');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'ANDINA', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:00:07.044693', '2017-10-26 13:00:07.044693');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'BOGOTA Y ALREDEDORES', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:01:14.728238', '2017-10-26 13:01:14.728238');
INSERT INTO regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'ANDÉN PACÍFICO', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:02:18.195017', '2017-10-26 13:02:18.195017');


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
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'INFORME FINANCIERO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACUSE DE RECIBIDO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FORMATO DE SOLICITUD', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'OTRO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');


--
-- Name: tipoanexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipoanexo_id_seq', 100, true);


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
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (2, 'CONTRATO DE APRENDIZAJE', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 2);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (3, 'CONTRATO HONORARIOS', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 3);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (4, 'CONTRATO LABORAL  T. FIJO', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (5, 'CONTRATO LABORAL  T. FIJO  1/2 T.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (6, 'CONTRATO LABORAL  T. INDF.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (7, 'CONVENIO INTERINST.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 5);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (8, 'PASANTIA', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 2);
INSERT INTO tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (9, 'VOLUNTARIO', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 5);


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
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'LOCA', 'LOC', 'loc', 418, 'loca', '2017-10-16', NULL, '2017-10-16 20:00:13.656025', '2017-10-16 20:00:13.656025');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'EURO', 'EUR', '€', NULL, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'DÓLAR', 'USD', 'US$', 840, '', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-05-12 19:15:03.691469');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FRANCO SUIZO', 'CHF', 'CHF', 756, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'LIBRA INGLESA', 'GBP', '£', 826, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CORONA SUECA', 'SEK', 'kr', 752, '', '2016-05-13', NULL, '2016-05-13 17:02:06.717417', '2016-05-13 17:02:06.717417');


--
-- Name: tipomoneda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipomoneda_id_seq', 101, true);


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
INSERT INTO tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'LIBRO', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
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

