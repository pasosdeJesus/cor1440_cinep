class Grupos20212023 < ActiveRecord::Migration[6.1]
  def up
    # Se mantienen igual Usuarios, Sistema de Información General,
    # Servicios, 
    # STCIV, STCIV_CINEP, 
    # Recursos Físicos y Tecnológicos, OficinaTI,
    # Gestión de Calidad, Gestión Humana, Dirección, 
    # Gerencia Administrativa y Financiera
    # Gerencia de Proyectos
    # Externos, Dirección, Desactivados, Contabilidad,
    # Archivo y Correspondencia
    
    
    #Deshabilitar áreas, tutores, coordinadores y líneas anteriores
    execute <<-SQL
      UPDATE sip_grupo SET fechadeshabilitacion='#{Date.today}'
        WHERE cn LIKE 'Area%'
        OR cn LIKE 'Tutor%'
        OR cn LIKE 'Coordinador%'
        OR cn LIKE 'Linea%'
      ;
    SQL
    desactivados=Sip::Grupo.where(cn:'Desactivados')[0]
    execute <<-SQL
      INSERT INTO grupo_subgrupo (grupo_id, subgrupo_id)
        (SELECT #{desactivados.id}, id FROM sip_grupo
        WHERE cn LIKE 'Area%'
        OR cn LIKE 'Tutor%'
        OR cn LIKE 'Coordinador%'
        OR cn LIKE 'Linea%')
      ;
    SQL


    # Programa Conflicto, Estado y Paz
    #   Línea Conflicto y Paz 
    #     antes:Líneas Conflicto y Estado 
    #       Iniciativas de Paz(?) 
    #       Mediación y Reconciliación
    #   Línea Educación para la Ciudadanía y la Paz
    #     antes: Culturas de Paz y Ciudadanías 
    #       Escuela de Paz y Convivencia Ciudadana
    #   Línea Gestión del Territorio
    #     antes: Gestión del Territorio en el Pacifico
    #

    gusuarios=Sip::Grupo.where(cn:'Usuarios')[0]
    Sip::Grupo.create(
      id: 60,
      nombre: 'Programa Conflicto, Estado y Paz',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'ProgramaConflictoEstadoYPaz',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: gusuarios.id,
      subgrupo_id: 60
    )
    Sip::Grupo.create(
      id: 61,
      nombre: 'Coordinador(a) de Conflicto, Estado y Paz',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorConflictoEstadoYPaz',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 60,
      subgrupo_id: 61
    )

    Sip::Grupo.create(
      id: 62,
      nombre: 'Línea Conflicto y Paz',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'LineaConflictoYPaz',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 60,
      subgrupo_id: 62
    )
    Sip::Grupo.create(
      id: 63,
      nombre: 'Responsable de Conflicto y Paz',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorConflictoYPaz',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 62,
      subgrupo_id: 63
    )
 
    Sip::Grupo.create(
      id: 64,
      nombre: 'Línea Educación para la Ciudadanía y la Paz',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'LineaEducacionParaLaCiudadaniaYLaPaz',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 60,
      subgrupo_id: 64
    )
    Sip::Grupo.create(
      id: 65,
      nombre: 'Responsable de Educación para la Ciudadanía y la Paz',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorEducacionParaLaCiudadaniaYLaPaz',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 64,
      subgrupo_id: 65
    )

    Sip::Grupo.create(
      id: 66,
      nombre: 'Línea Gestión del Territorio',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'LineaGestionDelTerritorio',
      procesogh_id: 3
    ) 
    GrupoSubgrupo.create(
      grupo_id: 60,
      subgrupo_id: 66
    )
    Sip::Grupo.create(
      id: 67,
      nombre: 'Responsable de Gestión del Territorio',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorGestionDelTerritorio',
      procesogh_id: 3
    ) 
    GrupoSubgrupo.create(
      grupo_id: 66,
      subgrupo_id: 67
    )


    # Programa Movilización, DDHH e Interculturalidad
    #   Línea Movimientos Sociales Tierra y Territorio
    #     antes: Movimientos Sociales 
    #       Derecho a la tierra y el territorio
    #   Línea Interculturalidad
    #     antes: 
    #       Educación Intercultural
    #   Línea Derechos Humanos
    #     antes: Derechos Humanos y Derecho Internacional Humanitario

    Sip::Grupo.create(
      id: 68,
      nombre: 'Programa Movilización, DDHH e Interculturalidad',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'ProgramaMovilizacionDDHHEInterculturalidad',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: gusuarios.id,
      subgrupo_id: 68
    )
    Sip::Grupo.create(
      id: 69,
      nombre: 'Coordinador(a) de Movilización, DDHH e Interculturalidad',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorMovilizacionDDHHEInterculturalidad',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 68,
      subgrupo_id: 69
    )

    Sip::Grupo.create(
      id: 70,
      nombre: 'Línea Movimientos Sociales, Tierra y Territorio',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'LineaMovimientosSocialesTierraYTerritorio',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 68,
      subgrupo_id: 70
    )
    Sip::Grupo.create(
      id: 71,
      nombre: 'Responsable de Movimientos Sociales, Tierra y Territorio',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorMovimientosSocialesTierraYTerritorio',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 70,
      subgrupo_id: 71
    )

    Sip::Grupo.create(
      id: 72,
      nombre: 'Línea Interculturalidad',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'LineaInterculturalidad',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 68,
      subgrupo_id: 72 
    )
    Sip::Grupo.create(
      id: 73,
      nombre: 'Responsable de Interculturalidad',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorInterculturalidad',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 72,
      subgrupo_id: 73
    )

    Sip::Grupo.create(
      id: 74,
      nombre: 'Línea Derechos Humanos y Violencia Política',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'LineaDerechosHumanosYViolenciaPolitica',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 68,
      subgrupo_id: 74
    )
    Sip::Grupo.create(
      id: 75,
      nombre: 'Responsable de Derechos Humanos y Violencia Política',
      fechacreacion: '2021-05-07',
      created_at: Time.now,
      updated_at: Time.now,
      cn: 'CoordinadorDerechosHumanosYViolenciaPolitica',
      procesogh_id: 3
    )
    GrupoSubgrupo.create(
      grupo_id: 74,
      subgrupo_id: 75
    )
  end

  def down
    desactivados=Sip::Grupo.where(cn:'Desactivados')[0]
    execute <<-SQL
      DELETE FROM grupo_subgrupo WHERE grupo_id>='60' AND grupo_id<='75';
      DELETE FROM grupo_subgrupo WHERE subgrupo_id>='60' AND subgrupo_id<='75';
      DELETE FROM sip_grupo WHERE id>='60' and id<='75';

      UPDATE sip_grupo SET fechadeshabilitacion=NULL
        WHERE cn LIKE 'Area%'
        OR cn LIKE 'Tutor%'
        OR cn LIKE 'Coordinador%'
        OR cn LIKE 'Linea%'
      ;
      DELETE FROM grupo_subgrupo WHERE
        grupo_id=#{desactivados.id} AND subgrupo_id IN
        (SELECT id FROM sip_grupo
          WHERE cn LIKE 'Area%'
          OR cn LIKE 'Tutor%'
          OR cn LIKE 'Coordinador%'
          OR cn LIKE 'Linea%'
        )
      ;
    SQL
  end
end
