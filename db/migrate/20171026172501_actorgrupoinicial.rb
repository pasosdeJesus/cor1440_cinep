# enconding: utf-8

class Actorgrupoinicial < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO actor_grupo (actor_id, sip_grupo_id) (SELECT a.id, g.id FROM actor AS a, sip_grupo AS g WHERE g.nombre='Equipo Derechos Humanos');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM actor_grupo;
    SQL
  end
end
