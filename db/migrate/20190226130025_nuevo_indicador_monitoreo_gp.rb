class NuevoIndicadorMonitoreoGp < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_tipoindicador (id, nombre, medircon, 
        espcampos, espvaloresomision, espvalidaciones, esptipometa, 
        espfuncionmedir) 
        VALUES (33, 'IG-SC-04', 3, 
        '', '', '', 'Porcentaje de productos a tiempo', 
        '(No. de productos a tiempo / No. de productos esperados)*100');
      INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id, 
        resultadopf_id, numero, indicador, tipoindicador_id) 
        VALUES (33, 19, 
        22, 'IG-SC-04', 'Porcentaje de productos a tiempo', 33);
      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, formulacion, frecuenciaanual, 
        created_at, updated_at, descd1, descd2, meta)
        VALUES (7, 19, 33, 
        '(No. de productos a tiempo / No. de productos esperados)*100',
        '2', '2019-02-26', '2019-02-26', 
        'No. de productos a tiempo', 
        'No. de productos esperados', '80');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (17, 7,
        '2018-01-01', '2018-06-30', '2018-I', '90');
      INSERT INTO cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
        finicio, ffin, restiempo, meta) VALUES (18, 7,
        '2018-07-01', '2018-12-31', '2018-II', '90');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_pmindicadorpf WHERE id IN ('17', '18');
      DELETE FROM cor1440_gen_mindicadorpf WHERE id='7'
      DELETE FROM cor1440_gen_indicadorpf WHERE id='33';
      DELETE FROM cor1440_gen_tipoindicador WHERE id='33';
    SQL
  end
end
