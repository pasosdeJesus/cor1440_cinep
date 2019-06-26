-- Volcado de tablas basicas

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: nivelrelacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ACTOR DE SENTIDO', 'Trabajamos para ellos misionalmente, son beneficiarios', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ACTOR DE MISIÓN', 'Trabajamos con ellos como pares para lo misional', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACTOR ESTRATÉGICO', 'Pueden financiarnos o nos ayudan en incidencia', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-06 16:23:44.775827');
INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ACTOR DE INCIDENCIA', 'En quienes queremos influir para la toma de decisiones.  Falta limitar si solo es incidencia política,  o si por ejemplo lograr publicación en medios masivos también se considera.  Si solo es inicidencia política sobra sector formula política pública.', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-06 16:54:50.275062');


--
-- Name: nivelrelacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nivelrelacion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tiponomina; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'AUXILIO', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'HONORARIOS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'SALARIO', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.tiponomina (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'N/A', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: tiponomina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tiponomina_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: areaestudios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'CIENCIAS SOCIALES', '', '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-20 19:14:05.958152');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INGENIERÍA', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'TÉCNICO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'CIENCIAS ADMINISTRATIVAS', '', '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-20 19:50:56.150502');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'CIENCIAS BÁSICAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CIENCIAS COMUNICATIVAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'CIENCIAS CONTABLES', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CIENCIAS EXACTAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'CIENCIAS ECONÓMICAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CIENCIAS EDUCATIVAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'CIENCIAS JURÍDICAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');


--
-- Name: areaestudios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.areaestudios_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: cajacompensacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'CAFAM', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'COLSUBSIDIO', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.cajacompensacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'COMPENSAR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: cajacompensacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cajacompensacion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'ASESOR AUXILIAR 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'PROFESIONAL 1', '', '2016-04-22', '2018-04-16', '2016-04-22 16:37:42.454072', '2016-04-22 16:37:42.454072');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'PROFESIONAL 2', '', '2016-05-17', '2018-04-16', '2016-05-17 20:46:54.205211', '2016-05-17 20:46:54.205211');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'ASESOR/A', '', '2016-08-09', NULL, '2016-08-09 19:20:15.125164', '2016-08-09 19:20:15.125164');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'ASISTENTE CONTABLE', '', '2016-08-09', NULL, '2016-08-09 19:51:56.682372', '2016-08-09 19:51:56.682372');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'ASISTENTE LOGÍSTICO', '', '2016-08-09', NULL, '2016-08-09 19:52:13.317422', '2016-08-09 19:52:13.317422');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'DOCENTE', '', '2016-11-23', NULL, '2016-11-23 19:52:07.74931', '2016-11-23 19:52:07.74931');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'TUTOR', '', '2016-11-23', NULL, '2016-11-23 19:52:19.350663', '2016-11-23 19:52:19.350663');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'PROFESIONAL 3', '', '2016-12-03', '2018-04-16', '2016-12-03 23:30:23.278065', '2016-12-03 23:30:23.278065');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'PROFESIONAL 4', '', '2016-12-03', '2018-04-16', '2016-12-03 23:30:35.784771', '2016-12-03 23:30:35.784771');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ASESOR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (110, 'PROFESIONAL 5', '', '2016-12-03', '2018-04-16', '2016-12-03 23:30:48.208192', '2016-12-03 23:30:48.208192');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (111, 'ASISTENTE 1', '', '2017-03-02', '2018-04-16', '2017-03-02 17:25:07.237839', '2017-03-02 17:25:07.237839');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (112, 'ASISTENTE 2', '', '2017-03-02', '2018-04-16', '2017-03-02 17:25:35.567871', '2017-03-02 17:25:35.567871');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (113, 'ASISTENTE 3', '', '2017-03-02', '2018-04-16', '2017-03-02 17:25:53.253494', '2017-03-02 17:25:53.253494');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (114, 'ASISTENTE 4', '', '2017-03-02', '2018-04-16', '2017-03-02 17:26:08.903612', '2017-03-02 17:26:08.903612');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (115, 'ASISTENTE 5', '', '2017-03-02', '2018-04-16', '2017-03-02 17:26:22.90822', '2017-03-02 17:26:22.90822');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (116, 'PASANTE', '', '2018-04-23', NULL, '2018-04-23 14:33:01.187561', '2018-04-23 14:33:01.187561');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (117, 'APRENDIZ', '', '2018-04-26', NULL, '2018-04-26 13:49:28.730554', '2018-04-26 13:49:28.730554');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (118, 'ASESORA PEDAGOGICA', '', '2018-04-26', NULL, '2018-04-26 16:16:10.849808', '2018-04-26 16:16:10.849808');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (119, 'VOLUNTARIO', '', '2018-04-26', NULL, '2018-04-26 17:27:31.942551', '2018-04-26 17:27:31.942551');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ASESOR JUNIOR DE INF. POLITICA Y PEDAG.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (120, 'ASISTENTE DE COMUNICACION DIGITAL Y ORGANIZACIONAL', '', '2018-04-26', NULL, '2018-04-26 19:00:53.047695', '2018-04-26 19:00:53.047695');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (121, 'GESTOR TERRITORIAL', '', '2018-04-26', NULL, '2018-04-26 19:54:13.544825', '2018-04-26 19:54:13.544825');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'ASESORA ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ASESORA ASISTENTE EN PUBLICACIONES', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'ASESORA EN COMUNICACIÓN ORG.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'ASISTENTE DE  GESTION HUMANA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'ASISTENTE DE INVESTIGACION', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'ASISTENTE DE PRODUCCION RADIAL', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'ASISTENTE DE PROYECTOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'ASISTENTE DE RECURSOS FISICOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'AUXILIAR 1 ARCHIVO DE PRENSA B.D.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'AUXILIAR DE ARCHIVO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'AUXILIAR DE BIBLIOTECA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'AUXILIAR CONTABLE', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-26 13:48:42.584294');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'AUXILIAR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'CONTADOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'CONTADORA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'CONTRATISTA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'COORDINADOR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'INVESTIGADOR', '', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-04-22 16:37:01.088463');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'COORDINADORA DE PUBLICACIONES', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'COORDINADORA PEDAGOGICA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'DIRECTOR GENERAL', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'GERENTE ADMINISTRATIVA Y FINANCIERA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'GERENTE DE PROYECTOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'INVESTIGADOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'INVESTIGADOR ASISTENTE 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'INVESTIGADOR AUXILIAR 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'INVESTIGADOR AUXILIAR 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (39, 'INVESTIGADOR JUNIOR', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ANALISTA', 'x', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-03-31 00:43:14.525044');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (40, 'INVESTIGADOR JUNIOR', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (41, 'MENSAJERO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (42, 'OFICIAL DE PROYECTOS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (43, 'SUBDIRECTOR GENERAL', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (44, 'TECNOLOGO EN SISTEMAS', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (45, 'TESORERA', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ANALISTA DE PRENSA', 'http://empleoscolombianos.blogspot.com.co/2013/12/el-cinep-programa-por-la-paz-abre.html', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'PROFESIONAL EN CIENCIAS JURÍDICAS', 'http://empleoscolombianos.blogspot.com.co/2013/07/el-cinep-programa-por-la-paz-colombia.html', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-07-18 20:18:14.093914');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'OTRO', NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'ASESOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'ASESOR AUXILIAR 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cargo_id_seq', 121, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: empresaps; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'MEDIMAS', '', '2018-06-19', NULL, '2018-06-19 17:00:32.344785', '2018-06-19 17:00:32.344785');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'COMPENSAR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'COOMEVA', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FAMISANAR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'NUEVA EPS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SALUD TOTAL', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'SANITAS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'SURA', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: empresaps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empresaps_id_seq', 101, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: fondopensiones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'COLPENSIONES', '', '2018-06-14', NULL, '2018-06-14 19:42:34.095181', '2018-06-14 19:42:34.095181');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'COLFONDOS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'OLD MUTUAL', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'PORVENIR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'PROTECCIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: fondopensiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fondopensiones_id_seq', 101, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: niveleducacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'LICENCIATURA', '', '2018-04-26', NULL, '2018-04-26 13:25:24.372703', '2018-04-26 13:25:24.372703');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'BACHILLER', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'DOCTORADO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ESPECIALIZACION', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ESTUDIANTE', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'MAESTRIA', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PREGRADO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'TECNICO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'TECNOLOGO ', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');


