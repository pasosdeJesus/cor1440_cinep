class CreateJoinTableActividadSipGrupo < ActiveRecord::Migration[5.0]
  def up
    create_join_table :actividad, :grupo, {
      table_name: 'actividad_grupo'
    }
    add_foreign_key :actividad_grupo, :cor1440_gen_actividad, 
      column: :actividad_id
    add_foreign_key :actividad_grupo, :sip_grupo, column: :grupo_id
    execute <<-SQL
    INSERT INTO actividad_grupo (actividad_id, grupo_id) 
      (SELECT id, ar[1] FROM (
        SELECT id, ARRAY(SELECT DISTINCT sip_grupo.id FROM sip_grupo JOIN
        sip_grupo_usuario ON sip_grupo.id=sip_grupo_usuario.sip_grupo_id
        WHERE nombre<>'usuario' AND sip_grupo_usuario.usuario_id=
        cor1440_gen_actividad.usuario_id) AS ar
        FROM cor1440_gen_actividad WHERE usuario_id IS NOT NULL AND
        usuario_id IN (SELECT usuario_id FROM sip_grupo_usuario)) AS sub)
    SQL
  end

  def down
    drop_table :actividad_grupo
  end
end
