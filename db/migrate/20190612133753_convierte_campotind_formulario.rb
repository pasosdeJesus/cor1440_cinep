# encoding: UTF-8

class ConvierteCampotindFormulario < ActiveRecord::Migration[6.0]

  def up
    # Convertir tipoindicador con campos a formulario usando 
    # la misma id de tipoindicador para formulario
    execute <<-SQL
      INSERT INTO mr519_gen_formulario (id, nombre, nombreinterno)
        (SELECT id, nombre, left(regexp_replace(lower(
          trim(nombre)), '[^a-z0-9_]', '_', 'g'), 60)
          FROM cor1440_gen_tipoindicador
          WHERE id IN (SELECT tipoindicador_id 
            FROM cor1440_gen_campotind) ) ;
      SELECT setval('mr519_gen_formulario_id_seq', MAX(id)) FROM
        mr519_gen_formulario;
    SQL

    # Convertir campos de tipoindicador a campos de formulario usando
    # la id+100
    execute <<-SQL
      INSERT INTO mr519_gen_campo (id, nombre, ayudauso, tipo, 
        obligatorio, formulario_id, nombreinterno)
        (SELECT id+100, nombrecampo, ayudauso, tipo, false, 
          tipoindicador_id, left(regexp_replace(
             lower(trim(nombrecampo)), '[^a-z0-9_]', '_', 'g'), 60)
          FROM cor1440_gen_campotind) ;

      SELECT setval('mr519_gen_campo_id_seq', MAX(id)) FROM
        mr519_gen_campo;
    SQL

    # Relacionar tipoindicador con formularios
    execute <<-SQL
      INSERT INTO cor1440_gen_formulario_tipoindicador
        (tipoindicador_id, formulario_id)
        (SELECT DISTINCT tipoindicador_id, tipoindicador_id 
          FROM cor1440_gen_campotind ORDER BY 1)
      ;
    SQL

  end

  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_formulario_tipoindicador
        WHERE tipoindicador_id IN
        (SELECT DISTINCT tipoindicador_id 
          FROM cor1440_gen_campotind ORDER BY 1)
      ;
    SQL


    execute <<-SQL
      DELETE FROM mr519_gen_campo WHERE
        id IN (SELECT id+100 FROM cor1440_gen_campotind);
      SELECT setval('mr519_gen_campo_id_seq', MAX(id)) FROM
        mr519_gen_campo;

      DELETE FROM mr519_gen_formulario WHERE
        id IN (SELECT tipoindicador_id FROM cor1440_gen_campotind);
      SELECT setval('mr519_gen_formulario_id_seq', MAX(id)) FROM
        mr519_gen_formulario;
    SQL
  end
end
