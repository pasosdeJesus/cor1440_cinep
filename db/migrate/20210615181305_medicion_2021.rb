class Medicion2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, created_at, updated_at, descd1, descd2, descd3, meta, medircon, funcionresultado) VALUES (21, 21, 35, NULL, '2', '2021-06-15 17:01:19.697877', '2021-06-15 17:01:19.697877', NULL, NULL, NULL, NULL, 2, 'cuenta(Efectos_contribuyentes)');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, created_at, updated_at, descd1, descd2, descd3, meta, medircon, funcionresultado) VALUES (22, 21, 36, NULL, '2', '2021-06-15 17:02:46.075674', '2021-06-15 17:02:46.075674', NULL, NULL, NULL, NULL, 2, '1');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, created_at, updated_at, descd1, descd2, descd3, meta, medircon, funcionresultado) VALUES (23, 21, 37, NULL, '2', '2021-06-15 17:03:22.108158', '2021-06-15 17:03:22.108158', NULL, NULL, NULL, NULL, 1, 'cuenta(Actividades_contribuyentes)');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, created_at, updated_at, descd1, descd2, descd3, meta, medircon, funcionresultado) VALUES (24, 21, 38, NULL, '2', '2021-06-15 17:29:41.212137', '2021-06-15 17:29:41.212137', NULL, NULL, NULL, NULL, 2, 'cuenta(Efectos_contribuyentes)');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, created_at, updated_at, descd1, descd2, descd3, meta, medircon, funcionresultado) VALUES (25, 21, 39, NULL, '2', '2021-06-15 17:32:14.075021', '2021-06-15 17:32:14.075021', NULL, NULL, NULL, NULL, 2, 'cuenta(Efectos_contribuyentes)');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, created_at, updated_at, descd1, descd2, descd3, meta, medircon, funcionresultado) VALUES (26, 21, 40, NULL, '2', '2021-06-15 17:33:31.317344', '2021-06-15 17:59:35.527887', NULL, NULL, NULL, NULL, 2, '160');

      INSERT INTO public.cor1440_gen_datointermedioti (id, nombre, tipoindicador_id,
        nombreinterno, funcion, mindicadorpf_id) VALUES (21, 
        'Total de escuelas rurales en las 3 regiones', NULL, 
        'total_escuelas', 'cuenta(org)', 22);
      INSERT INTO public.cor1440_gen_datointermedioti (id, nombre, tipoindicador_id,
        nombreinterno, funcion, mindicadorpf_id) VALUES (22, 'Municipios PDET', 
        NULL, 'municipios_pdte', '170', 26);
      INSERT INTO public.cor1440_gen_actividadpf_mindicadorpf 
        (actividadpf_id, mindicadorpf_id) VALUES (10, 23);

      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (71, 21, '2021-01-01', '2021-06-30', '1 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (72, 21, '2021-01-01', '2021-12-31', '2 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (73, 21, '2021-01-01', '2022-06-30', '3 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (74, 21, '2021-01-01', '2022-12-31', '4 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (75, 21, '2021-01-01', '2023-06-30', '5 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (76, 21, '2021-01-01', '2023-12-31', '6 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (77, 22, '2021-01-01', '2021-06-30', '1 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (78, 22, '2021-01-01', '2021-12-31', '2 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (79, 22, '2021-01-01', '2022-06-30', '3 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (80, 22, '2021-01-01', '2022-12-31', '4 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (81, 22, '2021-01-01', '2023-06-30', '5 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (82, 22, '2021-01-01', '2023-12-31', '6 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (83, 23, '2021-01-01', '2021-06-30', '1 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (84, 23, '2021-01-01', '2021-12-31', '2 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (85, 23, '2021-01-01', '2022-06-30', '3 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (86, 23, '2021-01-01', '2022-12-31', '4 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (87, 23, '2021-01-01', '2023-06-30', '5 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (88, 23, '2021-01-01', '2023-12-31', '6 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (89, 24, '2021-01-01', '2021-06-30', '1 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (90, 24, '2021-01-01', '2021-12-31', '2 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (91, 24, '2021-01-01', '2022-06-30', '3 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (92, 24, '2021-01-01', '2022-12-31', '4 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (93, 24, '2021-01-01', '2023-06-30', '5 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (94, 24, '2021-01-01', '2023-12-31', '6 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (95, 25, '2021-01-01', '2021-06-30', '1 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (96, 25, '2021-01-01', '2021-12-31', '2 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (97, 25, '2021-01-01', '2022-06-30', '3 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (98, 25, '2021-01-01', '2022-12-31', '4 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (99, 25, '2021-01-01', '2023-06-30', '5 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (100, 25, '2021-01-01', '2023-12-31', '6 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (101, 26, '2021-01-01', '2021-06-30', '1 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (102, 26, '2021-01-01', '2021-12-31', '2 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (103, 26, '2021-01-01', '2022-06-30', '3 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (104, 26, '2021-01-01', '2022-12-31', '4 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (105, 26, '2021-01-01', '2023-06-30', '5 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
      INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, finicio, ffin, restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, meta, resindicador, porcump, analisis, acciones, responsables, plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) VALUES (106, 26, '2021-01-01', '2023-12-31', '6 SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.cor1440_gen_pmindicadorpf 
        WHERE id>='71' AND id<='106';
      DELETE FROM public.cor1440_gen_actividadpf_mindicadorpf 
        WHERE  mindicadorpf_id = 23;
      DELETE FROM public.cor1440_gen_datointermedioti
        WHERE id>='21' AND id<='22';
      DELETE FROM public.cor1440_gen_mindicadorpf
        WHERE id>='21' AND id<='26';
    SQL
  end
end