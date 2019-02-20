class AumentaTipoindicadorE1I2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo,
        ayudauso, tipo) VALUES (25, 19, 'Meta 20%', '¿Qué determina que la organización de mujeres ha consolidado la iniciativa hasta un 20%?', 1);
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo,
        ayudauso, tipo) VALUES (26, 19, 'Meta 40%', '¿Qué determina que la organización de mujeres ha consolidado la iniciativa hasta un 40%?', 1);
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo,
        ayudauso, tipo) VALUES (27, 19, 'Meta 60%', '¿Qué determina que la organización de mujeres ha consolidado la iniciativa hasta un 60%?', 1);
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo,
        ayudauso, tipo) VALUES (28, 19, 'Meta 80%', '¿Qué determina que la organización de mujeres ha consolidado la iniciativa hasta un 80%?', 1);
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo,
        ayudauso, tipo) VALUES (29, 19, 'Meta 100%', '¿Qué determina que la organización de mujeres ha consolidado completamenta la iniciativa?', 1);
      SELECT setval('cor1440_gen_campotind_id_seq', max(id)+1) FROM 
        (SELECT id FROM cor1440_gen_campotind UNION SELECT 100) AS s;
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_campotind WHERE id>='25' and id<='29';
    SQL
  end
end
