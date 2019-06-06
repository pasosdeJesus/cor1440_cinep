# encoding: UTF-8

class MigraValoract < ActiveRecord::Migration[6.0]

  def up
    # Crear respuestfor a partir de valorcampoact pero con id obtenido de 
    # actividad_id y actividadtipo_id teniendo en cuenta:
    # id>300 porque ya hay datos
    # SELECT DISTINCT ca.actividadtipo_id FROM cor1440_gen_valorcampoact AS vc   JOIN cor1440_gen_campoact AS ca ON vc.campoact_id=ca.id  OR
    # DER BY 1;
    #  actividadtipo_id
    #  ------------------
    #  79
    #  80
    #  81
    #  82
    #  83
    #  155
    #  156
    #  159 
    #  SELECT DISTINCT case when ca.actividadtipo_id<155 then ca.actividadtipo_id-79 else ca.actividadtipo_id-150 end, ca.actividadtipo_id FROM cor1440_gen_valorcampoact AS vc   JOIN cor1440_gen_campoact AS ca ON vc.campoact_id=ca.id  ORDER BY 1;
    # Da una buena secuencia de números menores a 10
    execute <<-SQL
      INSERT INTO mr519_gen_respuestafor (id, formulario_id, 
        fechaini, fechacambio)
        (SELECT DISTINCT vc.actividad_id*10+
          (CASE WHEN ca.actividadtipo_id<155 THEN ca.actividadtipo_id-79 
            ELSE ca.actividadtipo_id-150 END)+300, ca.actividadtipo_id, 
          '2019-06-06'::date, '2019-06-06'::date
          FROM cor1440_gen_valorcampoact AS vc
          JOIN cor1440_gen_campoact AS ca ON vc.campoact_id=ca.id
          ORDER BY 1,2)
      ;
      SELECT setval('mr519_gen_respuestafor_id_seq', MAX(id)) FROM
        mr519_gen_respuestafor;
    SQL

    # Relacionar respuestafor recien creada con actividad
    execute <<-SQL
      INSERT INTO cor1440_gen_actividad_respuestafor 
        (actividad_id, respuestafor_id)
        (SELECT DISTINCT vc.actividad_id, vc.actividad_id*10+
          (CASE WHEN ca.actividadtipo_id<155 THEN ca.actividadtipo_id-79 
            ELSE ca.actividadtipo_id-150 END)+300
          FROM cor1440_gen_valorcampoact AS vc
          JOIN cor1440_gen_campoact AS ca ON vc.campoact_id=ca.id
          ORDER BY 1,2)
    SQL

    # Convertir valores de valorcampoact en valorcampo pero
    # incrementando id en 1200 y recordando que respuestafor tiene
    # un id que emplea actividad y actividadtipo
    execute <<-SQL
      INSERT INTO mr519_gen_valorcampo 
        (id, campo_id, valor, respuestafor_id)
        (SELECT vc.id+1200, campoact_id, valor, vc.actividad_id*10+
          (CASE WHEN ca.actividadtipo_id<155 THEN ca.actividadtipo_id-79 
            ELSE ca.actividadtipo_id-150 END)+300
          FROM cor1440_gen_valorcampoact AS vc
          JOIN cor1440_gen_campoact AS ca ON vc.campoact_id=ca.id
          ORDER BY 1,2)
      ;
      SELECT setval('mr519_gen_valorcampo_id_seq', MAX(id)) FROM
        mr519_gen_valorcampo;
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM mr519_gen_valorcampo WHERE
        id IN (SELECT id+1200 FROM cor1440_gen_valorcampoact)
      ;
      SELECT setval('mr519_gen_valorcampo_id_seq', MAX(id)) FROM
        mr519_gen_valorcampo;

      DELETE FROM cor1440_gen_actividad_respuestafor 
        WHERE actividad_id IN 
        (SELECT actividad_id FROM cor1440_gen_valorcampoact ORDER BY 1)
      ;

      DELETE FROM mr519_gen_respuestafor 
        WHERE id IN 
        (SELECT DISTINCT vc.actividad_id*10+
          (CASE WHEN ca.actividadtipo_id<155 THEN ca.actividadtipo_id-79 
            ELSE ca.actividadtipo_id-150 END)+300
          FROM cor1440_gen_valorcampoact AS vc
          JOIN cor1440_gen_campoact AS ca ON vc.campoact_id=ca.id
          ORDER BY 1)
      ;
      SELECT setval('mr519_gen_respuestafor_id_seq', MAX(id)) FROM
        mr519_gen_respuestafor;
    SQL
  end
end
