class AgregaCategoriaE1i1 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_actividadtipo SET nombre='TR2018-AD6-E1I1 INCIDENCIA: PROPICIAR ESPACIOS DE DIALOGO SOBRE CONFLICTO EN LOS TERRITORIOS'
        WHERE id='83';
      INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, resultadopf_id, actividadtipo_id, descripcion)
        VALUES (90, 18, 'AD6', 'INCIDENCIA: PROPICIAR ESPACIOS DE DIALOGO SOBRE CONFLICTO EN LOS TERRITORIOS (E1I1)', 18, 83, 
        'Posibilita avance en indicador E1I1 del trienal 2018-2020');
      UPDATE cor1440_gen_actividadpf SET actividadtipo_id=NULL WHERE id='38';
    SQL
  end

  def down
    execute <<-SQL
      UPDATE cor1440_gen_actividadpf set actividadtipo_id='83' WHERE id='38';
      DELETE FROM cor1440_gen_actividadpf WHERE id='90';
      UPDATE cor1440_gen_actividadtipo SET nombre='TR2018-AD3. INCIDENCIA: ORGANIZACIÓN DE ESPACIOS MULTIACTOR'
        WHERE id='83';
    SQL
  end
end
