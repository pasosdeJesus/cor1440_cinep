class HomologaPt20152017 < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_proyectofinanciero (id, nombre, observaciones, fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at, monto, referencia, referenciacinep, fuentefinanciador, respagencia, emailrespagencia, telrespagencia, fechaliquidacion, tipomoneda_id, saldo, acuse, sucursal, centrocosto, cuentasbancarias, contrapartida, anotacionescontab, gestiones, presupuestototal, aportecinep, otrosaportescinep, empresaauditoria, copiasdesoporte, reportarrendimientosfinancieros, reinvertirrendimientosfinancieros, autenticarcompulsar, anotacionesdb, anotacionesrh, anotacionesre, anotacionesinf, apresupuesto, aaportes, aotrosfin, aotrosesp, respgp_id, estado, dificultad, objeto, observacionestramite, observacionesejecucion, observacionescierre, fechaformulacion, montopesos, tasaformulacion_id) VALUES (20, 'PLAN TRIENAL Y BD 2015-2017', '', '2015-01-01', '2017-12-31', NULL, NULL, '2018-01-19 17:45:46.07918', '2018-01-19 17:52:04.303047', 1.00, 'PLAN TRIENAL Y BD 2015-2017', 'PLAN TRIENAL Y BD 2015-2017', '', '', '', '', NULL, 1, NULL, false, NULL, '', '', NULL, '', '', 1.00, NULL, '', '', false, false, false, false, '', '', '', '', '', '', NULL, '', NULL, 'J', 'M', NULL, '', '', '', '2014-10-10', 1.0, NULL);

      INSERT INTO cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (22, 20, 'OE.1', 'Al finalizar el proyecto, por lo menos en 36 escenarios de toma de decisión vinculados a procesos de transformación pacifica de núcleos de conflicto, los actores hacen uso de los insumos producidos por las investigaciones del Cinep');
      INSERT INTO cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (23, 20, 'OE.2', 'Por lo menos 46 actores sociales11 en 6 regiones del país participan de acciones colectivas que influyen en la transformación de núcleos y redes de conflictos referidos al modelo de crecimiento y desarrollo económico desigual, a la relación Estado – sociedad y a la construcción de identidades y memorias. ');
      INSERT INTO cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (24, 20, 'OE.3', 'Mantener memoria de campos usados por Banco de Datos en CRECER hasta 2017');

      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (23, 20, 22, 'ROE1', 'Resultados OE.1');
      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (24, 20, 23, 'ROE2', 'Resultados OE.2');
      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (25, 20, 24, 'ROE3', 'Resultados OE.3');

      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, objetivopf_id, numero, indicador, tipoindicador_id) VALUES (29, 20, 22, 'OE.1.I.1', 'Aumento anual del 30% en el número de escenarios de toma de decisión en los cuales se participa con los insumos de las investigaciones y/o los análisis orientados a la transformación de los núcleos de conflictos.', NULL);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, objetivopf_id, numero, indicador, tipoindicador_id) VALUES (30, 20, 22, 'OE.1.I.2', 'En el 2017, por lo menos el 80% de los actores entrevistados con los cuales el Cinep comparte escenarios de toma de decisión, usa la información y el análisis del Cinep para la transformación de los núcleos de conflicto en espacios de incidencia.', NULL);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, objetivopf_id, numero, indicador, tipoindicador_id) VALUES (31, 20, 23, 'OE.2.I.1', 'Al finalizar el proyecto, al menos el 90% de los actores sociales acompañados en acciones de incidencia implementan por lo menos una acción colectiva para influir en la transformación de núcleos de conflicto.', NULL);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, objetivopf_id, numero, indicador, tipoindicador_id) VALUES (32, 20, 23, 'OE.2.I.2', 'Por lo menos, el 40% de las acciones colectivas están vinculadas a la realización de derechos específicos de género y etnias', NULL);

      
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (40, 'ORGANIZACIÓN DE ACTIVIDAD DE FORMACIÓN', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (41, 'PARTICIPACIÓN EN ACTIVIDAD DE FORMACIÓN', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (42, 'PARTICIPACIÓN EN REUNIÓN EXTERNA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (43, 'PARTICIPACIÓN EN ESPACIO ESTRATÉGICO', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (44, 'MONITOREO, SUPERVISIÓN, EVALUACIÓN', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (45, 'ORGANIZACIÓN DE EVENTO CON ACTORES FUERA DE CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (46, 'RESPUESTA A SOLICITUD DE INFORMACIÓN', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (47, 'ORGANIZACIÓN DE CAMPAÑA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (48, 'MISIÓN HUMANITARIA / TRABAJO DE CAMPO', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (49, 'SEGUIMIENTO A CASO / ATENCIÓN VÍCTIMA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (50, 'TI: VISITA TÉCNICA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (51, 'TI: DESARROLLO DE SOFTWARE', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (52, 'TI: SOPORTE', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (53, 'TI: MANTENIMIENTO PREVENTIVO', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (54, 'TI: MANTENIMIENTO CORRECTIVO', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (55, 'ORGANIZACIÓN REUNIÓN INTERNA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (56, 'OTROS', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (57, 'PRODUCCIÓN DE LIBRO DENTRO DE CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (58, 'PRODUCCIÓN DE CAPÍTULOS DE LIBRO DENTRO DE CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (59, 'PRODUCCIÓN DE ARTÍCULO EN REVISTA CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (60, 'PRODUCCIÓN DE INFORME U OTRO DOCUMENTO DENTRO DE CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (61, 'PRODUCCIÓN DE CARTILLAS Y FOLLETOS INFORMATIVOS DENTRO DE CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (62, 'PRODUCCIÓN DE MATERIAL AUDIOVISUAL DENTRO DE CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (63, 'RESPUESTA  A CONSULTA EXTERNA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (64, 'RESPUESTA A CONSULTA INTERNA CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (65, 'ELABORACIÓN PIEZA DE COMUNICACION', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (66, 'TI: INSTALACIÓN/CONFIGURACIÓN DE INFRAESTRUCTURA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (67, 'APOYO ADMINISTRATIVO Y FINANCIERO BANDATOS', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (68, 'CAPTURA DE CASOS NO BÉLICOS EN SIVEL', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (69, 'PONENCIA / CONFERENCIA / CHARLA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (70, 'PUBLICACIÓN DE LIBRO, INFORME O DOCUMENTO EN CINEP', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (71, 'TI: PUBLICACIÓN DE SOFTWARE', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (72, 'TI: REQUERIMIENTOS', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (73, 'SISTEMATIZACIÓN DE ACCIONES BÉLICAS', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (74, 'ELABORACIÓN DE CASOS DE PRENSA', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (75, 'TRABAJOS DE INVESTIGACIÓN', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (76, 'ANÁLISIS DE CONTEXTOS TERRITORIALES', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (77, 'PRODUCCIÓN DE INFORMES PERIÓDICOS', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (78, 'ANÁLISIS DE DATOS ESTADÍSTICOS', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (79, 'CAMPOS BANCO DE DATOS', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (80, 'CAMPOS PLAN TRIENAL', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (81, 'CAMPOS PLAN TRIENAL OE1', '2018-03-15', '2018-03-15', '2018-03-15');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, created_at, updated_at) VALUES (82, 'CAMPOS PLAN TRIENAL OE2', '2018-03-15', '2018-03-15', '2018-03-15');

INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (20, 79, 'PROGRAMA-SERVICIO-PRODUCTO');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (21, 79, 'OBJETIVO');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (22, 79, '¿QUIEN CONVOCÓ?');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (23, 79, 'N');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (24, 79, 'PERSONAS ACOMPAÑADA O QUE PARTICIPAN');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (25, 79, 'MESTIZOS');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (26, 79, 'BLANCOS');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (27, 79, 'DESARROLLO DE LA ACTIVIDAD');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (28, 79, 'RESULTADO');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (29, 79, 'COMPROMISOS-OBSERVACIONES');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (30, 79, 'VALORACIÓN');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (31, 80, 'PRINCIPAL NÚCLEO DE CONFLICTO');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (32, 80, 'OTROS NÚCLEOS DE CONFLICTO');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (33, 81, 'RED DE ACTORES ');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (34, 81, 'ALCANCE');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (35, 82, 'INCIDE EN TRANSFORMACIÓN DE NÚCLEOS DE CONFLICTO');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (36, 82, 'ACCIÓN COLECTIVA VINCULADA A DERECHOS DE GENERO');
INSERT INTO cor1440_gen_campoact (id, actividadtipo_id, nombrecampo) VALUES (37, 82, 'ACCIÓN COLECTIVA VINCULADA A DERECHOS DE ETNIA');


      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (40, 20, 25, 'A1', 'ORGANIZACIÓN DE ACTIVIDAD DE FORMACIÓN', 40);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (41, 20, 25, 'A2', 'PARTICIPACIÓN EN ACTIVIDAD DE FORMACIÓN', 41);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (42, 20, 25, 'A3', 'PARTICIPACIÓN EN REUNIÓN EXTERNA', 42);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (43, 20, 25, 'A4', 'PARTICIPACIÓN EN ESPACIO ESTRATÉGICO', 43);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (44, 20, 25, 'A6', 'MONITOREO, SUPERVISIÓN, EVALUACIÓN', 44);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (45, 20, 25, 'A7', 'ORGANIZACIÓN DE EVENTO CON ACTORES FUERA DE CINEP', 45);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (46, 20, 25, 'A8', 'RESPUESTA A SOLICITUD DE INFORMACIÓN', 46);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (47, 20, 25, 'A10', 'ORGANIZACIÓN DE CAMPAÑA', 47);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (48, 20, 25, 'A11', 'MISIÓN HUMANITARIA / TRABAJO DE CAMPO', 48);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (49, 20, 25, 'A12', 'SEGUIMIENTO A CASO / ATENCIÓN VÍCTIMA', 49);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (50, 20, 25, 'A15', 'TI: VISITA TÉCNICA', 50);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (51, 20, 25, 'A101', 'TI: DESARROLLO DE SOFTWARE', 51);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (52, 20, 25, 'A102', 'TI: SOPORTE', 52);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (53, 20, 25, 'A103', 'TI: MANTENIMIENTO PREVENTIVO', 53);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (54, 20, 25, 'A104', 'TI: MANTENIMIENTO CORRECTIVO', 54);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (55, 20, 25, 'A106', 'ORGANIZACIÓN REUNIÓN INTERNA', 55);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (56, 20, 25, 'A107', 'OTROS', 56);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (57, 20, 25, 'A109', 'PRODUCCIÓN DE LIBRO DENTRO DE CINEP', 57);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (58, 20, 25, 'A110', 'PRODUCCIÓN DE CAPÍTULOS DE LIBRO DENTRO DE CINEP', 58);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (59, 20, 25, 'A111', 'PRODUCCIÓN DE ARTÍCULO EN REVISTA CINEP', 59);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (60, 20, 25, 'A113', 'PRODUCCIÓN DE INFORME U OTRO DOCUMENTO DENTRO DE CINEP', 60);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (61, 20, 25, 'A114', 'PRODUCCIÓN DE CARTILLAS Y FOLLETOS INFORMATIVOS DENTRO DE CINEP', 61);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (62, 20, 25, 'A115', 'PRODUCCIÓN DE MATERIAL AUDIOVISUAL DENTRO DE CINEP', 62);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (63, 20, 25, 'A116', 'RESPUESTA  A CONSULTA EXTERNA', 63);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (64, 20, 25, 'A117', 'RESPUESTA A CONSULTA INTERNA CINEP', 64);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (65, 20, 25, 'A118', 'ELABORACIÓN PIEZA DE COMUNICACION', 65);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (66, 20, 25, 'A119', 'TI: INSTALACIÓN/CONFIGURACIÓN DE INFRAESTRUCTURA', 66);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (67, 20, 25, 'A120', 'APOYO ADMINISTRATIVO Y FINANCIERO BANDATOS', 67);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (68, 20, 25, 'A121', 'CAPTURA DE CASOS NO BÉLICOS EN SIVEL', 68);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (69, 20, 25, 'A122', 'PONENCIA / CONFERENCIA / CHARLA', 69);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (70, 20, 25, 'A123', 'PUBLICACIÓN DE LIBRO, INFORME O DOCUMENTO EN CINEP', 70);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (71, 20, 25, 'A126', 'TI: PUBLICACIÓN DE SOFTWARE', 71);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (72, 20, 25, 'A128', 'TI: REQUERIMIENTOS', 72);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (73, 20, 25, 'A129', 'SISTEMATIZACIÓN DE ACCIONES BÉLICAS', 73);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (74, 20, 25, 'A130', 'ELABORACIÓN DE CASOS DE PRENSA', 74);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (75, 20, 25, 'A150', 'TRABAJOS DE INVESTIGACIÓN', 75);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (76, 20, 25, 'A152', 'ANÁLISIS DE CONTEXTOS TERRITORIALES', 76);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (77, 20, 25, 'A153', 'PRODUCCIÓN DE INFORMES PERIÓDICOS', 77);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (78, 20, 25, 'A154', 'ANÁLISIS DE DATOS ESTADÍSTICOS', 78);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (79, 20, 25, 'CBD', 'CAMPOS BANCO DE DATOS', 79);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (80, 20, 25, 'CPT', 'CAMPOS PLAN TRIENAL', 80);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (81, 20, 25, 'CPT1', 'CAMPOS PLAN TRIENAL OE1', 81);
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, resultadopf_id, nombrecorto, titulo, actividadtipo_id) VALUES (82, 20, 25, 'CPT2', 'CAMPOS PLAN TRIENAL OE2', 82);


      INSERT INTO cor1440_gen_financiador_proyectofinanciero (financiador_id, proyectofinanciero_id) VALUES (102, 20); -- Institucional

      INSERT INTO grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) (SELECT id, 19 FROM sip_grupo WHERE nombre LIKE ('%Derechos Humanos%'));
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM grupo_proyectofinanciero WHERE proyectofinanciero_id='20';
      DELETE FROM cor1440_gen_financiador_proyectofinanciero WHERE proyectofinanciero_id='20';
      DELETE FROM coordinador_proyectofinanciero WHERE proyectofinanciero_id='20';
      DELETE FROM cor1440_gen_indicadorpf WHERE proyectofinanciero_id='20';
      DELETE FROM cor1440_gen_actividadpf WHERE proyectofinanciero_id='20';
      DELETE FROM cor1440_gen_campoact WHERE actividadtipo_id>='79' AND actividadtipo_id<='82';
      DELETE FROM cor1440_gen_actividadtipo WHERE id>='40' AND id<='82';
      DELETE FROM cor1440_gen_tipoindicador WHERE id>='29' AND id<='32';
      DELETE FROM cor1440_gen_resultadopf WHERE proyectofinanciero_id='20';
      DELETE FROM cor1440_gen_objetivopf WHERE proyectofinanciero_id='20';
      DELETE FROM cor1440_gen_proyectofinanciero WHERE id='20';
    SQL
  end
end