--
-- Name: niveleducacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.niveleducacion_id_seq', 101, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: perfilprofesional; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'PROFESIONAL 4', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'CONTRATISTA', '', '2018-04-26', NULL, '2018-04-26 13:30:06.761125', '2018-04-26 13:30:06.761125');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'PRACTICANTE', '', '2018-04-26', NULL, '2018-04-26 13:32:10.86939', '2018-04-26 13:34:44.476997');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'ESTUDIANTE', '', '2018-04-26', NULL, '2018-04-26 13:35:04.235253', '2018-04-26 13:35:04.235253');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'VOLUNTARIO', '', '2018-04-26', NULL, '2018-04-26 17:27:51.312572', '2018-04-26 17:27:51.312572');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'PROFESIONAL 5', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ASISTENTE 1', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:10.969263');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ASISTENTE 2', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:26.107431');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ASISTENTE 3', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:41.292283');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ASISTENTE 4', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:42:52.443688');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ASISTENTE 5', '', '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-23 15:43:03.671981');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PROFESIONAL 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'PROFESIONAL 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'PROFESIONAL 3', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: perfilprofesional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.perfilprofesional_id_seq', 104, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: procesogh; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');
INSERT INTO public.procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'APOYO', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');
INSERT INTO public.procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'OPERATIVO', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');
INSERT INTO public.procesogh (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'DIRECTIVO', NULL, '2018-04-24', NULL, '2018-04-24 00:00:00', '2018-04-24 00:00:00');


--
-- Name: procesogh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.procesogh_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: profesion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'DERECHOS HUMANOS', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'DISEÑADORA GRAFICA', '', 1, '2018-04-26', NULL, '2018-04-26 13:30:46.69892', '2018-04-26 13:30:46.69892');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'AGRONOMA', '', 1, '2018-04-26', NULL, '2018-04-26 13:31:01.637064', '2018-04-26 13:31:01.637064');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'ESTUDIANTE DE FILOSOFIA', '', 1, '2018-04-26', NULL, '2018-04-26 16:56:30.797702', '2018-04-26 16:56:30.797702');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'CONTABILIDAD Y FINANZAS', '', 5, '2018-04-26', NULL, '2018-04-26 17:35:42.925583', '2018-06-14 19:41:57.597915');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'PSICOLOGO', '', 10, '2018-06-19', NULL, '2018-06-19 16:52:37.27722', '2018-06-19 16:52:37.27722');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'DISEÑADOR INDUSTRIAL', NULL, 11, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ECONOMISTA', NULL, 7, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'ESTUDIANTE CIENCIA DE LA INFORMACION  BIBLIOTECOLOGIA', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ESTUDIANTE DE ADMINISTRACION DE EMPRESAS', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'ESTUDIANTE DE COMERCIO INTERNACIONAL', NULL, 7, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'ESTUDIANTE DE COMUNICACIÓN', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'ESTUDIANTE DE HISTORIA', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'FILOSOFO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'TEOLOGO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ABOGADO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'GOBIERNO Y RELACIONES INTERNACIONALES', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'HISTORIADOR/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'INGENIERO/A DE SISTEMAS ', NULL, 11, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'INGENIERIA FINANCIERA', NULL, 7, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'LICENCIADO/A EN EDUCACION BASICA', NULL, 8, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'LICENCIADO/A EN MATEMATICAS Y FISICA', NULL, 8, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'LICENCIADO/A EN FILOSOFIA Y CIENCIAS RELIGIOSAS', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'MATEMATICO/A', NULL, 6, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'PERIODISMO', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ADMINISTRADOR/A PUBLICO', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'POLITOLOGO/A', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'SOCIOLOGO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'TECNICO EN ASISTENCIA EN ORGANIZACIÓN DE ARCHIVOS', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'TECNICO/A EN PERIODISMO', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'TECNOLOGO/A EN SISTEMAS', NULL, 12, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'TRABAJADOR/A SOCIAL', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'ESTUDIANTE DE CONTADURIA PUBLICA', NULL, 5, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'ZOOTECNISTA', NULL, 3, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ANTROPOLOGO/A', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ASISTENCIA EN ORGANIZACIÓN DE ARCHIVOS', NULL, 2, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'BACHILLER', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'COMUNICADOR/A SOCIAL', NULL, 4, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CONTADOR/A PUBLICO', NULL, 5, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'CONTADOR/A TECNICO', NULL, 5, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');


