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
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ACADEMIA', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'IGLESIA', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ORGANIZACIÓN DE BASE', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'GOBIERNO', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'OTRAS ONGS NACIONALES', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
INSERT INTO sectoractor (id, nombre, observaciones, enplantrienal, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'OTRAS ONGS INTERNACIONALES', NULL, true, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');
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

INSERT INTO actor (id, nombre, sectoractor_id, personacontacto, cargo, correo, telefono, fax, celular, direccion, ciudad, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CINEP', 16, 'Luis Guillermo Guerrero', 'Director', 'direccion@cinep.org.co', '2456181', '2879089', NULL, 'Cr 5 # 33B-02', 'BOGOTÁ', 170, NULL, '2015-05-21', NULL, '2015-05-21 00:00:00', '2015-05-21 00:00:00');


--
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actor_id_seq', 102, true);


--
-- PostgreSQL database dump complete
--

