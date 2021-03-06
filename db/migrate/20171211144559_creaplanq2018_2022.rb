class Creaplanq20182022 < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_financiador (id, nombre, observaciones, fechacreacion, created_at, updated_at)
      VALUES (102, 'INSTITUCIONAL', 'DADO QUE NO FUE FINANCIADO POR NINGUNA DE LAS AGENCIAS QUE FINANCIAN NUESTRO PROYECTO', '2016-03-08', '2016-03-08', '2016-03-08');

      INSERT INTO cor1440_gen_proyectofinanciero (id, nombre, observaciones, fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at, monto, referencia, referenciacinep, fuentefinanciador, respagencia, emailrespagencia, telrespagencia, fechaliquidacion, tipomoneda_id, saldo, acuse, sucursal, centrocosto, cuentasbancarias, contrapartida, anotacionescontab, gestiones, presupuestototal, aportecinep, otrosaportescinep, empresaauditoria, copiasdesoporte, reportarrendimientosfinancieros, reinvertirrendimientosfinancieros, autenticarcompulsar, anotacionesdb, anotacionesrh, anotacionesre, anotacionesinf, apresupuesto, aaportes, aotrosfin, aotrosesp, respgp_id, estado, dificultad, objeto, observacionestramite, observacionesejecucion, observacionescierre, fechaformulacion, montopesos, tasaformulacion_id) VALUES (18, 'PLAN QUINQUENAL 2018-2022', '', '2018-01-01', '2022-12-31', NULL, NULL, '2017-12-06 17:45:46.07918', '2017-12-06 17:52:04.303047', 1.00, 'PLAN QUINQUENAL 2018-2022', 'PLAN QUINQUENAL 2018-2022', '', '', '', '', NULL, 1, NULL, false, NULL, '', '', NULL, '', '', 1.00, NULL, '', '', false, false, false, false, '', '', '', '', '', '', NULL, '', NULL, 'E', 'M', NULL, '', '', '', '2017-10-10', 1.0, NULL);

      INSERT INTO cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (18, 18, 'E1', 'Las comunidades y organizaciones sociales acompañadas por Cinep/PPP son reconocidas como interlocutoras claves por la institucionalidad pública y otros actores de la sociedad de las regiones y localidades donde actúan, y junto con ellos avanzan en la generación de condiciones para la reconciliación.');
      INSERT INTO cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (19, 18, 'E2', 'Las víctimas de violencia política, víctimas del modelo de desarrollo y de otras violaciones de DD. HH., y las organizaciones acompañantes apoyadas por Cinep/PPP, impulsan iniciativas para garantizar sus derechos.');
      INSERT INTO cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (20, 18, 'E3', 'Los entes territoriales y regionales, las organizaciones sociales y el sector privado favorecen la formulación e implementación de políticas públicas con un enfoque territorial y de derechos, y basadas en la promoción de la convivencia, el reconocimiento de las diferencias y las transformaciones de las desigualdades.');

      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (18, 18, 18, 'E1', 'Uso de productos');
      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (19, 18, 19, 'E2', 'Uso de productos');
      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (20, 18, 20, 'E3', 'Uso de productos');

      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (18, 'E1I1', 1, '(1) Actores acompañados que participaron en los espacios de dialogo y que están implicados en el conflicto territorial.', '', '', 'Número de espacios de diálogo', 'Sumatoria de los espacios de dialogo propociados a nivel local, regional y nacional');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (19, 'E1I2', 2, '(1) Actor que es organización de mujeres en regiones que ha consolidado iniciativas con enfoque de género y fortalece sus capacidades ciudadanas para la incidencia.', '', 'Actor elegido es acompañado por CINEP y es organización de mujeres', 'Número de regiones', 'Cuenta de regiones diferentes donde hay organizaciones de mujeres que han consolidando incitativas con enfoque de genero para la incidencia.');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (20, 'E2I1', 1, '(1) Actor social.  (2) Nombre de la acción colectiva para incidir en el reconocimiento de los derechos de las víctimas de violencia política y del modelo de desarrollo, así como de sus organizaciones y comunidades. ', '', 'El actor social debe cubrir al menos una de las regiones priorizadas por el plan.', 'Porcentaje de org. acompañadas', '100*Cuenta de organizaciones acompañadas con este efecto / Cuenta de organizaciones acompañadas');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (21, 'E3I1', 2, '(1) Actor, (2) Nombre del mecanismo de interlocución o espacio de interlocución o espacio de incidencia con participación, (3) nombres de actores que formulan políticas públicas que participaron en espacio', '', '', 'Número de mec. interl y esp inc.', 'Cuenta de nombres de mecanismos de interlocución o espacios de incidencia con en efectos con este tipo de indicador.');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (22, 'E3I2', 2, '(1) Actor social que formula política pública, (2) Nombre de la política pública', '', 'El actor social debe formular políticas públicas (añadir a tipología de Sectores sociales)', 'Número de políticas públicas', 'Cuenta de nombres de políticas públicas en efectos con este indicador');

      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (18, 18, 18, 'E1I1', 'A 2022, Cinep/PPP ha propiciado al menos diez  escenarios de diálogo, en los que participen  actores (institucionalidad publica, sector privado, organizaciones sociales) implicados en los conflictos de los territorios.', 18);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (19, 18, 18, 'E1I2', 'En tres de las regiones donde Cinep/PPP trabaja, las mujeres y sus organizaciones han consolidado iniciativas con enfoque de género y fortalecen sus capacidades ciudadanas para la incidencia.', 19);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (20, 18, 19, 'E2I1', 'A 2022, al menos 50 % de las organizaciones acompañadas, en las regiones priorizadas por el plan, realizan al menos una acción colectiva para incidir en el reconocimiento de los derechos de las víctimas de violencia política y del modelo de desarrollo, así como de sus organizaciones y comunidades. ', 20);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (21, 18, 20, 'E3I1', 'Para 2022 organizaciones y comunidades acompañadas por Cinep/PPP hacen parte de 15 mecanismos de interlocución y espacios de incidencia con actores que formulan políticas públicas.', 21);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (22, 18, 20, 'E3I2', 'Para el 2022 al menos seis políticas públicas locales están formuladas y se implementan con el enfoque territorial, de género y de derechos aportado por Cinep/PPP.', 22);

      INSERT INTO coordinador_proyectofinanciero (proyectofinanciero_id, coordinador_id, created_at, updated_at) (SELECT 18, id, '2017-12-06 17:47:57.008977', '2017-12-06 17:47:57.008977' FROM usuario WHERE nusuario='mfvargas');
      INSERT INTO cor1440_gen_financiador_proyectofinanciero (financiador_id, proyectofinanciero_id) VALUES (102, 18); -- Institucional

      INSERT INTO grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) (SELECT id, 18 FROM sip_grupo WHERE nombre IN ('Archivo y Correspondencia', 'Comunicaciones', 'Contabilidad', 'Dirección', 'Equipo Ciudadanía y Paz', 'Equipo Conflicto, Estado y Desarrollo', 'Equipo Derechos Humanos', 'Equipo Movilización, Tierra y Territorios', 'Gerencia Administrativa y Financiera'));
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM grupo_proyectofinanciero WHERE proyectofinanciero_id='18';
      DELETE FROM cor1440_gen_financiador_proyectofinanciero WHERE proyectofinanciero_id='18';
      DELETE FROM coordinador_proyectofinanciero WHERE proyectofinanciero_id='18';
      DELETE FROM cor1440_gen_indicadorpf WHERE proyectofinanciero_id='18';
      DELETE FROM cor1440_gen_tipoindicador WHERE id>='18' AND id<='22';
      DELETE FROM cor1440_gen_resultadopf WHERE proyectofinanciero_id='18';
      DELETE FROM cor1440_gen_objetivopf WHERE proyectofinanciero_id='18';
      DELETE FROM cor1440_gen_proyectofinanciero WHERE id='18';
    SQL
  end
end
