class OrtografiaComunes2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_actividadpf 
       SET titulo='Incidencia: Acciones públicas nacionales e internacionales de cabildeo político'
       WHERE id=319;
      UPDATE cor1440_gen_actividadpf 
       SET titulo='Incidencia: Propiciar espacios de diálogo sobre conflicto en los territorios'
       WHERE id=321;
      UPDATE cor1440_gen_actividadpf 
       SET titulo='Investigación: Participación en eventos académicos nacionales e internacionales'
       WHERE id=311;
      UPDATE cor1440_gen_actividadpf 
       SET titulo='Investigación: Participación como evaluador en revistas, libros, articulos académicos. (CINEP - Externos)'
       WHERE id=315;
    SQL
  end
  def down
  end
end
