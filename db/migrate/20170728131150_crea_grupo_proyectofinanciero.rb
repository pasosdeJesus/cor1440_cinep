class CreaGrupoProyectofinanciero < ActiveRecord::Migration[5.1]
  def up
    f = ::OficinaProyectofinanciero.joins(
      'JOIN sip_oficina ON oficina_id=sip_oficina.id').where(
      'lower(sip_oficina.nombre) NOT IN 
        (SELECT lower(nombre) FROM sip_grupo)').
      order('sip_oficina.nombre').select('DISTINCT sip_oficina.nombre')
    if f.count > 0
      raise "No hay grupos con nombres de oficina: #{f.map(&:nombre)}"
    end

    create_join_table :grupo, :proyectofinanciero, {
      table_name: 'grupo_proyectofinanciero'
    }
    add_foreign_key :grupo_proyectofinanciero, :cor1440_gen_proyectofinanciero, 
      column: :proyectofinanciero_id
    add_foreign_key :grupo_proyectofinanciero, :sip_grupo, column: :grupo_id
    execute <<-SQL
    INSERT INTO grupo_proyectofinanciero (proyectofinanciero_id, grupo_id) 
      (SELECT proyectofinanciero_id, sip_grupo.id FROM 
        oficina_proyectofinanciero JOIN sip_oficina ON
        oficina_proyectofinanciero.oficina_id=sip_oficina.id 
        JOIN sip_grupo ON 
          lower(sip_oficina.nombre) = lower(sip_grupo.nombre))
    SQL

  end

  def down
    drop_table :grupo_proyectofinanciero
  end
end
