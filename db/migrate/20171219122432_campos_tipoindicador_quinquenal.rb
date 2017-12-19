class CamposTipoindicadorQuinquenal < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo, ayudauso) VALUES (1, 20, 'Acción Colectiva Realizada', 'Nombre de la acción colectiva que incide en el reconocimiento de los derechos de las víctimas de violencia política y del modelo de desarrollo, así como de sus organizaciones y comunidades. ');
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo, ayudauso) VALUES (2, 21, 'Mecanismo / Espacio', 'Nombre del mecanismo de interlocución o del espacio de incidencia del que hace parte');
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo, ayudauso) VALUES (3, 21, 'Actor(es) que formula(n) políticas públicas', 'Lista de actores que formulan políticas públicas y que participan en el mismo mecanismo de interlocución o espacio de incidencia');
      INSERT INTO cor1440_gen_campotind (id, tipoindicador_id, nombrecampo, ayudauso) VALUES (4, 22, 'Política pública', 'Nombre de la política pública y entidad que la expide');
      SELECT pg_catalog.setval('cor1440_gen_campotind_id_seq', 101, false);
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_campotind WHERE id>='1' and id<='4';
    SQL
  end
end
