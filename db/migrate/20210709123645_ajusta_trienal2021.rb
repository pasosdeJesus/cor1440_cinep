class AjustaTrienal2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_actividadpf
        SET titulo='Comunicaciones: Publicación de un producto'
        WHERE id='322';

        UPDATE cor1440_gen_indicadorpf
        SET indicador='El 90% de las sedes de escuelas rurales acompañadas adoptan planes de transformación educativa, construyen una agenda educativa de acuerdo a sus necesidades étnicas y culturales en 2 municipios.'
        WHERE id='36';

        UPDATE cor1440_gen_indicadorpf
        SET indicador='En el 10% de los municipios PDET se han implementado estrategias que cualifican el debate público (posiciona nuevas narrativas) y escenarios de diálogo y concertación multiactor (activistas, autoridades civiles y policía nacional) encaminados a brindar mayores garantías para ejercer el derecho a protestar y la implementación adecuada del acuerdo de paz.'
        WHERE id='40';

        --O1.I1
        UPDATE cor1440_gen_pmindicadorpf SET meta='4' WHERE id='71';
        UPDATE cor1440_gen_pmindicadorpf SET meta='7' WHERE id='72';
        UPDATE cor1440_gen_pmindicadorpf SET meta='10' WHERE id='73';
        UPDATE cor1440_gen_pmindicadorpf SET meta='14' WHERE id='74';
        UPDATE cor1440_gen_pmindicadorpf SET meta='17' WHERE id='75';
        UPDATE cor1440_gen_pmindicadorpf SET meta='20' WHERE id='76';

        --O1.I2
        UPDATE cor1440_gen_pmindicadorpf SET meta='0' WHERE id='77';
        UPDATE cor1440_gen_pmindicadorpf SET meta='0' WHERE id='78';
        UPDATE cor1440_gen_pmindicadorpf SET meta='0' WHERE id='79';
        UPDATE cor1440_gen_pmindicadorpf SET meta='50' WHERE id='80';
        UPDATE cor1440_gen_pmindicadorpf SET meta='70' WHERE id='81';
        UPDATE cor1440_gen_pmindicadorpf SET meta='90' WHERE id='82';

        --O2.I1
        UPDATE cor1440_gen_pmindicadorpf SET meta='1' WHERE id='83';
        UPDATE cor1440_gen_pmindicadorpf SET meta='2' WHERE id='84';
        UPDATE cor1440_gen_pmindicadorpf SET meta='3' WHERE id='85';
        UPDATE cor1440_gen_pmindicadorpf SET meta='4' WHERE id='86';
        UPDATE cor1440_gen_pmindicadorpf SET meta='5' WHERE id='87';
        UPDATE cor1440_gen_pmindicadorpf SET meta='5' WHERE id='88';

        --O2.I2
        UPDATE cor1440_gen_pmindicadorpf SET meta='5' WHERE id='89';
        UPDATE cor1440_gen_pmindicadorpf SET meta='10' WHERE id='90';
        UPDATE cor1440_gen_pmindicadorpf SET meta='15' WHERE id='91';
        UPDATE cor1440_gen_pmindicadorpf SET meta='20' WHERE id='92';
        UPDATE cor1440_gen_pmindicadorpf SET meta='25' WHERE id='93';
        UPDATE cor1440_gen_pmindicadorpf SET meta='30' WHERE id='94';

        --O3.I1
        UPDATE cor1440_gen_pmindicadorpf SET meta='1' WHERE id='95';
        UPDATE cor1440_gen_pmindicadorpf SET meta='2' WHERE id='96';
        UPDATE cor1440_gen_pmindicadorpf SET meta='3' WHERE id='97';
        UPDATE cor1440_gen_pmindicadorpf SET meta='4' WHERE id='98';
        UPDATE cor1440_gen_pmindicadorpf SET meta='5' WHERE id='99';
        UPDATE cor1440_gen_pmindicadorpf SET meta='6' WHERE id='100';

        --O3.I2
        UPDATE cor1440_gen_pmindicadorpf SET meta='1' WHERE id='101';
        UPDATE cor1440_gen_pmindicadorpf SET meta='3' WHERE id='102';
        UPDATE cor1440_gen_pmindicadorpf SET meta='5' WHERE id='103';
        UPDATE cor1440_gen_pmindicadorpf SET meta='7' WHERE id='104';
        UPDATE cor1440_gen_pmindicadorpf SET meta='9' WHERE id='105';
        UPDATE cor1440_gen_pmindicadorpf SET meta='10' WHERE id='106';

        -- Indicadores relacionados con Cien Dias 

        INSERT INTO cor1440_gen_indicadorpf (id, proyectofinanciero_id,
          numero, indicador, tipoindicador_id, objetivopf_id)
          VALUES (73, 21, 'I2.3', 'Nueve (9) revistas Cien Dias, que analizan la coyontura nacional y regional del país.', 1, 40);


    SQL
  end
  def down
    execute <<-SQL

        DELETE FROM cor1440_gen_indicadorpf WHERE id=73;

        UPDATE cor1440_gen_pmindicadorpf SET meta='6' 
          WHERE id IN ('76', '82', '88', '94', '100', '106');
        UPDATE cor1440_gen_pmindicadorpf SET meta='5' 
          WHERE id IN ('75', '81', '87', '93', '99', '105');
        UPDATE cor1440_gen_pmindicadorpf SET meta='4' 
          WHERE id IN ('74', '80', '86', '92', '98', '104');
        UPDATE cor1440_gen_pmindicadorpf SET meta='3' 
          WHERE id IN ('73', '79', '85', '91', '97', '103');
        UPDATE cor1440_gen_pmindicadorpf SET meta='2' 
          WHERE id IN ('72', '78', '84', '90', '96', '102');
        UPDATE cor1440_gen_pmindicadorpf SET meta='1' 
          WHERE id IN ('71', '77', '83', '89', '95', '101');


        UPDATE cor1440_gen_indicadorpf
        SET indicador='En el 60% de los municipios PDET se han implementado estrategias que cualifican el debate público (posiciona nuevas narrativas) y escenarios de diálogo y concertación multiactor (activistas, autoridades civiles y policía nacional) encaminados a brindar mayores garantías para ejercer el derecho a protestar.'
        WHERE id='40';

      UPDATE cor1440_gen_indicadorpf
        SET indicador=' El 90% de las escuelas rurales adoptan planes de transformación educativa construyen una agenda educativa de acuerdo a sus necesidades étnicas y culturales en 3 regiones del país.'
        WHERE id='36';
      UPDATE cor1440_gen_indicadorpf
        SET 

      UPDATE cor1440_gen_actividadpf
        SET titulo='Comunicaciones: Publicaciones'
        WHERE id='322';

    SQL
  end
end
