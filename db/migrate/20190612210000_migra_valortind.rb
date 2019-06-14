# encoding: UTF-8

class MigraValortind < ActiveRecord::Migration[6.0]

  def up
    # Crear respuestfor a partir de efecto.id (
    # Antes cada efecto tenía una sola respuesta_id
    execute <<-SQL
      INSERT INTO mr519_gen_respuestafor (id, formulario_id, 
        fechaini, fechacambio)
        (SELECT DISTINCT evc.efecto_id, fti.formulario_id, 
          '2019-06-13'::date, '2019-06-13'::date
          FROM efecto_valorcampotind AS evc
          JOIN cor1440_gen_efecto AS e ON evc.efecto_id=e.id
          JOIN cor1440_gen_indicadorpf AS ip ON e.indicadorpf_id=ip.id
          JOIN cor1440_gen_tipoindicador AS ti ON ti.id=ip.tipoindicador_id
          JOIN cor1440_gen_formulario_tipoindicador AS fti 
            ON fti.tipoindicador_id=ti.id
          ORDER BY 1,2)
      ;
      SELECT setval('mr519_gen_respuestafor_id_seq', MAX(id)) FROM
        mr519_gen_respuestafor;
    SQL

    # Relacionar respuestafor recien creada con efecto
    execute <<-SQL
      INSERT INTO cor1440_gen_efecto_respuestafor 
        (efecto_id, respuestafor_id)
        (SELECT DISTINCT evc.efecto_id, evc.efecto_id
          FROM efecto_valorcampotind AS evc
          ORDER BY 1,2);    
    SQL

    # Convertir valores de valorcampotind en valorcampo pero
    # manteniendo id y recordando que campo_id=campotind_id+100
    # y que respuestafor_id=efecto_id
    execute <<-SQL
      INSERT INTO mr519_gen_valorcampo 
        (id, campo_id, valor, respuestafor_id)
        (SELECT vt.id, campotind_id + 100, valor, ev.efecto_id
          FROM efecto_valorcampotind AS ev
          JOIN cor1440_gen_valorcampotind AS vt
          ON ev.valorcampotind_id=vt.id
          ORDER BY 1,2)
      ;
      SELECT setval('mr519_gen_valorcampo_id_seq', MAX(id)) FROM
        mr519_gen_valorcampo;
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM mr519_gen_valorcampo WHERE
        id IN (SELECT id FROM cor1440_gen_valorcampotind)
      ;
      SELECT setval('mr519_gen_valorcampo_id_seq', MAX(id)) FROM
        mr519_gen_valorcampo;

      DELETE FROM cor1440_gen_efecto_respuestafor 
        WHERE efecto_id IN 
        (SELECT efecto_id FROM efecto_valorcampotind 
         ORDER BY 1)
      ;

      DELETE FROM mr519_gen_respuestafor 
        WHERE id IN 
        (SELECT DISTINCT efecto_id 
          FROM efecto_valorcampotind 
          ORDER BY 1)
      ;
      SELECT setval('mr519_gen_respuestafor_id_seq', MAX(id)) FROM
        mr519_gen_respuestafor;
    SQL
  end
end
