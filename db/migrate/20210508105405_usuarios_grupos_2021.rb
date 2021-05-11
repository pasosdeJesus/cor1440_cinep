class UsuariosGrupos2021 < ActiveRecord::Migration[6.1]
  def up
    antcye=Sip::Grupo.where(cn: 'LineaConflictoYEstado')[0]
    antip=Sip::Grupo.where(cn: 'LineaIniciativasDePaz')[0]
    antmr=Sip::Grupo.where(cn: 'LineaMediacionYReconciliacion')[0]
    antcp=Sip::Grupo.where(cn: 'LineaCulturaDePazYCiudadanias')[0]
    antep=Sip::Grupo.where(cn: 'LineaEscuelaDePazYConvivenciaCiudadana')[0]
    antgt=Sip::Grupo.where(cn: 'LineaGestionDelTerritorio')[0]
    antms=Sip::Grupo.where(cn: 'LineaMovimientosSociales')[0]
    antdt=Sip::Grupo.where(cn: 'LineaDerechoALaTierraYAlTerritorio')[0]
    antei=Sip::Grupo.where(cn: 'LineaEducacionIntercultural')[0]
    antdh=Sip::Grupo.where(cn: 'LineaDerechosHumanosYDerechoInternacionalHumanitario')[0]

    execute <<-SQL
      --  Línea Conflicto y Paz· 
      INSERT INTO sip_grupo_usuario (usuario_id, sip_grupo_id)
        (SELECT usuario_id, 62 FROM sip_grupo_usuario WHERE
          sip_grupo_id IN (#{antcye.id}, #{antip.id}, #{antmr.id})
        )
      ;
      --  Línea Educación para la Ciudadanía y la Paz 
      INSERT INTO sip_grupo_usuario (usuario_id, sip_grupo_id)
        (SELECT usuario_id, 64 FROM sip_grupo_usuario WHERE
          sip_grupo_id IN (#{antcp.id}, #{antep.id})
        )
      ;
      -- Línea Gestión del Territorio
      INSERT INTO sip_grupo_usuario (usuario_id, sip_grupo_id)
        (SELECT usuario_id, 66 FROM sip_grupo_usuario WHERE
          sip_grupo_id IN (#{antgt.id})
        )
      ;
      -- Línea Movimientos Sociales, Tierra y Territorio
      INSERT INTO sip_grupo_usuario (usuario_id, sip_grupo_id)
        (SELECT usuario_id, 70 FROM sip_grupo_usuario WHERE
          sip_grupo_id IN (#{antms.id}, #{antdt.id})
        )
      ;

      -- Línea Interculturalidad
      INSERT INTO sip_grupo_usuario (usuario_id, sip_grupo_id)
        (SELECT usuario_id, 72 FROM sip_grupo_usuario WHERE
          sip_grupo_id IN (#{antei.id})
        )
      ;
      -- Línea DH
      INSERT INTO sip_grupo_usuario (usuario_id, sip_grupo_id)
        (SELECT usuario_id, 74 FROM sip_grupo_usuario WHERE
          sip_grupo_id IN (#{antdh.id})
        )
      ;

    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sip_grupo_usuario WHER sip_sip_grupo_id IN (62, 64, 66,
        70, 72, 74);
    SQL
  end
end
