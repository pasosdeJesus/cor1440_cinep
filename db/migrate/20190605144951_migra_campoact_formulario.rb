# encoding: UTF-8

class MigraCampoactFormulario < ActiveRecord::Migration[6.0]

  def up
    # Convertir actividadtipo con campos a formulario usando la misma id
    # de actividadtipo para formulario
    execute <<-SQL
      INSERT INTO mr519_gen_formulario (id, nombre, nombreinterno)
        (SELECT id, nombre, left(regexp_replace(lower(
          trim(nombre)), '[^a-z0-9_]', '_', 'g'), 60)
          FROM cor1440_gen_actividadtipo 
          wHERE id IN (SELECT actividadtipo_id FROM cor1440_gen_campoact) ) ;
      SELECT setval('mr519_gen_formulario_id_seq', MAX(id)) FROM
        mr519_gen_formulario;
    SQL

    # Convertir campos de actividadtipo a campos de formulario usando
    # la misma id de campoact para campo
    execute <<-SQL
      INSERT INTO mr519_gen_campo (id, nombre, ayudauso, tipo, obligatorio,
        formulario_id, nombreinterno)
        (SELECT id, nombrecampo, ayudauso, tipo, false, actividadtipo_id,
           left(regexp_replace(
             lower(trim(nombrecampo)), '[^a-z0-9_]', '_', 'g'), 60)
          FROM cor1440_gen_campoact) ;

      SELECT setval('mr519_gen_campo_id_seq', MAX(id)) FROM
        mr519_gen_campo;
    SQL

    # Relacionar actividadtipo con formularios
    execute <<-SQL
      INSERT INTO cor1440_gen_actividadtipo_formulario 
        (actividadtipo_id, formulario_id)
        (SELECT DISTINCT actividadtipo_id, actividadtipo_id 
          FROM cor1440_gen_campoact ORDER BY 1)
      ;
    SQL

  end

  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_actividadtipo_formulario 
        WHERE actividadtipo_id IN
        (SELECT DISTINCT actividadtipo_id 
          FROM cor1440_gen_campoact ORDER BY 1)
      ;
    SQL


    execute <<-SQL
      DELETE FROM mr519_gen_campo WHERE
        id IN (SELECT id FROM cor1440_gen_campoact);
      SELECT setval('mr519_gen_campo_id_seq', MAX(id)) FROM
        mr519_gen_campo;

      DELETE FROM mr519_gen_formulario WHERE
        id IN (SELECT actividadtipo_id FROM cor1440_gen_campoact);
      SELECT setval('mr519_gen_formulario_id_seq', MAX(id)) FROM
        mr519_gen_formulario;
    SQL
  end
end