--
-- Name: profesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profesion_id_seq', 105, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: publicacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'NOCHE Y NIEBLA 50', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'NOCHE Y NIEBLA 49', '', '2015-07-06', NULL, '2015-07-06 16:30:08.347567', '2015-07-06 16:30:08.347567');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'NOCHE Y NIEBLA 48', '', '2015-07-06', NULL, '2015-07-06 16:30:16.182873', '2015-07-06 16:30:16.182873');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CASO TIPO FALSOS POSITIVOS', '', '2011-06-15', NULL, '2015-07-06 16:30:48.591082', '2015-07-06 16:31:08.88526');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'FOLLETO VOCES DE LA MEMORIA ', '', '2015-07-06', NULL, '2015-07-06 17:00:42.371682', '2015-07-06 17:00:42.371682');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'SIVEL BANCO DE DATOS', '', '2015-07-08', NULL, '2015-07-08 14:23:57.634467', '2015-07-08 14:23:57.634467');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'SISTEMA DE INFORMACIÓN PARA SEGUIMIENTO DE ACTIVIDADES DEL BANCO DE DATOS', '', '2015-07-08', NULL, '2015-07-08 14:24:24.397846', '2015-07-08 14:24:24.397846');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'ADJ BANCO DE DATOS', '', '2015-07-12', NULL, '2015-07-12 16:23:57.527215', '2015-07-12 17:22:53.439711');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIO', 'EL PRESENTE DOCUMENTO CONTIENE EL DESARROLLO TEMÁTICO DEL PRIMER TALLER DE FORMACIÓN DE NUEVOS LIDERAZGOS EN LA  SUBREGIÓN DEL BAJO ATRATO DEL EQUIPO CHOCÓ DEL CINEP-PROGRAMA POR LA PAZ. EN ESTE PRIMER MÓDULO, SE TRATARÁ EL TEMA  DE LEGISLACIÓN TERRITORIAL, NO SIN ANTES ECHAR UN VISTAZO A CONCEPTOS PREVIOS Y BÁSICOS PARA UN ADECUADO MANEJO DEL TEMA COMO: DERECHOS HUMANOS, DERECHOS  FUNDAMENTALES, CONSTITUCIÓN Y TIPOS DE NORMAS, QUE SON BASE PARA PODER  ENTENDER LA LEGISLACIÓN TERRITORIAL ACTUAL, SU SENTIDO Y SU ALCANCE.  A SU VEZ, SE BUSCA QUE EL TALLER NO SÓLO SIRVA PARA TRANSMITIR UN CONOCIMIENTO, SINO QUE LOS PARTICIPANTES LO ASUMAN DE UNA MANERA ANALÍTICA Y CRÍTICA. ES DECIR, QUE NO SE CONFORMEN CON SABER QUÉ DICE LA LEY, SINO QUE SEAN CAPACES DE CRITICARLA Y PROPONER ALTERNATIVAS DE ACUERDO CON SUS DINÁMICAS Y NECESIDADES COMUNITARIAS.  EL PROCESO DE FORMACIÓN QUE BRINDA EL TALLER ES INTEGRAL: SE RELACIONA CON EL ENTORNO SOCIAL COTIDIANO Y SE APOYA EN LA FORMACIÓN PERSONAL DE LOS PARTICIPANTES. ADEMÁS, BUSCA GENERAR CRÍTICA Y AUTOCRÍTICA, FORTALECIMIENTO ORGANIZATIVO, ASÍ COMO CONOCIMIENTO Y SENSIBILIZACIÓN PARA EMPRENDER LA EXIGIBILIDAD DE LOS DERECHOS. LA PUBLICACIÓN CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIOPRETENDE DAR CUENTA DEL DESARROLLO TEMÁTICO DEL PRIMER TALLER, ASÍ COMO BRINDAR HERRAMIENTAS PARA QUE LOS PARTICIPANTES, COMO NUEVOS LÍDERES Y LIDERESAS QUE SERÁN, PUEDAN REPLICAR LO APRENDIDO EN SUS COMUNIDADES. ', '2015-12-07', NULL, '2015-12-07 18:04:33.682198', '2017-11-22 00:55:09.527622');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'NOCHE Y NIEBLA 52', '', '2016-03-11', NULL, '2016-03-11 13:46:57.777308', '2016-03-11 13:47:21.298207');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (110, 'CUADERNO DE TRABAJO 1 "MUJERES VÍCTIMAS Y APROXIMACIÓN VIVENCIAL AL ENFOQUE DE GÉNERO"', 'Cuaderno de trabajo para formación y capacitación interna.', '2016-03-11', NULL, '2016-03-11 13:50:20.767632', '2016-03-11 13:50:20.767632');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (111, 'PÁGINA WEB WWW.NOCHEYNIEBLA.ORG', '', '2016-03-11', NULL, '2016-03-11 13:51:08.053337', '2016-03-11 13:51:08.053337');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (112, 'NOCHE Y NIEBLA 53', 'La revista Noche y Niebla corresponde al periodo enero junio de 2016. En circulación a partir de agosto de 2016', '2016-07-27', NULL, '2016-07-27 15:21:43.111949', '2016-07-27 15:21:43.111949');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (113, 'NOCHE Y NIEBLA 54', '', '2017-12-06', NULL, '2017-12-06 13:55:35.186569', '2017-12-06 13:55:35.186569');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (114, 'NOCHE Y NIEBLA 55', '', '2017-12-06', NULL, '2017-12-06 13:56:01.884361', '2017-12-06 13:56:01.884361');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (115, 'CONTROVERSIA N.° 204. DOSSIER CIUDADANÍA EN MOVIMIENTO (JUNIO 2015)', 'Revista', '2017-06-06', NULL, '2017-12-11 19:31:57.284963', '2017-12-11 19:34:01.582471');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (116, 'CONSTRUCCIÓN DE PAZ INTEGRAL', 'Cartilla ', '2017-06-08', NULL, '2017-12-11 19:32:27.322442', '2017-12-11 19:34:14.480412');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (117, 'ENFOQUE DE GÉNERO', 'Cartilla', '2017-06-09', NULL, '2017-12-11 19:32:44.800287', '2017-12-11 19:34:25.137064');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (118, 'EXIGIBILIDAD DE DERECHOS Y PARTICIPACIÓN POLÍTICA', 'Cartilla', '2017-06-13', NULL, '2017-12-11 19:32:57.170121', '2017-12-11 19:35:30.840991');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (119, 'TRANSICIONES POLÍTICAS PARA EL POSCONFLICTO. ¿DE PROCESOS PARTICIPATIVOS A RESULTADOS INCLUYENTES EN MATERIA DE CONSTRUCCIÓN DE ESTADO Y GOBERNANZA?', 'Libro', '2017-06-15', NULL, '2017-12-11 19:33:17.37446', '2017-12-11 19:35:47.394278');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (120, 'EL CESE BILATERAL: MÁS ALLÁ DEL FUEGO', 'Informe', '2017-07-04', NULL, '2017-12-11 19:33:37.179486', '2017-12-11 19:33:48.262365');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (121, 'RECOMENDACIÓN GENERAL NO. 34 SOBRE LOS DERECHOS DE LAS MUJERES RURALES', 'Informe', '2017-09-01', NULL, '2017-12-11 19:36:22.011099', '2017-12-11 19:36:30.62753');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (122, 'MUJERES Y RURALIDAD EN BOGOTÁ', 'Cartilla', '2017-10-02', NULL, '2017-12-11 19:36:49.841671', '2017-12-11 19:36:56.661109');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (123, 'LA SITUACIÓN DE LAS MUJERES RURALES EN PERÚ', 'Informe', '2017-10-04', NULL, '2017-12-11 19:37:24.329731', '2017-12-11 19:37:30.605128');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (124, 'MUJERES RURALES EN NICARAGUA: ENTRE HETEROGENEIDAD, CONTINUIDAD Y CAMBIOS', 'Informe', '2017-10-06', NULL, '2017-12-11 19:38:41.400699', '2017-12-11 19:39:00.542143');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (125, 'SITUACIÓN GENERAL DE LAS MUJERES RURALES E INDÍGENAS EN MÉXICO', 'Informe', '2017-10-07', NULL, '2017-12-11 19:39:16.230365', '2017-12-11 19:39:20.754459');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (126, 'MUJERES RURALES EN EL CHACO ARGENTINO', 'Informe', '2017-10-08', NULL, '2017-12-11 19:39:38.144244', '2017-12-11 19:39:45.294997');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (127, 'LAS MUJERES RURALES EN ECUADOR', 'Informe', '2017-10-09', NULL, '2017-12-11 19:39:56.627673', '2017-12-11 19:40:09.255242');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (128, 'LAS MUJERES RURALES EN GUATEMALA', 'Informe', '2017-10-11', NULL, '2017-12-11 19:40:22.247376', '2017-12-11 19:40:31.186536');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (129, 'AGENCIA DE NOTICIAS DE MUJERES INDÍGENAS Y AFRODESCENDIENTES', 'Cartilla', '2017-10-12', NULL, '2017-12-11 19:40:48.674324', '2017-12-11 19:41:15.875157');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (130, 'MESA DE INCIDENCIA POLÍTICA DE LAS MUJERES RURALES COLOMBIANAS', 'Cartilla', '2017-10-13', NULL, '2017-12-11 19:41:28.263665', '2017-12-11 19:41:34.177892');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (131, 'ALIANZA DE MUJERES POR EL ACCESO A LA TIERRA Y MEDIOS DE PRODUCCIÓN (GUATEMALA)', 'Cartilla', '2017-10-14', NULL, '2017-12-11 19:41:45.328714', '2017-12-11 19:41:50.809264');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (132, 'RESUMEN EJECUTIVO: PANORAMA DE VIOLACIONES AL DERECHO A LA VIDA, LIBERTAD E INTEGRIDAD DE LÍDERES SOCIALES Y DEFENSORES DE DD.HH.', 'Informe', '2017-10-14', NULL, '2017-12-11 19:42:08.844162', '2017-12-11 19:42:14.213262');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (133, 'PANORAMA DE VIOLACIONES AL DERECHO A LA VIDA, LIBERTAD E INTEGRIDAD DE LÍDERES SOCIALES Y DEFENSORES DE DD.HH( 2016 Y PRIMER SEMESTRE DE 2017)', 'Informe', '2017-10-15', NULL, '2017-12-11 19:42:34.481534', '2017-12-11 19:42:41.511492');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (134, 'NOCHE Y NIEBLA NO. 55', 'Revista ', '2017-10-17', NULL, '2017-12-11 19:42:58.836388', '2017-12-11 19:43:04.480154');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (135, 'HISTORIAS DE VIDA', 'Cartillas con caja contenedora', '2017-10-18', NULL, '2017-12-11 19:43:26.240175', '2017-12-11 19:43:34.875142');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (136, 'INFORME: TUMACO ¿VÍCTIMA DE QUIÉN?', 'Informe', '2017-11-01', NULL, '2017-12-11 19:44:01.336813', '2017-12-11 19:44:08.79849');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (137, 'CONTROVERSIA N.° 205. DOSSIER INTERCULTURALIDAD, CONVIVENCIAS Y GOBERNANZAS TERRITORIALES (DICIEMBRE 2015)', 'Revista', '2017-12-07', NULL, '2017-12-11 19:44:27.430707', '2017-12-11 19:45:03.948884');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (138, 'CIEN DÍAS VISTOS POR CINEP N.° 91: EL CONFLICTO DESPUÉS DE LOS FUSILES', 'Revista', '2017-12-08', NULL, '2017-12-11 19:45:28.110106', '2017-12-11 19:45:34.661222');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (139, 'DEL OTRO LADO DE LA MURALLA', 'Libro', '2017-12-11', NULL, '2017-12-11 19:46:01.542126', '2017-12-11 19:46:01.542126');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (140, 'DESPOJAR Y DESPLAZAR: ESTRATEGIA PARA EL DESARROLLO DE LA ORINOQUÍA', 'Informe ', '2017-12-11', NULL, '2017-12-11 19:46:43.522074', '2017-12-11 19:46:43.522074');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (141, 'LA GENTE DE LA MACARENA. COLONOS, CAMPESINOS E INSTITUCIONALIDAD LOCAL EN LA CONFIGURACIÓN SOCIAL DEL TERRITORIO', 'Libro', '2018-05-10', NULL, '2018-05-10 15:34:55.525964', '2018-05-10 15:34:55.525964');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (142, 'BASE DE DATOS DE LUCHAS SOCIALES', '', '2018-05-31', NULL, '2018-06-01 02:50:00.258997', '2018-06-01 02:50:00.258997');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (143, 'CAMINOS INTERCULTURALES EN LA REGIÓN CARIBE I', 'Cartilla equipo de interculturalidad/ Comunidades', '2018-07-27', NULL, '2018-07-27 20:52:06.226493', '2018-07-27 20:52:06.226493');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (144, 'CAMINOS INTERCULTURALES EN LA REGIÓN CARIBE II', 'Cartilla Equipo Interculturalidad/Comunidades', '2018-07-27', NULL, '2018-07-27 20:53:03.977123', '2018-07-27 20:53:03.977123');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (145, 'CAMINOS INTECULTURALES EN LA REGIÓN CARIBE III', 'Cartilla Equipo Interculturalidad/Comunidades', '2018-07-27', NULL, '2018-07-27 20:53:40.558475', '2018-07-27 20:53:40.558475');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (146, 'IDENTIDAD CULTURAL Y MEMORIA. INVESTIGACIONES PARTICIPATIVAS DE JÓVENES WIWAS DE LA SIERRA NEVADA DE SANTA MARTA', 'Cartilla incluida en caja de herramientas titulada "De aquí no nos sacan"', '2018-07-27', NULL, '2018-07-27 20:55:35.664751', '2018-07-27 20:55:35.664751');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (147, 'MEMORIA, TERRITORIO Y PARTICIPACIÓN. UNA MIRADA DE LOS Y LAS JÓVENES A CERRO DE LA POPA', 'Cartilla incluida en caja de herramientas titulada "De aquí no nos sacan"', '2018-07-27', NULL, '2018-07-27 20:56:01.383412', '2018-07-27 20:56:01.383412');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (148, 'AGUA Y MUJER. HISTORIAS, CUENTOS Y MÁS SOBRE NOSOTRAS Y KASOLÜ EN EL RESGUARDO WAYUU LOMAMATO', 'Cartilla incluida en caja de herramientas titulada "De aquí no nos sacan"', '2018-07-27', NULL, '2018-07-27 20:56:24.746841', '2018-07-27 20:56:24.746841');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (149, 'HUELLAS DEL DESTIERRO: MEMORIAS SOBRE LA REDUCCIÓN DEL TERRITORIO DE LAS COMUNIDADES AFRO EN EL SUR DE LA GUAJIRA', 'Cartilla caja de herramientas titulada "De aquí no nos sacan"', '2018-07-27', NULL, '2018-07-27 21:04:32.233565', '2018-07-27 21:04:32.233565');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (150, 'SABORES Y SABERES DE MI TABACO', 'Cartilla incluida en caja de herramientas titulada "De aquí no nos sacan"', '2018-07-27', NULL, '2018-07-27 21:05:07.257657', '2018-07-27 21:05:07.257657');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (151, 'LA GENTE DE LA MACARENA', 'Colección Odecofi Territorio, Poder y Conflicto', '2018-07-27', NULL, '2018-07-27 21:10:09.34375', '2018-07-27 21:10:09.34375');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (152, 'SISTEMATIZACIÓN PARTICIPATIVA DE DIECISIETE EXPERIENCIAS DE PAZ EN COLOMBIA', 'Cartilla. ', '2018-07-27', NULL, '2018-07-27 21:10:43.077069', '2018-07-27 21:10:43.077069');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (153, '¿CUÁL ESTADO PARA CUÁL CIUDADANÍA? PARADOJAS Y DISYUNCIONES DE LA MODERNIZACIÓN DEL ESTADO EN COLOMBIA', 'Colección Odecofi. Territorio, Poder y Conflicto', '2018-07-27', NULL, '2018-07-27 21:11:21.392975', '2018-07-27 21:11:21.392975');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (154, 'CIEN DÍAS N.° 92. UN FUTURO INCIERTO', 'Revista institucional', '2018-07-27', NULL, '2018-07-27 21:12:06.24496', '2018-07-27 21:12:06.24496');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (155, 'CONTROVERSIA 206 TERRITORIOS Y CONSTRUCCIÓN DE PAZ', 'Revista institucional', '2018-07-27', NULL, '2018-07-27 21:13:15.487248', '2018-07-27 21:13:15.487248');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (156, 'CONTROVERSIA 207 EL MUNDO DEL TRABAJO EN EL POSACUERDO', 'Revista institucional', '2018-07-27', NULL, '2018-07-27 21:13:44.259347', '2018-07-27 21:13:44.259347');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (157, 'CONTROVERSIA 208 NEOEXTRACTIVISMO', 'Revista Institucional', '2018-07-27', NULL, '2018-07-27 21:14:05.315641', '2018-07-27 21:14:05.315641');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (158, 'SIVEL PRO', 'Suscripción', '2018-09-04', NULL, '2018-09-04 14:23:57.027521', '2018-09-04 14:23:57.027521');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (159, 'ARCHIVO DE PRENSA', '', '2018-09-04', NULL, '2018-09-04 14:24:17.763165', '2018-09-04 14:24:17.763165');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (160, 'BASE DE DATOS DE DINÁMICAS DEL CONFLICTO', '', '2018-09-04', NULL, '2018-09-04 14:24:30.165252', '2018-09-04 14:24:30.165252');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (161, 'BASES DE DATOS DE INICIATIVAS DE PAZ', '', '2018-09-04', NULL, '2018-09-04 14:26:32.116157', '2018-09-04 14:26:32.116157');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (162, 'NOCHE Y NIEBLA 57', '', '2018-10-18', NULL, '2018-10-18 12:24:03.037336', '2018-10-18 12:24:31.096508');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (163, 'CRECER', '', '2018-11-01', NULL, '2018-11-01 14:29:28.086838', '2018-11-01 14:29:28.086838');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'NOCHE Y NIEBLA 51', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'CASO TIPO TRUJILLO', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.publicacion_id_seq', 163, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: redactor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'RED PRODEPAZ', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'INTERNATIONAL COALITION FOR THE RESPONSABILITY  TO PROTECT', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'MESA DE TRABAJO SOBRE PNI Y EXHUMACIONES HUMANITARIAS EN COLOMBIA', 'Es un espacio informal que ha surgido como consecuencia de la Audiencia del 19 de juilio de 2010 en La Macarena (Meta) y luego con el proceso de exhumaciones humanitarias adelantada en Charras Guaviare en septiembre de 2013 y enero de 2014', '2015-07-02', NULL, '2015-07-02 14:16:57.350316', '2015-07-02 14:16:57.350316');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'RED DE BANCOS DE DATOS', '', '2015-07-06', NULL, '2015-07-06 19:43:05.67861', '2015-07-06 19:43:05.67861');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'COORDINACION REGIONAL DEL PACIFICO-CRPC', '', '2016-04-28', NULL, '2016-04-28 15:36:23.15526', '2016-04-28 15:36:23.15526');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INTERNATIONAL LAND COALITION', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ASOCIACIÓN LATINOAMERICANA DE ORGANIZACIONES DE PROMOCIÓN AL DESARROLLO A.C', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'CONSEJO LATINOAMERICANO  DE CIENCIAS SOCIALES', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'NO APLICA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'OTRA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (150, 'MESA SOCIAL POR LA PAZ', NULL, '2017-03-31', NULL, '2017-03-31 00:00:00', '2017-03-31 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (151, 'PAZ COMPLETA', NULL, '2017-03-31', NULL, '2017-03-31 00:00:00', '2017-03-31 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (152, 'MEDIATION SUPORT NETWORK ', NULL, '2017-03-31', NULL, '2017-03-31 00:00:00', '2017-03-31 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'COORDINACIÓN EUROPA-ESTADOS UNIDOS', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ALIANZA POST-LONDRES', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'RED DE ONG POR LA TRANSPARENCIA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'MESA AMBIENTAL DE LOS CERROS ORIENTALES  BOGOTÁ', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SINERGIA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'VIVA LA CIUDADANÍA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'INSTITUTO INTERAMERICANO DE DERECHOS HUMANOS', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.redactor (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'RED DE CENTROS SOCIALES DE LA COMPAÑÍA DE JESÚS EN AMERICA LATINA', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: redactor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.redactor_id_seq', 152, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: regiongrupo; Type: TABLE DATA; Schema: public; Owner: -
--


--
-- Name: regiongrupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.regiongrupo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sectorapc; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'ENTES UNIVERSITARIOS AUTÓNOMOS', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ESTADÍSTICAS', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'FUNCIÓN PÚBLICA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'HACIENDA Y CRÉDITO PÚBLICO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'INCLUSIÓN SOCIAL Y RECONCILIACIÓN', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'INTELIGENCIA ESTRATÉGICA Y CONTRAINTELIGENCIA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'INTERIOR', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'JUSTICIA Y DEL DERECHO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'MINAS Y ENERGÍA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'ORGANISMOS AUTÓNOMOS', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'AGRICULTURA Y DESARROLLO RURAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'ORGANISMOS DE CONTROL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'ORGANIZACIÓN ELECTORAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'PLANEACIÓN', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'PRESIDENCIA DE LA REPÚBLICA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'PROTECCIÓN SOCIAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'RAMA JUDICIAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'RAMA LEGISLATIVA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'RELACIONES EXTERIORES', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'SALUD Y PROTECCIÓN SOCIAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'TRANSPORTE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'AMBIENTE Y DESARROLLO SOSTENIBLE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'VIVIENDA CIUDAD Y TERRITORIO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CIENCIA, TECNOLOGÍA E INNOVACIÓN, COMERCIO, INDUSTRIA Y TURISMO', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'CORPORACIONES AUTÓNOMAS REGIONALES Y DE DESARROLLO SOSTENIBLE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CULTURA', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'DEFENSA NACIONAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'DEPORTE', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');
INSERT INTO public.sectorapc (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'EDUCACIÓN NACIONAL', NULL, '2018-04-20', NULL, '2018-04-20 00:00:00', '2018-04-20 00:00:00');


--
-- Name: sectorapc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sectorapc_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipoanexo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'INFORME NARRATIVO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-18 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'PUBLICACIÓN', 'Publicación que es resultado de proyecto.', '2016-08-29', NULL, '2016-08-29 16:04:04.281782', '2016-08-29 16:04:04.281782');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'PROYECTO APROBADO', '', '2018-05-07', NULL, '2018-05-07 20:58:30.967071', '2018-05-07 20:58:30.967071');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'CONVENIO', '', '2018-05-07', NULL, '2018-05-07 20:58:50.907941', '2018-05-07 20:58:50.907941');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'CONTRATO', '', '2018-05-07', NULL, '2018-05-07 20:59:00.56765', '2018-05-07 20:59:00.56765');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'ANEXO PROCEDIMIENTOS Y REQUISITOS', '', '2018-05-07', NULL, '2018-05-07 21:01:21.87277', '2018-05-07 21:01:21.87277');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'ADENDA', '', '2018-05-07', NULL, '2018-05-07 21:02:25.89866', '2018-05-07 21:02:25.89866');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'INFORME FINANCIERO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACUSE DE RECIBIDO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FORMATO DE SOLICITUD', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'OTRO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');


--
-- Name: tipoanexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipoanexo_id_seq', 107, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipocontrato; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 1);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (2, 'CONTRATO DE APRENDIZAJE', '', '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-20 17:12:14.736184', 2);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (3, 'CONTRATO HONORARIOS', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 3);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (4, 'CONTRATO LABORAL  T. FIJO', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (5, 'CONTRATO LABORAL  T. FIJO  1/2 T.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (6, 'CONTRATO LABORAL  T. INDF.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (7, 'CONVENIO INTERINST.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 5);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (8, 'CONVENIO PASANTIA', '', '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-23 14:34:24.213114', 2);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (9, 'CONVENIO VOLUNTARIADO', '', '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-26 17:21:22.437722', 5);


--
-- Name: tipocontrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipocontrato_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipoconvenio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ACTA DE COMPROMISO ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'CONVENIO DE COLABORACIÓN Y MUTUA AYUDA ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'CONVENIO DE COMODATO', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'CONVENIO DE COOPERACIÓN', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'CONVENIO DE DONACIÓN ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'CONVENIO DE OBRA ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'CONVENIO DE PRÁCTICAS', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'CONVENIO ESPECIFÍCO ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'CONVENIO ESPECIFÍCO DE COOPERACIÓN ACADÉMICA', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'CONVENIO ESPECÍFICO PARA EL DESARROLLO DEL CONTRATO DE SUBVENCIÓN ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'CONVENIO MARCO DE COOPERACIÓN ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACUERDO DE ARTICULACIÓN INTERINSTITUCIONAL', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ACUERDO DE COORDINACIÓN Y PPOYO ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ALIANZA DE COLABORACIÓN INTERINSTITUCIONAL ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'CONTRATO DE CESIÓN DE DERECHOS PATRIMONIALES DE AUTOR ', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');
INSERT INTO public.tipoconvenio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CONTRATO DE COMODATO', NULL, '2017-08-16', NULL, '2017-08-16 00:00:00', '2017-08-16 00:00:00');


--
-- Name: tipoconvenio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipoconvenio_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipomoneda; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PESO', 'COP', '$', 170, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'EURO', 'EUR', '€', NULL, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'DÓLAR', 'USD', 'US$', 840, '', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-05-12 19:15:03.691469');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FRANCO SUIZO', 'CHF', 'CHF', 756, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'LIBRA INGLESA', 'GBP', '£', 826, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CORONA SUECA', 'SEK', 'kr', 752, '', '2016-05-13', NULL, '2016-05-13 17:02:06.717417', '2016-05-13 17:02:06.717417');


