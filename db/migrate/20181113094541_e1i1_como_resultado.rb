class E1i1ComoResultado < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, 
        fechacreacion, created_at, updated_at) 
        VALUES (83, 
          'TR2018-AD3. INCIDENCIA: ORGANIZACIÓN DE ESPACIOS MULTIACTOR',
          '2018-11-13','2018-11-13','2018-11-13');
      INSERT INTO cor1440_gen_campoact (id, actividadtipo_id,
        nombrecampo, ayudauso, tipo) 
        VALUES (5, 83, '¿Es propiciado por CINEP/PPP?', '', 4);
      INSERT INTO cor1440_gen_campoact (id, actividadtipo_id,
        nombrecampo, ayudauso, tipo) 
        VALUES (6, 83, '¿Se creó para tratar un conflicto?', '', 4);
      INSERT INTO cor1440_gen_campoact (id, actividadtipo_id,
        nombrecampo, ayudauso, tipo) 
        VALUES (7, 83, '¿Participa más de un sector?', '', 4);
      INSERT INTO cor1440_gen_campoact (id, actividadtipo_id,
        nombrecampo, ayudauso, tipo) 
        VALUES (8, 83, '¿Se mantiene por lo menos dos veces?', '', 4);
      UPDATE cor1440_gen_actividadpf SET actividadtipo_id='83' WHERE id='38';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_actividadpf SET actividadtipo_id=NULL WHERE id='38';
      DELETE FROM cor1440_gen_campoact WHERE id>='5' AND id<='8';
      DELETE FROM cor1440_gen_actividadtipo WHERE id=83;
    SQL
  end
end
