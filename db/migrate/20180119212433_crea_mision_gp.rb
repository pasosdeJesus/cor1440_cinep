class CreaMisionGp < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_proyectofinanciero (id, nombre, observaciones, fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at, monto, referencia, referenciacinep, fuentefinanciador, respagencia, emailrespagencia, telrespagencia, fechaliquidacion, tipomoneda_id, saldo, acuse, sucursal, centrocosto, cuentasbancarias, contrapartida, anotacionescontab, gestiones, presupuestototal, aportecinep, otrosaportescinep, empresaauditoria, copiasdesoporte, reportarrendimientosfinancieros, reinvertirrendimientosfinancieros, autenticarcompulsar, anotacionesdb, anotacionesrh, anotacionesre, anotacionesinf, apresupuesto, aaportes, aotrosfin, aotrosesp, respgp_id, estado, dificultad, objeto, observacionestramite, observacionesejecucion, observacionescierre, fechaformulacion, montopesos, tasaformulacion_id) VALUES (19, 'MISIÓN INSTITUCIONAL DE GERENCIA DE PROYECTOS', '', '2017-01-01', NULL, NULL, NULL, '2018-01-19 17:45:46.07918', '2018-01-19 17:52:04.303047', 1.00, 'MISIÓN INSTITUCIONAL DE GERENCIA DE PROYECTOS', 'MISIÓN INSTITUCIONAL DE GERENCIA DE PROYECTOS', '', '', '', '', NULL, 1, NULL, false, NULL, '', '', NULL, '', '', 1.00, NULL, '', '', false, false, false, false, '', '', '', '', '', '', NULL, '', NULL, 'J', 'M', NULL, '', '', '', '2016-10-10', 1.0, NULL);

      INSERT INTO cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (21, 19, '1', 'Responder a objetivos 3 y 5 del sistema de calidad: 3 Construir propuestas regionales, alternativas y sostenibles de desarrollo humano y social.  5 Garantizar la sostenibilidad, permanencia y desarrollo del CINEP Programa por la Paz a corto, mediano y largo plazo.');

      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (21, 19, 21, '06', 'Formulación y Gestión de Proyectos');
      INSERT INTO cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (22, 19, 21, '07', 'Seguimiento y Control');

      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (23, 'IG-FG-01', 3, '', '', '', 'Porcentaje de proyectos', 'Numero de proyectos aprobados / Numero de convocatorias en la que participamos');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (24, 'IG-FG-02', 3, '', '', '', 'Porcentaje de convocatorias', '(No. de convocatorias en la que participamos / sobre linea base anual)*100');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (25, 'IG-FG-03', 3, '', '', '', 'Porcentaje de presupuesto', '(TOTAL DEL PRESUPUESTO DEL PLAN TRIENAL  EJECUTADA / PRESUPUESTO PLAN TRIENAL)*100');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (26, 'IG-SC-01', 3, '', '', '', 'Porcentaje de informes', '(No. de informes enviados a financiadores en el tiempo requerido / No. de informes enviados a financiadores)*100');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (27, 'IG-SC-02', 3, '', '', '', 'Porcentaje de informes', '(No. de informes narrativos devueltos por financiadores para correcciones y/o aclaraciones / No. de informes narrativos enviados a financiadores)*100');
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, espcampos, espvaloresomision, espvalidaciones, esptipometa, espfuncionmedir) VALUES (28, 'IG-SC-03', 3, '', '', '', 'Porcentaje de informes', '(No. de informes financieros devueltos por financiadores para correcciones y/o aclaraciones / No. de informes financieros enviados a financiadores)');

      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (23, 19, 21, 'IG-FG-01', 'Participacińo efectiva en las convocatorias', 23);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (24, 19, 21, 'IG-FG-02', 'En cuantas convocatorias participamos', 24);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (25, 19, 21, 'IG-FG-03', 'Porcentaje ejecutado de ingresos presupuestados para el Plan Trienal', 25);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (26, 19, 22, 'IG-SC-01', 'Número de informes que estamos enviado a tiempo a nuestros financiadores.  "A tiempo" significa: hasta cinco días hailes después del día previsto para entrega, si se pacata un cambio de feha con la fuente de financiación, esto debe quedar documentado por esrito - si la fecha es indicativa para un determinado contrato o conevnio, debe estar documentado y constar en el convenio o contrato, y estas condiciones espciales deben ser cumplida.', 26);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (27, 19, 22, 'IG-SC-02', 'Número de informes narrativos que estamos enviado en orden a nuestros financiadores (Entendemos por "DEVOLUCION": cuando el informe narrativo no se haya diligenciado en los formatos adecuados ni con la calidad requerida, según los requerimientos e instrucciones de la fuente de financiación. O de producto de insuficiente calidad, incompletos o con errores manfiestos.)', 27);
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id) VALUES (28, 19, 22, 'IG-SC-03', 'Número de informes financieros que estamos enviado en orden a nuestros financiadores ', 28);

      INSERT INTO coordinador_proyectofinanciero (proyectofinanciero_id, coordinador_id, created_at, updated_at) (SELECT 19, id, '2018-01-19 17:48:57.008977', '2018-01-19 17:47:57.008977' FROM usuario WHERE nusuario='msalazarp');
      INSERT INTO cor1440_gen_financiador_proyectofinanciero (financiador_id, proyectofinanciero_id) VALUES (102, 19); -- Institucional

      INSERT INTO grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) (SELECT id, 19 FROM sip_grupo WHERE nombre IN ('Gerencia Administrativa y Financiera'));
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM grupo_proyectofinanciero WHERE proyectofinanciero_id='19';
      DELETE FROM cor1440_gen_financiador_proyectofinanciero WHERE proyectofinanciero_id='19';
      DELETE FROM coordinador_proyectofinanciero WHERE proyectofinanciero_id='19';
      DELETE FROM cor1440_gen_indicadorpf WHERE proyectofinanciero_id='19';
      DELETE FROM cor1440_gen_tipoindicador WHERE id>='23' AND id<='28';
      DELETE FROM cor1440_gen_resultadopf WHERE proyectofinanciero_id='19';
      DELETE FROM cor1440_gen_objetivopf WHERE proyectofinanciero_id='19';
      DELETE FROM cor1440_gen_proyectofinanciero WHERE id='19';
    SQL
  end
end
