class Creaintermediospf < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      -- Plan trienal 2018-2020
      -- E1I2 mujeres
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (100, 'Organizaciones de mujeres que han consolidado y fortalecido iniciativas (solo de la línea base y sin tener en cuenta porcentaje de progreso)', 19);
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (101, 'Regiones (sin tener en cuenta porcentaje de progreso)', 19);
    SQL
    execute <<-SQL
      -- E2I1 
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (103, 'Organizaciones que realizaron al menos una acción colectiva', 20);
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (104, 'Total de actores priorizados por el plan', 20);
    SQL

    execute <<-SQL
      -- E3I1
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (105, 'Número de mecanismos de interlocución y espacios de incidencia con actores que formulan políticas públicas', 21);
    SQL

    execute <<-SQL
      -- E3I2
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (106, 'Número de políticas públicas locales formulados con enfoque territorial, de género y de derechos (sin tener en cuenta porcentaje de progreso)', 22);
    SQL

    execute <<-SQL
      -- Indicadores de proyectos
      -- IG-FG-01 Participación efectiva en las convocatorias 
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (107, 'Aprobados', 23);
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (108, 'Formulados', 23);
    SQL

    execute <<-SQL
      -- IG-SC-01 Porcentaje de informes que estamos enviado a tiempo
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (120, 'No. de informes enviados a financiadores en el tiempo requerido', 26);
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (121, 'No. de informes planeados para financiadores', 26);
    SQL

    execute <<-SQL
     -- IG-SC-02 Porcentaje de informes narrativos sin devoluciones 
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (125, 'No. de informes narrativos sin devoluciones', 27);
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (126, 'No. de informes narrativos enviados a financiadores', 27);
    SQL

    execute <<-SQL
     -- IG-SC-03 Porcentaje de informes financieros sin devoluciones 
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (130, 'No. de informes financieros sin devoluciones', 28);
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (131, 'No. de informes financieros enviados a financiadores', 28);
    SQL

    execute <<-SQL
     -- IG-SC-04 Porcentaje de productos a tiempo 
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (140, 'No. de productos a tiempo', 33);
      INSERT INTO cor1440_gen_datointermedioti (id, nombre, tipoindicador_id)
	VALUES (141, 'No. de productos esperados', 33);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_datointermedioti WHERE id>='100' and id<='141';
    SQL
  end

end
