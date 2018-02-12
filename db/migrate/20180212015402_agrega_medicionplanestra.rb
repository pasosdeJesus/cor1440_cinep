class AgregaMedicionplanestra < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, frecuenciaanual, created_at, 
        updated_at, descd1, descd2, descd3, meta) VALUES (
        10, 18, 18, 2, '2018-02-08', '2018-02-08', '', '', '', 10);
      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, frecuenciaanual, created_at, 
        updated_at, descd1, descd2, descd3, meta) VALUES (
        11, 18, 19, 2, '2018-02-08', '2018-02-08', 'Organizaciones de mujeres que han consolidado y fortalecido', 'Regiones', '' ,3);
      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, frecuenciaanual, created_at, 
        updated_at, descd1, descd2, descd3, meta) VALUES (
        12, 18, 20, 2, '2018-02-08', '2018-02-08', 'Organizaciones que realizaron al menos una acción colectiva', 'Total de actores priorizados por el plan', '' ,50);
      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, frecuenciaanual, created_at, 
        updated_at, descd1, descd2, descd3, meta) VALUES (
        13, 18, 21, 2, '2018-02-08', '2018-02-08', 'Número de mecanismos de interlocución y espacios de incidencia con actores que formulan políticas públicas', '', '' , 15);
      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, frecuenciaanual, created_at, 
        updated_at, descd1, descd2, descd3, meta) VALUES (
        14, 18, 22, 2, '2018-02-08', '2018-02-08', 'Número de políticas públicas locales formulados con enfoque territorial, de género y de derechos', '', '' , 6);

      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (20, 10,
        '2017-07-01', '2017-12-31', '2017-II', '10');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (21, 10,
        '2018-01-01', '2018-06-30', '2018-I', '10');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (30, 11,
        '2017-07-01', '2017-12-31', '2017-II', '3');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (31, 11,
        '2018-01-01', '2018-06-30', '2018-I', '3');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (40, 12,
        '2017-07-01', '2017-12-31', '2017-II', '50');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (41, 12,
        '2018-01-01', '2018-06-30', '2018-I', '50');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (50, 13,
        '2017-07-01', '2017-12-31', '2017-II', '15');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (51, 13,
        '2018-01-01', '2018-06-30', '2018-I', '15');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (60, 14,
        '2017-07-01', '2017-12-31', '2017-II', '6');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (61, 14,
        '2018-01-01', '2018-06-30', '2018-I', '6');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_pmindicadorpf WHERE id>='20' AND id<='61';
      DELETE FROM cor1440_gen_mindicadorpf WHERE id>='10' AND id<='14';
    SQL
  end
end
