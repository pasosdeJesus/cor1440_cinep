class IniciaPprogtind < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      -- E1I2
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (1, 19, 'Idea propuesta', '14');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (2, 19, 'Diseño planteado', '28');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (3, 19, 'Proyecto escrito', '42');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (4, 19, 'Proyecto gestionado ante financiadores', '56');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (5, 19, 'Proyecto aprobado por un financiador', '70');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (6, 19, 'Proyecto en desarrollo', '84');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (7, 19, 'Iniciativa consolidada', '100');

      -- E3I2
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (10, 22, 'Convocado', '20');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (11, 22, 'Propuestas construida', '40');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (12, 22, 'Propuesta validada', '60');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (13, 22, 'Aprobado por ente gubernamental', '80');
      INSERT INTO cor1440_gen_pprogtind (id, tipoindicador_id,
        fase, porcentaje) 
        VALUES (14, 22, 'Desarrollado e implementado', '100');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_pprogtind WHERE id BETWEEN 1 AND 7;
      DELETE FROM cor1440_gen_pprogtind WHERE id BETWEEN 10 AND 14;
    SQL
  end
end