--
-- Name: tipomoneda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipomoneda_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipoproductopf; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'OTRO', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'LIBRO/REVISTA IMPRESO', '', '2017-05-01', NULL, '2017-05-01 00:00:00', '2018-02-19 21:32:19.26011');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'PUBLICACIÓN', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'INFORME', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'REVISTA', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'AUDIOVISUAL', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PROGRAMA RADIAL', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CARTILLA', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'CARPETA PEDAGÓGICA', NULL, '2018-04-13', NULL, '2018-04-13 00:00:00', '2018-04-13 00:00:00');


--
-- Name: tipoproductopf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipoproductopf_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--


INSERT INTO public.sip_grupo VALUES (158, 'Coordinador(a) Gerencia Administrativa y Financiera', NULL, '2018-04-25', NULL, '2018-04-25 15:13:59.747375', '2018-06-18 03:08:40.373087', '2018-06-17', 'CoordinadorGerenciaAdministrativaYFinanciera', 542, 1);
INSERT INTO public.sip_grupo VALUES (159, 'Desactivados', '', '2018-04-25', NULL, '2018-04-25 15:14:00.507427', '2018-06-18 03:08:40.485033', '2018-06-17', 'Desactivados', 541, 1);
INSERT INTO public.sip_grupo VALUES (102, 'OficinaTI', '', '2017-04-18', NULL, '2017-04-19 04:28:14.370409', '2018-06-18 03:08:40.795698', '2018-06-17', 'OficinaTI', 510, 2);
INSERT INTO public.sip_grupo VALUES (149, 'Coordinador(a) Educación Intercultural', NULL, '2018-04-11', NULL, '2018-04-11 14:09:15.124618', '2018-06-18 03:08:40.335989', '2018-06-17', 'CoordinadorEducacionIntercultural', 534, 3);
INSERT INTO public.sip_grupo VALUES (107, 'Gestión de Calidad', '', '2017-11-07', NULL, '2017-11-07 17:11:40.604459', '2018-06-18 03:08:40.573837', '2018-06-17', 'GestionDeCalidad', 515, 2);
INSERT INTO public.sip_grupo VALUES (122, 'Línea Mediación y Reconciliación', '', '2018-03-20', NULL, '2018-03-20 20:50:17.337779', '2018-06-18 03:08:40.765242', '2018-06-17', 'LineaMediacionYReconciliacion', 524, 3);
INSERT INTO public.sip_grupo VALUES (115, 'Línea Conflicto y Estado', '', '2018-03-20', NULL, '2018-03-20 20:33:44.33627', '2018-06-18 03:08:40.620204', '2018-06-17', 'LineaConflictoYEstado', 517, 3);
INSERT INTO public.sip_grupo VALUES (123, 'Línea Movimientos Sociales', '', '2018-03-20', NULL, '2018-03-20 20:50:49.211547', '2018-06-18 03:08:40.781975', '2018-06-17', 'LineaMovimientosSociales', 525, 3);
INSERT INTO public.sip_grupo VALUES (10, 'Sistema de Información General', '', '2017-04-17', NULL, '2017-04-18 02:37:32.189506', '2018-06-18 03:08:40.812702', '2018-06-17', 'SistemaDeInformacionGeneral', 507, 2);
INSERT INTO public.sip_grupo VALUES (150, 'Coordinador(a) Escuela de Paz y Convivencia Ciudadana', NULL, '2018-04-11', NULL, '2018-04-11 14:09:15.300279', '2018-06-18 03:08:40.354266', '2018-06-17', 'CoordinadorEscuelaDePazYConvivenciaCiudadana', 535, 3);
INSERT INTO public.sip_grupo VALUES (116, 'Línea Cultura de Paz y Ciudadanías', '', '2018-03-20', NULL, '2018-03-20 20:35:16.598449', '2018-11-13 11:38:07.073553', '2018-11-13', 'LineaCulturaDePazYCiudadanias', 518, 3);
INSERT INTO public.sip_grupo VALUES (152, 'Coordinador(a) Gestión del Territorio en el Pacífico', NULL, '2018-04-11', NULL, '2018-04-11 14:09:15.708632', '2018-06-18 03:08:40.408598', '2018-06-17', 'CoordinadorGestionDelTerritorioEnElPacfico', 536, 3);
INSERT INTO public.sip_grupo VALUES (128, 'Área Ciudadanías e Iniciativas de Paz y Reconciliación', '', '2018-04-02', NULL, '2018-04-02 15:58:47.371319', '2018-06-18 03:08:40.102782', '2018-06-17', 'AreaCiudadaniasEIniciativasDePazYReconciliacion', 502, 3);
INSERT INTO public.sip_grupo VALUES (153, 'Coordinador(a) Iniciativas de Paz', NULL, '2018-04-11', NULL, '2018-04-11 14:09:15.907009', '2018-06-18 03:08:40.423396', '2018-06-17', 'CoordinadorIniciativasDePaz', 537, 3);
INSERT INTO public.sip_grupo VALUES (131, 'Tutor Ciudadanías e Iniciativas de Paz y Reconciliación', '', '2018-04-04', NULL, '2018-04-04 20:32:39.466205', '2018-06-18 03:08:40.831656', '2018-06-17', 'TutorCiudadaniasEIniciativasDePazYReconciliacion', 528, 3);
INSERT INTO public.sip_grupo VALUES (156, 'Tutor Conflicto Estado y Desarrollo', NULL, '2018-04-11', NULL, '2018-04-11 14:09:21.592697', '2018-06-18 03:08:40.84687', '2018-06-17', 'TutorConflictoEstadoYDesarrollo', 528, 3);
INSERT INTO public.sip_grupo VALUES (114, 'Gestión Humana', NULL, '2017-12-25', NULL, '2017-12-25 22:59:18.84933', '2018-06-27 14:17:32.226713', '2018-06-27', 'GestionHumana', 514, 2);
INSERT INTO public.sip_grupo VALUES (163, 'Coordinador(a) Derechos Humanos y Derecho Internacional Humanitario', NULL, '2018-06-07', NULL, '2018-06-08 04:38:21.679279', '2018-11-13 12:17:14.641225', '2018-11-13', 'CoordinadorDerechosHumanosYDerechoInternacionalHumanitario', 544, 1);
INSERT INTO public.sip_grupo VALUES (151, 'Coordinador(a) Gerencia de Proyectos', NULL, '2018-04-11', NULL, '2018-04-11 14:09:15.481531', '2018-09-21 21:26:20.54382', '2018-09-21', 'CoordinadorGerenciaDeProyectos', 540, 4);
INSERT INTO public.sip_grupo VALUES (117, 'Línea Derecho a la Tierra y al Territorio', '', '2018-03-20', NULL, '2018-03-20 20:35:52.69211', '2018-06-18 03:08:40.652866', '2018-06-17', 'LineaDerechoALaTierraYAlTerritorio', 519, 3);
INSERT INTO public.sip_grupo VALUES (118, 'Línea Educación Intercultural', '', '2018-03-20', NULL, '2018-03-20 20:36:26.481138', '2018-12-21 14:31:40.233012', '2018-12-21', 'LineaEducacionIntercultural', 520, 3);
INSERT INTO public.sip_grupo VALUES (164, 'Coordinador(a) Línea Mediación y Reconciliació', NULL, '2018-06-07', NULL, '2018-06-08 04:38:21.830799', '2018-06-18 03:08:40.437774', '2018-06-17', 'CoordinadorMediacionYReconciliacion', 538, 1);
INSERT INTO public.sip_grupo VALUES (154, 'Coordinador Línea Mediación y Reconciliació', NULL, '2018-04-11', '2018-06-07', '2018-04-11 14:09:16.217609', '2018-06-08 04:38:22.448139', NULL, 'CoordinadorLneaMediacinyReconciliaci', 538, 3);
INSERT INTO public.sip_grupo VALUES (132, 'Tutor Derechos Humanos y Derecho Internacional Humanitario', '', '2018-04-04', NULL, '2018-04-04 20:35:37.088148', '2018-06-18 03:08:40.860649', '2018-06-17', 'TutorDerechosHumanosYDerechoInternacionalHumanitario', 529, 3);
INSERT INTO public.sip_grupo VALUES (5, 'Área Conflicto, Estado y Desarrollo', '', '2017-04-17', NULL, '2017-04-18 02:28:41.555879', '2018-06-18 03:08:40.150223', '2018-06-17', 'AreaConflictoEstadoYDesarrollo', 511, 3);
INSERT INTO public.sip_grupo VALUES (129, 'Área Derechos Humanos y Derecho Internacional Humanitario', '', '2018-04-02', NULL, '2018-04-02 15:58:48.188847', '2018-06-18 03:08:40.177115', '2018-06-17', 'AreaDerechosHumanosYDerechoInternacionalHumanitario', 503, 3);
INSERT INTO public.sip_grupo VALUES (108, 'Área Movilización, Territorio e Interculturalidad', '', '2017-12-04', NULL, '2017-12-04 18:36:54.814336', '2018-06-18 03:08:40.212486', '2018-06-17', 'AreaMovilizacionTerritorioEInterculturalidad', 516, 3);
INSERT INTO public.sip_grupo VALUES (145, 'Usuarios', '', '2018-04-11', NULL, '2018-04-11 12:56:12.09958', '2018-12-21 14:31:40.324082', '2018-12-21', 'Usuarios', 500, 1);
INSERT INTO public.sip_grupo VALUES (1, 'Comunicaciones', '', '2017-04-17', NULL, '2017-04-18 02:06:48.436533', '2018-06-18 03:08:40.229367', '2018-06-17', 'Comunicaciones', 501, 2);
INSERT INTO public.sip_grupo VALUES (147, 'Coordinador(a) Conflicto y Estado', NULL, '2018-04-11', NULL, '2018-04-11 14:09:14.586111', '2018-06-18 03:08:40.283427', '2018-06-17', 'CoordinadorConflictoYEstado', 531, 3);
INSERT INTO public.sip_grupo VALUES (155, 'Coordinador(a) Movimientos Sociales', NULL, '2018-04-11', NULL, '2018-04-11 14:09:16.416894', '2018-06-18 03:08:40.452129', '2018-06-17', 'CoordinadorMovimientosSociales', 539, 3);
INSERT INTO public.sip_grupo VALUES (3, 'Dirección', '', '2017-04-17', NULL, '2017-04-18 02:07:19.340156', '2018-06-18 03:08:40.499108', '2018-06-17', 'Direccion', 506, 4);
INSERT INTO public.sip_grupo VALUES (133, 'Tutor Movilización, Territorio e Interculturalidad', '', '2018-04-04', NULL, '2018-04-04 20:36:54.319968', '2018-06-18 03:08:40.876031', '2018-06-17', 'TutorMovilizacionTerritorioEInterculturalidad', 530, 3);
INSERT INTO public.sip_grupo VALUES (119, 'Línea Escuela de Paz y Convivencia Ciudadana', '', '2018-03-20', NULL, '2018-03-20 20:40:31.911728', '2018-06-18 03:08:40.710394', '2018-06-17', 'LineaEscuelaDePazYConvivenciaCiudadana', 521, 3);
INSERT INTO public.sip_grupo VALUES (120, 'Línea Gestión del Territorio en el Pacífico', '', '2018-03-20', NULL, '2018-03-20 20:49:08.239233', '2018-06-18 03:08:40.730867', '2018-06-17', 'LineaGestionDelTerritorioEnElPacifico', 522, 3);
INSERT INTO public.sip_grupo VALUES (121, 'Línea Iniciativas de Paz', '', '2018-03-20', NULL, '2018-03-20 20:49:39.427358', '2018-06-18 03:08:40.748515', '2018-06-17', 'LineaIniciativasDePaz', 523, 3);
INSERT INTO public.sip_grupo VALUES (148, 'Coordinador(a) Derecho a la Tierra y al Territorio', NULL, '2018-04-11', NULL, '2018-04-11 14:09:14.970804', '2018-06-18 03:08:40.303925', '2018-06-17', 'CoordinadorDerechoALaTierraYAlTerritorio', 533, 3);
INSERT INTO public.sip_grupo VALUES (113, 'Externos', '', '2017-12-25', NULL, '2017-12-25 22:59:18.695372', '2018-12-21 14:39:35.902948', '2018-12-21', 'Externos', 508, 2);
INSERT INTO public.sip_grupo VALUES (8, 'Gerencia Administrativa y Financiera', '', '2017-04-17', NULL, '2017-04-18 02:35:40.232482', '2018-06-18 03:08:40.534474', '2018-06-17', 'GerenciaAdministrativaYFinanciera', 504, 2);
INSERT INTO public.sip_grupo VALUES (165, 'Línea Derechos Humanos y Derecho Internacional Humanitario', '', '2018-06-07', NULL, '2018-06-08 04:38:22.051101', '2018-11-06 03:29:08.341887', '2018-11-05', 'LineaDerechosHumanosYDerechoInternacionalHumanitario', 543, 1);
INSERT INTO public.sip_grupo VALUES (9, 'Gerencia de Proyectos', '', '2017-04-17', NULL, '2017-04-18 02:36:09.744232', '2018-08-20 19:22:59.380959', '2018-08-20', 'GerenciaDeProyectos', 509, 2);


