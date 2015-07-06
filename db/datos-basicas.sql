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

INSERT INTO actor (id, nombre,  personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'Pasos de Jesús', 'Vladimir Támara Patiño', 'Desarrollador', 'vtamara@pasosdeJesus.org', NULL, NULL, '3165383162', NULL, 'BOGOTÁ', 170, NULL, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO actor (id, nombre,  personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'Banco de Datos del CINEP', 'Yebrail Alvarez', 'Coordinador', 'lutas@nocheyniebla.org', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, '', '2015-05-21', NULL, '2015-05-22 01:52:05.633562', '2015-05-22 01:54:54.379122');
INSERT INTO actor (id, nombre,  personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CINEP/PPP', 'Luis Guillermo Guerrero', 'Director', 'direccion@cinep.org.co', '2456181', '', '', 'Cr 5 # 33B - 02', 'Bogotá', 170, ' ', '2015-05-21', NULL, '2015-05-22 01:55:42.597229', '2015-05-22 01:55:42.597229');


--
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actor_id_seq', 103, true);


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
-- Data for Name: nucleoconflicto; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO nucleoconflicto (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CULTURAS POLÍTICAS, IDENTIDADES Y DD-HH', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO nucleoconflicto (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'RELACIONES ESTADO Y SOCIEDAD', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO nucleoconflicto (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ALTERNATIVAS AL DESARROLLO REGIONAL', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: nucleoconflicto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('nucleoconflicto_id_seq', 101, true);


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
-- Data for Name: publicacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'NOCHE Y NIEBLA 50', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'NOCHE Y NIEBLA 51', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'CASO TIPO TRUJILLO', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('publicacion_id_seq', 101, true);


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
-- Data for Name: redactor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'RED PRODEPAZ', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'INTERNATIONAL COALITION FOR THE RESPONSABILITY  TO PROTECT', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INTERNATIONAL LAND COALITION', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ASOCIACIÓN LATINOAMERICANA DE ORGANIZACIONES DE PROMOCIÓN AL DESARROLLO A.C', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'CONSEJO LATINOAMERICANO  DE CIENCIAS SOCIALES', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'NO APLICA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'OTRA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
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

SELECT pg_catalog.setval('redactor_id_seq', 102, true);


--
-- PostgreSQL database dump complete
--

