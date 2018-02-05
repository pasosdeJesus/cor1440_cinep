class AgregaPmindicadorpf < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      SELECT pg_catalog.setval('cor1440_gen_pmindicadorpf_id_seq', 1001, false);
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (1, 1, '2018-02-05', '2017-01-01', '2017-06-30', '2017-I', '60');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (2, 2, '2018-02-05', '2016-01-01', '2016-12-31', '2016', '30');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (3, 3, '2018-02-05', '2015-01-01', '2017-12-31', '2015-2017', '80');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (4, 4, '2018-02-05', '2017-01-01', '2017-06-30', '2017-I', '80');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (5, 5, '2018-02-05', '2017-01-01', '2017-06-30', '2017-I', '2');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (6, 6, '2018-02-05', '2017-01-01', '2017-06-30', '2017-I', '2');

      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (7, 1, '2018-02-05', '2017-07-01', '2017-12-31', '2017-II', '60');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (8, 2, '2018-02-05', '2017-01-01', '2017-12-31', '2017', '30');

      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (9, 3, '2018-02-05', '2018-01-01', '2020-12-31', '2018-2012', '80');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (10, 4, '2018-02-05', '2017-07-01', '2017-12-31', '2017-II', '30');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (11, 5, '2018-02-05', '2017-07-01', '2017-12-31', '2017-II', '2');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id,
        fecha,finicio, ffin, restiempo, meta) 
        VALUES (16, 2, '2018-02-05', '2017-07-01', '2017-12-31', '2017-II', '2');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_pmindicadorpf WHERE id>='1' AND id<='16';
    SQL
  end
end