------ Plan trienal


      INSERT INTO public.cor1440_gen_financiador (id, nombre, observaciones, fechacreacion, created_at, updated_at)
      VALUES (102, 'INSTITUCIONAL', 'DADO QUE NO FUE FINANCIADO POR NINGUNA DE LAS AGENCIAS QUE FINANCIAN NUESTRO PROYECTO', '2016-03-08', '2016-03-08', '2016-03-08');

      INSERT INTO public.cor1440_gen_proyectofinanciero (id, nombre, observaciones, fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at, monto, referencia, referenciacinep, fuentefinanciador, respagencia, emailrespagencia, telrespagencia, fechaliquidacion, tipomoneda_id, saldo, acuse, sucursal, centrocosto, cuentasbancarias, contrapartida, anotacionescontab, gestiones, presupuestototal, aportecinep, otrosaportescinep, empresaauditoria, copiasdesoporte, reportarrendimientosfinancieros, reinvertirrendimientosfinancieros, autenticarcompulsar, anotacionesdb, anotacionesrh, anotacionesre, anotacionesinf, apresupuesto, aaportes, aotrosfin, aotrosesp, respgp_id, estado, dificultad, objeto, observacionestramite, observacionesejecucion, observacionescierre, fechaformulacion, montopesos) VALUES (18, 'PLAN QUINQUENAL 2018-2022', '', '2018-01-01', '2022-12-31', NULL, NULL, '2017-12-06 17:45:46.07918', '2017-12-06 17:52:04.303047', 1.00, 'PLAN QUINQUENAL 2018-2022', 'PLAN QUINQUENAL 2018-2022', '', '', '', '', NULL, 1, NULL, false, NULL, '', '', NULL, '', '', 1.00, NULL, '', '', false, false, false, false, '', '', '', '', '', '', NULL, '', NULL, 'E', 'M', NULL, '', '', '', '2017-10-10', 1.0);

      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (18, 18, 'E1', 'Las comunidades y organizaciones sociales acompañadas por Cinep/PPP son reconocidas como interlocutoras claves por la institucionalidad pública y otros actores de la sociedad de las regiones y localidades donde actúan, y junto con ellos avanzan en la generación de condiciones para la reconciliación.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (19, 18, 'E2', 'Las víctimas de violencia política, víctimas del modelo de desarrollo y de otras violaciones de DD. HH., y las organizaciones acompañantes apoyadas por Cinep/PPP, impulsan iniciativas para garantizar sus derechos.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (20, 18, 'E3', 'Los entes territoriales y regionales, las organizaciones sociales y el sector privado favorecen la formulación e implementación de políticas públicas con un enfoque territorial y de derechos, y basadas en la promoción de la convivencia, el reconocimiento de las diferencias y las transformaciones de las desigualdades.');

      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (18, 18, 18, 'E1', 'Uso de productos');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (19, 18, 19, 'E2', 'Uso de productos');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (20, 18, 20, 'E3', 'Uso de productos');

      INSERT INTO public.cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir, fechacreacion, created_at, updated_at) VALUES (18, 'E1I1', 1, '(1) Actores acompañados que participaron en los espacios de dialogo y que están implicados en el conflicto territorial.', '', '', 'Número de espacios de diálogo', 'Sumatoria de los espacios de dialogo propociados a nivel local, regional y nacional', '2019-06-25', '2019-06-25', '2019-06-25');
      INSERT INTO public.cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir, fechacreacion, created_at, updated_at) VALUES (19, 'E1I2', 2, '(1) Actor que es organización de mujeres en regiones que ha consolidado iniciativas con enfoque de género y fortalece sus capacidades ciudadanas para la incidencia.', '', 'Actor elegido es acompañado por CINEP y es organización de mujeres', 'Número de regiones', 'Cuenta de regiones diferentes donde hay organizaciones de mujeres que han consolidando incitativas con enfoque de genero para la incidencia.', '2019-06-25', '2019-06-25', '2019-06-25');
      INSERT INTO public.cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir, fechacreacion, created_at, updated_at) VALUES (20, 'E2I1', 1, '(1) Actor social.  (2) Nombre de la acción colectiva para incidir en el reconocimiento de los derechos de las víctimas de violencia política y del modelo de desarrollo, así como de sus organizaciones y comunidades. ', '', 'El actor social debe cubrir al menos una de las regiones priorizadas por el plan.', 'Porcentaje de org. acompañadas', '100*Cuenta de organizaciones acompañadas con este efecto / Cuenta de organizaciones acompañadas', '2019-06-25', '2019-06-25', '2019-06-25');
      INSERT INTO public.cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir, fechacreacion, created_at, updated_at) VALUES (21, 'E3I1', 2, '(1) Actor, (2) Nombre del mecanismo de interlocución o espacio de interlocución o espacio de incidencia con participación, (3) nombres de actores que formulan políticas públicas que participaron en espacio', '', '', 'Número de mec. interl y esp inc.', 'Cuenta de nombres de mecanismos de interlocución o espacios de incidencia con en efectos con este tipo de indicador.', '2019-06-25', '2019-06-25', '2019-06-25');
      INSERT INTO public.cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir, fechacreacion, created_at, updated_at) VALUES (22, 'E3I2', 2, '(1) Actor social que formula política pública, (2) Nombre de la política pública', '', 'El actor social debe formular políticas públicas (añadir a tipología de Sectores sociales)', 'Número de políticas públicas', 'Cuenta de nombres de políticas públicas en efectos con este indicador', '2019-06-25', '2019-06-25', '2019-06-25');

      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (18, 18, 18, 'E1I1', 'A 2022, Cinep/PPP ha propiciado al menos diez  escenarios de diálogo, en los que participen  actores (institucionalidad publica, sector privado, organizaciones sociales) implicados en los conflictos de los territorios.', 18);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (19, 18, 18, 'E1I2', 'En tres de las regiones donde Cinep/PPP trabaja, las mujeres y sus organizaciones han consolidado iniciativas con enfoque de género y fortalecen sus capacidades ciudadanas para la incidencia.', 19);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (20, 18, 19, 'E2I1', 'A 2022, al menos 50 % de las organizaciones acompañadas, en las regiones priorizadas por el plan, realizan al menos una acción colectiva para incidir en el reconocimiento de los derechos de las víctimas de violencia política y del modelo de desarrollo, así como de sus organizaciones y comunidades. ', 20);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (21, 18, 20, 'E3I1', 'Para 2022 organizaciones y comunidades acompañadas por Cinep/PPP hacen parte de 15 mecanismos de interlocución y espacios de incidencia con actores que formulan políticas públicas.', 21);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (22, 18, 20, 'E3I2', 'Para el 2022 al menos seis políticas públicas locales están formuladas y se implementan con el enfoque territorial, de género y de derechos aportado por Cinep/PPP.', 22);

      INSERT INTO public.coordinador_proyectofinanciero (proyectofinanciero_id, coordinador_id, created_at, updated_at) (SELECT 18, id, '2017-12-06 17:47:57.008977', '2017-12-06 17:47:57.008977' FROM public.usuario WHERE nusuario='mfvargas');
      INSERT INTO public.cor1440_gen_financiador_proyectofinanciero (financiador_id, proyectofinanciero_id) VALUES (102, 18); -- Institucional

      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) (SELECT id, 18 FROM public.sip_grupo WHERE nombre IN ('Archivo y Correspondencia', 'Comunicaciones', 'Contabilidad', 'Dirección', 'Equipo Ciudadanía y Paz', 'Equipo Conflicto, Estado y Desarrollo', 'Equipo Derechos Humanos', 'Equipo Movilización, Tierra y Territorios', 'Gerencia Administrativa y Financiera'));
