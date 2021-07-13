class CreateActividadpfGrupo < ActiveRecord::Migration[6.1]

  # Para manejar control de acceso 
  # Actividades de marco lógico que pueden usar usadas sólo por ciertos
  # grupos
  # Por convención cuando una actividadpf no tenga grupo alguno no
  #   se controla acceso a esa actividad, sólo se controla a las que
  #   aparecen en esta tabla
  def up
    create_join_table :cor1440_gen_actividadpf, :sip_grupo,
      table_name: 'cor1440_gen_actividadpf_grupoexclusivo'
    add_foreign_key :cor1440_gen_actividadpf_grupoexclusivo, 
      :cor1440_gen_actividadpf
    add_foreign_key :cor1440_gen_actividadpf_grupoexclusivo, 
      :sip_grupo
    rename_column :cor1440_gen_actividadpf_grupoexclusivo, 
      :cor1440_gen_actividadpf_id, :actividadpf_id
    rename_column :cor1440_gen_actividadpf_grupoexclusivo, 
      :sip_grupo_id, :grupo_id
  end
  def down
    drop_table :cor1440_gen_actividadpf_grupoexclusivo
  end

end
