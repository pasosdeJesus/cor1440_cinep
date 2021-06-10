-- Volcado de tablas basicas

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: nivelrelacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ACTOR DE SENTIDO', 'Trabajamos para ellos misionalmente, son beneficiarios', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ACTOR ALIADO DE MISIÓN', 'Trabajamos con ellos como pares para lo misional', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACTOR ESTRATEGICO', 'Pueden financiarnos o nos ayudan en incidencia', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');
INSERT INTO public.nivelrelacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ACTOR DE INCIDENCIA', 'En quienes queremos influir para la toma de decisiones', '2018-02-02', NULL, '2018-02-02 00:00:00', '2018-02-02 00:00:00');


--
-- Name: nivelrelacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nivelrelacion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--


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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpestrategia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpestrategia (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpestrategia (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'E1: Educar', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpestrategia (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'E2: Organizar', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpestrategia (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'E3: Actuar políticamente', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpestrategia (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'E4: Protestar', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpestrategia (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'E5: Resistir', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpestrategia (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'No aplica', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');


--
-- Name: acpestrategia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpestrategia_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpactor1; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'Guerrillas', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'Iglesias', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'Narcotraficantes', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'Organismos de control y vigilancia del Estado', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'Órganos con potestad normativa', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'Órganos gubernamentales ejecutores', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'Órganos judiciales', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'Paramilitares', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'Partidos y movimientos políticos', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'Sectores y organizaciones sociales', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'Actores Internacionales', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'Armados sin especificar', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'Bandas y pandillas', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'Entes privados', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'Entidades mixtas y/o estatales', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'Estado y entidades gubernamentales', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'Fuerzas Armadas y de Policía', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor1 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'Grupos de "limpieza social"', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: acpactor1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpactor1_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpactor2; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, 1, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'Armados sin especificar', NULL, 3, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (100, 'Otros movimientos políticos', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'Otros partidos políticos', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'Padres de Familia', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'Paramilitares sin especificar', NULL, 17, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'Partidos y movimientos políticos sin especificar', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'Pensionados', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'Personas naturales', NULL, 5, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'Personerías Municipales', NULL, 13, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'Pobladores Urbanos', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'Pobladores urbano-rurales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'Asalariados sin afiliación sindical', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (110, 'Policía Nacional', NULL, 8, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (111, 'Polo Democrático Alternativo', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (112, 'Procuraduría General de la Nación', NULL, 13, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (113, 'Profesionales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (114, 'Reclusos', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (115, 'Representaciones diplomáticas', NULL, 2, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (116, 'Sector educativo', NULL, 5, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (117, 'Sector salud', NULL, 5, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (118, 'Sectores LGBTI', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (119, 'Sectores y organizaciones sociales sin especificar', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'Asalariados', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (120, 'Senado de la República', NULL, 14, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (121, 'Trabajadores independientes', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (122, 'Tribunales Administrativos', NULL, 16, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (123, 'Víctimas de la violencia y familiares', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (124, 'Viviendistas', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'Asambleas departamentales', NULL, 14, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'Autodefensas Campesinas de Córdoba y Urabá', NULL, 17, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'Autodefensas Gaitanistas de Colombia', NULL, 17, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'Autodefensas Unidas de Colombia - AUC', NULL, 17, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'Bacrim', NULL, 17, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'Bandas y pandillas sin especificar', NULL, 4, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'Cabildos indígenas - Autoridades Indígenas', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'Académicos e Intelectuales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'Cámara de Representantes', NULL, 14, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'Campesinos', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'Candidatos a cargos de elección popular', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'Coaliciones políticas y sociales', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'Comisarías - Intendencias', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'Comunales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'Comunidades virtuales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'Concejos municipales', NULL, 14, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'Congreso de la República', NULL, 14, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'Contraloría General de la República', NULL, 13, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'Actores Internacionales sin especificar', NULL, 2, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'Corporaciones Autónomas regionales', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'Corte Constitucional', NULL, 16, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'Corte Suprema de Justicia', NULL, 16, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'Defensoría del Pueblo', NULL, 13, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'Del orden departamental', NULL, 6, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'Del orden distrital', NULL, 6, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'Del orden nacional', NULL, 6, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'Desempleados', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'Desmovilizados de la guerrilla', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (39, 'Desmovilizados de los paramilitares', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'Adultos Mayores', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (40, 'Desmovilizados', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (41, 'Desplazados', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (42, 'Dirigentes políticos', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (43, 'ELN', NULL, 10, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (44, 'Ediles - Jales', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (45, 'Ejecutivo Departamental', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (46, 'Ejecutivo Distrital', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (47, 'Ejecutivo Municipal', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (48, 'Ejecutivo Nacional', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (49, 'Ejército Nacional', NULL, 8, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'Afrocolombianos', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (50, 'Ejército Popular de Liberación - EPL', NULL, 10, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (52, 'Empresas privadas', NULL, 5, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (53, 'Entes privados sin especificar', NULL, 5, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (54, 'Entidades culturales y/o deportivas', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (55, 'Entidades mixtas y/o estatales sin especificar', NULL, 6, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (56, 'Estado y entidades gubernamentales sin especificar', NULL, 7, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (57, 'Estudiantes Básica - Secundaria - Normalistas', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (58, 'Estudiantes Universitarios - Tecnológicos', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (59, 'Estudiantes', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'Águilas negras', NULL, 17, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (60, 'Exfuncionarios públicos', NULL, 7, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (61, 'FARC', NULL, 10, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (62, 'Fiscalías', NULL, 16, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (63, 'Fuerza Aérea', NULL, 8, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (64, 'Fuerzas Armadas y de Policía sin especificar', NULL, 8, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (65, 'Gobiernos extranjeros', NULL, 2, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (66, 'Gremios', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (67, 'Grupos de "limpieza social"', NULL, 9, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (68, 'Grupos Étnicos', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (69, 'Guerrillas sin especificar', NULL, 10, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'Alianzas de sectores sociales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (70, 'Iglesia Católica', NULL, 11, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (71, 'Iglesias sin especificar', NULL, 11, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (72, 'Indígenas', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (73, 'Iniciativas internacionales de Paz y DDHH', NULL, 2, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (74, 'Jóvenes', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (75, 'Jueces', NULL, 16, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (76, 'Justicia Penal Militar, Empleados de la Rama Judicial, Jurisdicciones especiales', NULL, 16, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (77, 'M19', NULL, 10, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (78, 'Marcha Patriótica', NULL, 18, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (79, 'Medios de comunicación', NULL, 5, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'Ambientalistas', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (80, 'Ministerio Público', NULL, 13, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (81, 'Mujeres', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (82, 'Narcotraficantes', NULL, 12, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (83, 'Niños - Niñas', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (84, 'ONG de DDHH y DIH', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (85, 'ONG y Agencias de cooperación', NULL, 2, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (86, 'ONG y Fundaciones', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (87, 'Obreros y trabajadores', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (88, 'Organismos de control y vigilancia del Estado sin especificar', NULL, 13, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (89, 'Organismos multilaterales', NULL, 2, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'Armada Nacional', NULL, 8, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (90, 'Organizaciones Cívicas', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (91, 'Organizaciones Internacionales', NULL, 2, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (92, 'Organizaciones Laborales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (93, 'Organizaciones Sindicales', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (94, 'Organizaciones por la paz', NULL, 19, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (95, 'Órganos con potestad normativa sin especificar', NULL, 14, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (96, 'Órganos gubernamentales ejecutores sin especificar', NULL, 15, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (97, 'Órganos judiciales sin especificar', NULL, 16, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (98, 'Otras Iglesias', NULL, 11, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpactor2 (id, nombre, observaciones, actor1_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (99, 'Otras guerrillas', NULL, 10, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: acpactor2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpactor2_id_seq', 124, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpcataccion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (1, 'SIN INFORMACIÓN', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-13 00:00:00', NULL);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (10, 'Declaraciones de zona de paz', 'Cuando grupos de población o entidades territoriales como los municipios reivindican su autonomía como población civil no combatiente y se declaran, abarcando el territorio en el que viven, como neutrales o no participantes en la confrontación armada y exigen que los actores armados reconozcan su territorio como zona de paz. Esta declaratoria no garantiza necesariamente que los actores armados respeten dicho esfuerzo de las comunidades y grupos por ponerse al margen del conflicto.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.494518', 6);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (11, 'Diálogos y negociaciones', 'Comprenden los diálogos y negociaciones entre actores armados y representantes de la sociedad civil y en algunos casos autoridades locales para encontrar alternativas parciales a situaciones de inseguridad y amenazas que se viven en una determinada zona. Aquí también se incluye procesos de negociación locales de diálogo o de negociación con grupos de milicias o bandas en zonas urbanas, especialmente en grandes ciudades del país. En las negociaciones entre el gobierno y las guerrillas sólo se incluyen aquellos eventos que implican participación activa de la sociedad civil en los mismos.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.427877', 4);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (12, 'Encuentros, foros o seminarios', 'Es una categoría que agrupa los eventos en que la finalidad es propiciar la reflexión y difusión acerca de la paz y permitir la expresión de las diversas posturas al respecto. Pueden ser reuniones de una cantidad de personas que participan de las disertaciones realizadas por expertos como es el caso de los seminarios, o de las discusiones que establece un grupo de invitados como se encuentra en los foros; además se contemplan los encuentros en general que se llevan a cabo como un espacio en el que se comparte diversas experiencias y se puede plantear algunos elementos de tipo organizativo.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.36653', 2);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (13, 'Marchas y concentraciones', 'Son acciones colectivas que hacen presencia temporal en los espacios públicos (marchas, mítines, concentraciones, peregrinaciones, platones, etc) para ejercer presión y protestar en rechazo a la violencia y demandar la búsqueda de soluciones hacia la paz. Generalmente son motivadas por actos específicos de violencia y una vez realizada la acción, la masa se disuelve, aunque normalmente la red de organizaciones subyacentes a la misma sigue operando.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.445605', 5);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (14, 'Organización y coordinación', 'Contempla las acciones que tienen como finalidad la creación, fortalecimiento o articulación de organizaciones que trabajan por la paz. Generalmente se manifiestan como reuniones de coordinación o creación de organizaciones que van a cubrir aspectos de la paz entendida como desarrollo integral de la sociedad.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.38968', 3);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (15, 'Otro tipo de acciones', 'Se ha establecido como un espacio en el que diversas manifestaciones o finalidades, que no están cubiertas por las anteriores, puedan ser recogidas.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.509511', 7);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (16, 'Paros y huelgas', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.4578', 5);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (17, 'Participación electoral', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.437408', 4);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (18, 'Premios y homenajes', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.378685', 2);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (19, 'Tomas y bloqueos', 'Las tomas se refieren a “la ocupación transitoria de entidades e instituciones públicas, no necesariamente estatales”. Y los bloqueos “son ocupaciones de calles y carreteras para obstaculizar el tránsito de personas y mercancías”. En ambos casos, son protestas en las que se implica el uso de la fuerza (en la mayoría de los casos sin recurso a la violencia) como medio para hacer sentir la presión.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.470164', 5);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (2, 'Acciones de memoria', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.30927', 2);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (3, 'Acciones de resistencia civil', 'Son acciones explicitas de resistencia activa de la población, normalmente no-violentas, ya sea contra la intervención por la fuerza de un actor armado (cuando la población “confronta” pacíficamente el actor armado que se quiere tomar un poblado), o contra acciones violentas o la amenaza de las mismas.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.482852', 6);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (4, 'Actos culturales y/o deportivos', 'Son aquellos que centran su manifestación en actos expresivos, simbólicos o de actividad física, para respaldar dinámicas sociales a favor de la paz o expresar el rechazo de la violencia. Se incluyen aquí manifestaciones artísticas como los festivales o conciertos, y deportivas como maratones u otros eventos deportivos ', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.318027', 2);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (5, 'Actos de reconciliación', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.326043', 2);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (6, 'Campañas o acciones educativas', 'Se ubican los eventos que se identifican con el fin de desarrollar procesos formativos por medio de los cuales se busca difundir posiciones o alternativas favorables a la paz y la resolución de conflictos. Las manifestaciones de esta finalidad son generalmente de dos tipos: unas limitadas a un grupo reducido de personas con las cuales se desarrollan actividades de tipo pedagógico (como son proyectos educativos, cursos o jornadas de trabajo) y otras que son acciones de carácter global buscando tener un impacto departamental o nacional (campañas).', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.336068', 2);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (7, 'Celebraciones o actos religiosos', 'Se ubican los eventos que se identifican con el fin de desarrollar procesos formativos por medio de los cuales se busca difundir posiciones o alternativas favorables a la paz y la resolución de conflictos. Las manifestaciones de esta finalidad son generalmente de dos tipos: unas limitadas a un grupo reducido de personas con las cuales se desarrollan actividades de tipo pedagógico (como son proyectos educativos, cursos o jornadas de trabajo) y otras que son acciones de carácter global buscando tener un impacto departamental o nacional (campañas).', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.352127', 2);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (8, 'Comunicados colectivos', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.398719', 4);
INSERT INTO public.acpcataccion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, estrategia_id) VALUES (9, 'Concertación ciudadana', 'Cuando se dan dinámicas de encuentro, negociación y deliberación, con amplia participación ciudadana, en las que se busca construir consensos que permitan definir acciones de decisión conjunta entre los diversos sectores sociales o amplios grupos de población. (García-Durán, 2006: 340) La concertación no sólo se da en escenarios de debate entre actores sociales y actores estatales para la construcción de políticas, sino también se da entre grupos de comunidades y ciudadanos. En el caso colombiano, los procesos de concertación han llegado a darse entre la sociedad civil y los grupos al margen de la ley.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:44:14.414193', 4);


--
-- Name: acpcataccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpcataccion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpcatmotivo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpcatmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'Paz negativa: denuncia y/o rechazo del conflicto armado, la violencia y las violaciones a los DDHH y el DIH', '', '2020-07-15', NULL, '2020-07-15 00:00:00', '2020-07-15 00:00:00');
INSERT INTO public.acpcatmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'Paz positiva: negociaciones y procesos de paz', '', '2020-07-15', NULL, '2020-07-15 00:00:00', '2020-07-15 00:00:00');
INSERT INTO public.acpcatmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'Paz positiva: búsqueda de alternativas', '', '2020-07-15', NULL, '2020-07-15 00:00:00', '2020-07-15 00:00:00');
INSERT INTO public.acpcatmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'Paz positiva: promoción de la paz', '', '2020-07-15', NULL, '2020-07-15 00:00:00', '2020-07-15 00:00:00');


--
-- Name: acpcatmotivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpcatmotivo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpcobertura; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'Local', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'Municipal', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'Nacional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'Regional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'Submunicipal', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'Con participación nacional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'Con participación nacional e internacional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'De carácter nacional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'De impacto internacional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'De impacto nacional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'Departamental', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'Distrital', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO public.acpcobertura (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'Internacional', '', '2020-07-14', NULL, '2020-07-14 00:00:00', '2020-07-14 00:00:00');


--
-- Name: acpcobertura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpcobertura_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpformap; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpformap (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpformap (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ORGANIZADA', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpformap (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'NO ORGANIZADA', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acpformap (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'NO APLICA', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: acpformap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpformap_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acpmotivo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acpmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, catmotivo_id) VALUES (1, 'SIN INFORMACIÓN', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-13 00:00:00', NULL);
INSERT INTO public.acpmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, catmotivo_id) VALUES (2, 'Amenazas y extorsiones', '', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:06:38.889725', 1);
INSERT INTO public.acpmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, catmotivo_id) VALUES (25, 'Secuestros y retenciones', 'a) Cuando el motivo de la acción colectiva es rechazar el que una de las organizaciones armadas ilegales retenga una persona con fines económicos o políticos (se incluyen los soldados o policías retenidos en enfrentamientos con la guerrilla). (García-Durán, 2006: 341) 
b) Es la privación de la libertad de una persona civil por parte de una organización insurgente, ya con el fin de obligarla a entregar una suma de dinero destinada a la financiación de dicha organización o de sus acciones bélicas, ya con el fin de enviar un mensaje, de producir un impacto en la opinión pública o impedir una determinada actividad de la víctima.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:06:38.982524', 1);
INSERT INTO public.acpmotivo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, catmotivo_id) VALUES (7, 'Combates y disputa del territorio', 'Cuando el motivo de la acción colectiva es la reacción ante la situación crítica que se genera y afecta a la población civil en razón de enfrentamientos y acciones armadas entre la fuerza pública y un grupo ilegal.', '2020-07-13', NULL, '2020-07-13 00:00:00', '2020-07-16 10:06:38.923443', 1);


--
-- Name: acpmotivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acpmotivo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: acppapel; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.acppapel (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acppapel (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ADVERSARIO', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acppapel (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'PARTICIPANTE', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.acppapel (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CONVOCANTE', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: acppapel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acppapel_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: areaestudios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'CIENCIAS SOCIALES', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INGENIERÍA', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'TÉCNICO', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.areaestudios (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'CINECIAS ADMINISTRATIVAS', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'ASESOR AUXILIAR 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'PROFESIONAL 1', '', '2016-04-22', '2018-04-16', '2016-04-22 16:37:42.454072', '2016-04-22 16:37:42.454072');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'PROFESIONAL 2', '', '2016-05-17', '2018-04-16', '2016-05-17 20:46:54.205211', '2016-05-17 20:46:54.205211');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'ASESOR DE PROYECTO', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'ASESOR JUNIOR DE INF. POLITICA Y PEDAG.', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
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
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'AUXILIAR DE CONTABILIDAD', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
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
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'PROFESIONAL EN CIENCICAS JURÍDICAS', 'http://empleoscolombianos.blogspot.com.co/2013/07/el-cinep-programa-por-la-paz-colombia.html', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'OTRO', NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'ASESOR ASISTENTE', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.cargo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'ASESOR AUXILIAR 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cargo_id_seq', 102, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: comunicado; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comunicado (id, nombre, observaciones, contenido, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 's_s', 'd', NULL, '2019-09-29', NULL, '2019-09-30 03:29:37.090057', '2019-09-30 10:26:17.352582');
INSERT INTO public.comunicado (id, nombre, observaciones, contenido, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'solicitud_de_autorizacion_del_tratamiento_de_datos_personales_encuesta', '', NULL, '2019-09-30', NULL, '2019-09-30 11:44:43.593619', '2019-09-30 11:44:43.706593');


--
-- Name: comunicado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comunicado_id_seq', 101, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: csivinivelgeo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.csivinivelgeo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivinivelgeo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'INTERNACIONAL', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivinivelgeo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'NACIONAL', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivinivelgeo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'LOCAL', 'Regional. Puede ser veredal, municipal, departamental o Región PDET', '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-07 19:18:44.756587');


--
-- Name: csivinivelgeo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.csivinivelgeo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: csivinivelresp; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.csivinivelresp (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivinivelresp (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'Primario', 'Actores con responsabilidad directa en la implementación', '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivinivelresp (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'Secundario', 'Actores con responsabilidad indirecta con la implementación', '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: csivinivelresp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.csivinivelresp_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: csivitema; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'Reforma rural integral', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'Participación política', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'Fin del conflicto', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'Solución al problema de las drogas ilícitas', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'Víctimas', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'Implementación, verificación y refrendación', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'Enfoque étnico', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.csivitema (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'Enfoque de género', NULL, '2020-08-11', NULL, '2020-08-11 00:00:00', '2020-08-11 00:00:00');


--
-- Name: csivitema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.csivitema_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: empresaps; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.empresaps (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
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

SELECT pg_catalog.setval('public.empresaps_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: escalaaltura3; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.escalaaltura3 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, '1 Alto', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaaltura3 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, '2 Medio', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaaltura3 (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, '3 Bajo', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: escalaaltura3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.escalaaltura3_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: escaladebilfuerte; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.escaladebilfuerte (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, '1 Muy débil', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escaladebilfuerte (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, '2 Débil', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escaladebilfuerte (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, '3 Promedio', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escaladebilfuerte (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, '4 Fuerte', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escaladebilfuerte (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, '5 Muy fuerte', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: escaladebilfuerte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.escaladebilfuerte_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: escalaempeoramejora; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.escalaempeoramejora (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, '1 Indiferente', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaempeoramejora (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, '2 Empeora mucho', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaempeoramejora (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, '3 Empeora', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaempeoramejora (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, '4 Mejora', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaempeoramejora (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, '5 Mejora mucho', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: escalaempeoramejora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.escalaempeoramejora_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: escalaindmuy; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.escalaindmuy (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, '1 Indiferente', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaindmuy (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, '2 Sin importancia', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaindmuy (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, '3 Poco importante', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaindmuy (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, '4 Importante', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
INSERT INTO public.escalaindmuy (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, '5 Muy importante', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');


--
-- Name: escalaindmuy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.escalaindmuy_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: fondopensiones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'COLFONDOS', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'OLD MUTUAL', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'PORVENIR', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');
INSERT INTO public.fondopensiones (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'PROTECCIÓN', NULL, '2018-04-25', NULL, '2018-04-25 00:00:00', '2018-04-25 00:00:00');


--
-- Name: fondopensiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fondopensiones_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: lineabase; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lineabase (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PLAN TRIENAL 2018-2020', NULL, '2021-06-03', NULL, '2021-06-03 00:00:00', '2021-06-03 00:00:00');
INSERT INTO public.lineabase (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'PLAN TRIENAL 2021-2023', NULL, '2021-06-03', NULL, '2021-06-03 00:00:00', '2021-06-03 00:00:00');


--
-- Name: lineabase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lineabase_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: lscobertura; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', 'SIN', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');
INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'DEPARTAMENTAL', 'D', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');
INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'INTERNACIONAL', 'I', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');
INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'MUNICIPAL', 'M', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');
INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'NACIONAL', 'N', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');
INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'REGIONAL', 'R', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');
INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'SUBMUNICIPAL', 'S', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');
INSERT INTO public.lscobertura (id, nombre, codigo, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'SUBREGIONAL', 'SR', '', '2020-07-22', NULL, '2020-07-22 00:00:00', '2020-07-22 00:00:00');


--
-- Name: lscobertura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lscobertura_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: niveleducacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.niveleducacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
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

SELECT pg_catalog.setval('public.niveleducacion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: perfilprofesional; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'PROFESIONAL 4', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'PROFESIONAL 5', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ANALISTA 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ANALISTA 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ANALISTA 3', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ANALISTA 4', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ANALISTA 5', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PROFESIONAL 1', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'PROFESIONAL 2', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');
INSERT INTO public.perfilprofesional (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'PROFESIONAL 3', NULL, '2018-04-14', NULL, '2018-04-14 00:00:00', '2018-04-14 00:00:00');


--
-- Name: perfilprofesional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.perfilprofesional_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: plantillacorreo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.plantillacorreo (id, nombre, contenido, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'INVITACIÓN A RESPONDER ENCUESTA PARA EL CINEP/PPP', NULL, NULL, '2019-08-27', NULL, '2019-08-27 09:41:48.486991', '2019-09-05 22:27:34.244791');


--
-- Name: plantillacorreo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plantillacorreo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: profesion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, 1, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
INSERT INTO public.profesion (id, nombre, observaciones, areaestudios_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'DERECHOS HUMANOS', NULL, 10, '2018-04-19', NULL, '2018-04-19 00:00:00', '2018-04-19 00:00:00');
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

SELECT pg_catalog.setval('public.profesion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIO', 'EL PRESENTE DOCUMENTO CONTIENE EL DESARROLLO TEMÁTICO DEL PRIMER TALLER DE FORMACIÓN DE NUEVOS LIDERAZGOS EN LA  SUBREGIÓN DEL BAJO ATRATO DEL EQUIPO CHOCÓ DEL CINEP-PROGRAMA POR LA PAZ. EN ESTE PRIMER MÓDULO, SE TRATARÁ EL TEMA  DE LEGISLACIÓN TERRITORIAL, NO SIN ANTES ECHAR UN VISTAZO A CONCEPTOS PREVIOS Y BÁSICOS PARA UN ADECUADO MANEJO DEL TEMA COMO: DERECHOS HUMANOS, DERECHOS  FUNDAMENTALES, CONSTITUCIÓN Y TIPOS DE NORMAS, QUE SON BASE PARA PODER  ENTENDER LA LEGISLACIÓN TERRITORIAL ACTUAL, SU SENTIDO Y SU ALCANCE.  A SU VEZ, SE BUSCA QUE EL TALLER NO SÓLO SIRVA PARA TRANSMITIR UN CONOCIMIENTO, SINO QUE LOS PARTICIPANTES LO ASUMAN DE
 UNA MANERA ANALÍTICA Y CRÍTICA. ES DECIR, QUE NO SE CONFORMEN CON SABER QUÉ DICE LA LEY, SINO QUE SEAN CAPACES DE CRITICARLA Y PROPONER ALTERNATIVAS DE ACUERDO CON SUS DINÁMICAS Y NECESIDADES COMUNITARIAS.  EL PROCESO DE FORMACIÓN QUE BRINDA EL TALLER ES INTEGRAL: SE RELACIONA CON EL ENTORNO SOCIAL COTIDIANO Y SE APOYA EN LA FORMACIÓN PERSONAL DE LOS PARTICIPANTES. ADEMÁS, BUSCA GENERAR CRÍTICA Y AUTOCRÍTICA, FORTALECIMIENTO ORGANIZATIVO, ASÍ COMO CONOCIMIENTO Y SENSIBILIZACIÓN PARA EMPRENDER LA EXIGIBILIDAD DE LOS DERECHOS. LA PUBLICACIÓN CONOCIENDO NUESTROS DERECHOS PARA GOBERNAR CORRECTAMENTE EN NUESTRO TERRITORIOPRETENDE DAR CUENTA DEL DESARROLLO TEMÁTICO DEL PRIMER TALLER, ASÍ COMO BRINDAR HERRAMIENTAS PARA QUE LOS PARTICIPANTES, COMO NUEVOS LÍDERES Y LIDERESAS QUE SERÁN, PUEDAN REPLICAR LO APRENDIDO EN SUS COMUNIDADES. ', '2015-12-07', NULL, '2015-12-07 18:04:33.682198', '2015-12-07 18:04:33.682198');
  INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'NOCHE Y NIEBLA 51', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');
INSERT INTO public.publicacion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'CASO TIPO TRUJILLO', NULL, '2015-06-30', NULL, '2015-06-30 00:00:00', '2015-06-30 00:00:00');


--
-- Name: publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.publicacion_id_seq', 112, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: regiongrupo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'COSTA-DH', '', 122, '2017-05-09', NULL, '2017-05-09 14:00:00.752746', '2017-10-26 12:51:10.249883');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'COSTA ATLÁNTICA', NULL, 74, '2018-06-04', NULL, '2018-06-04 00:00:00', '2021-05-19 11:59:44.936265');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'LLANOS', NULL, 74, '2018-06-04', NULL, '2018-06-04 00:00:00', '2021-05-19 11:59:44.944566');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'SUR OCCIDENTE', NULL, 74, '2018-06-04', NULL, '2018-06-04 00:00:00', '2021-05-19 11:59:44.947103');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'ANTIOQUIA', NULL, 74, '2018-06-04', NULL, '2018-06-04 00:00:00', '2021-05-19 11:59:44.929363');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'CENTRO', NULL, 148, '2018-06-04', NULL, '2018-06-04 00:00:00', '2021-05-19 11:59:44.933382');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'EJE CAFETERO', NULL, 74, '2018-06-04', NULL, '2018-06-04 00:00:00', '2021-05-19 11:59:44.939147');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'EXTERIOR', NULL, 74, '2018-06-04', NULL, '2018-06-04 00:00:00', '2021-05-19 11:59:44.941677');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'CARIBE', 'Plan quinquenal 2018-2022', NULL, '2017-10-25', NULL, '2017-10-25 00:00:00', '2017-10-25 00:00:00');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'FRONTERA COLOMBO VENEZOLANA', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 12:54:14.72199', '2017-10-26 12:54:14.72199');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'MAGDALENA MEDIO', 'Plan Quinquenal 2018-2022', 101, '2017-10-26', NULL, '2017-10-26 12:56:30.833328', '2017-10-26 12:56:30.833328');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'ANDINA', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:00:07.044693', '2017-10-26 13:00:07.044693');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'BOGOTA Y ALREDEDORES', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:01:14.728238', '2017-10-26 13:01:14.728238');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'ANDÉN PACÍFICO', 'Plan Quinquenal 2018-2022', NULL, '2017-10-26', NULL, '2017-10-26 13:02:18.195017', '2017-10-26 13:02:18.195017');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'ZONA PDET CATATUMBO', NULL, 156, '2020-08-11', NULL, '2020-08-11 00:00:00', '2020-08-11 00:00:00');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'ZONA PDET PACÍFICO MEDIO', NULL, 156, '2020-08-11', NULL, '2020-08-11 00:00:00', '2020-08-11 00:00:00');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'ZONA PDET SUR DE CÓRDOBA', NULL, 156, '2020-08-11', NULL, '2020-08-11 00:00:00', '2020-08-11 00:00:00');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'BOGOTÁ Y ALREDEDORES (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:15:58.127129', '2021-05-18 11:15:58.127129');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'CARIBE (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:29:36.510141', '2021-05-18 11:29:36.510141');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'ANDINA (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:54:10.350828', '2021-05-18 11:54:10.350828');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'ANDÉN PACÍFICO (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:56:55.289628', '2021-05-18 11:56:55.289628');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'AMAZONAS (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 11:59:40.97658', '2021-05-18 11:59:40.97658');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'FRONTERA COLOMBO VENEZOLANA (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 12:02:45.683991', '2021-05-18 12:02:45.683991');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'MAGDALENA MEDIO (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 12:03:33.611859', '2021-05-18 12:03:33.611859');
INSERT INTO public.regiongrupo (id, nombre, observaciones, grupo_id, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'ORINOCO (TRIENAL 2021-2023)', '', NULL, '2021-05-18', NULL, '2021-05-18 12:03:56.809076', '2021-05-18 12:03:56.809076');


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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipoanexo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'INFORME NARRATIVO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-18 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'INFORME FINANCIERO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ACUSE DE RECIBIDO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FORMATO DE SOLICITUD', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');
INSERT INTO public.tipoanexo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'OTRO', NULL, '2016-03-08', NULL, '2016-03-08 00:00:00', '2016-03-08 00:00:00');


--
-- Name: tipoanexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipoanexo_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipocontrato; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (1, 'SIN INFORMACIÓN', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 1);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (2, 'CONTRATO DE APRENDIZAJE', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 2);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (3, 'CONTRATO HONORARIOS', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 3);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (4, 'CONTRATO LABORAL  T. FIJO', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (5, 'CONTRATO LABORAL  T. FIJO  1/2 T.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (6, 'CONTRATO LABORAL  T. INDF.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 4);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (7, 'CONVENIO INTERINST.', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 5);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (8, 'PASANTIA', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 2);
INSERT INTO public.tipocontrato (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at, tiponomina_id) VALUES (9, 'VOLUNTARIO', NULL, '2018-04-17', NULL, '2018-04-17 00:00:00', '2018-04-17 00:00:00', 5);


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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipomoneda; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PESO', 'COP', '$', 170, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'LOCA', 'LOC', 'loc', 418, 'loca', '2017-10-16', NULL, '2017-10-16 20:00:13.656025', '2017-10-16 20:00:13.656025');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'EURO', 'EUR', '€', NULL, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'DÓLAR', 'USD', 'US$', 840, '', '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-05-12 19:15:03.691469');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FRANCO SUIZO', 'CHF', 'CHF', 756, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'LIBRA INGLESA', 'GBP', '£', 826, NULL, '2016-02-18', NULL, '2016-02-18 00:00:00', '2016-02-18 00:00:00');
INSERT INTO public.tipomoneda (id, nombre, codiso4217, simbolo, pais_id, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'CORONA SUECA', 'SEK', 'kr', 752, '', '2016-05-13', NULL, '2016-05-13 17:02:06.717417', '2016-05-13 17:02:06.717417');


--
-- Name: tipomoneda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipomoneda_id_seq', 101, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tipoproductopf; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'OTRO', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
INSERT INTO public.tipoproductopf (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'LIBRO', NULL, '2017-05-01', NULL, '2017-05-01 00:00:00', '2017-05-01 00:00:00');
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

