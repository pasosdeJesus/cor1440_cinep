# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

  ROLOPERADOR = 5

  ROLES = [
    ["Administrador", ROLADMIN], #1
    ["Directivo", ROLDIR], #3
    ["Operador", ROLOPERADOR] #5
  ]

  # Se usa desde 1
  ROLES_CA = [
    'Administrar actividades e informes de todos los grupos (con contexto). ' +
    'Administrar convenios institucionales. ' +
    'Administrar documentos en nube y plantillas. ' +
    'Administrar tablas básicas (actores sociales, tipos de convenios, etc). ' +
    'Administrar tasas de cambio. ' +
    'Administrar usuarios. ', #ROLADMIN, 1

    '', #2

    'Igual al Administrador ', #ROLDIR, 3

    '', #4

    'Ver convenios institucionales. ' +
    'Ver documentos en nube y plantillas, así como descripciones de cada carpeta. ' +
    'Ver listado de usuarios y su información pública. ' +
    'Administrar actividades e informes de todos los grupos. ' +
    'Administrar una tabla básica: actores sociales. ' +
    'Grupo Derechos Humanos: En formulario de actividades usan contexto. ' +
    'Grupo Gerencia de Proyectos: Administrar actividades de todos los grupos. ' +
    'Grupo Gerencia de Proyectos: Administrar convenios institucionales. ' +
    'Grupo Gerencia de Proyectos: Administrar algunas tablas básicas: tipos de anexos, tipos de convenios, tipos de moneda, financiadores y cargos. ' +
    'Grupo Gestion de Calidad: Editar documentos en Nube y plantilas, asi como descripciones de cada carpeta. ' +
    'Grupo Archivo y Correspondencia: Editar usuarios pero sólo los campos extensión, oficina y teléfonos personales. ' +
    'Grupo Gestión Humana: Agregar y editar usuarios, campos privados de gestión humana, grupos y campos públicos. '  #ROLOPERADOR, 5

  ]

  GRUPO_COMPROMISOS = "Gerencia de Proyectos"
  GRUPO_ARCHIVOYCORRESPONDENCIA= "Archivo y Correspondencia"
  GRUPO_GESTIONHUMANA = "Gestión Humana"
  GRUPO_GESTIONDECALIDAD = "Gestión de Calidad"
  GRUPO_EXTERNOS = "Externos"
  GRUPO_COMUNICACIONES = "Comunicaciones"

  def tablasbasicas 
    super() - [ ['Cor1440Gen', 'proyectofinanciero'] ] + 
      [
        ['', 'actor'],
        ['', 'cargo'],
        ['', 'nucleoconflicto'],
        ['', 'publicacion'],
        ['', 'redactor'],
        ['', 'regiongrupo'],
        ['', 'sectoractor'],
        ['', 'tipoanexo'],
        ['', 'tipoconvenio'],
        ['', 'tipomoneda'],
        ['', 'tipoproductopf'],
        ['Sip', 'grupo'],
        ['Sip', 'oficina']
    ]
  end
  
  # Tablas no básicas pero que tienen índice
  NOBASICAS_INDSEQID =  [
    ['', 'proyectofinanciero_usuario'], 
  ]

  # Tablas no básicas pero que tienen índice con secuencia id_seq
  def nobasicas_indice_seq_con_id 
    Sip::Ability::NOBASICAS_INDSEQID +
      Cor1440Gen::Ability::NOBASICAS_INDSEQID +
      NOBASICAS_INDSEQID
  end

  def tablasbasicas_prio 
    super() + [
      ['', 'sectoractor']
    ]
  end

  CAMPOS_PLANTILLAS_PROPIAS = {
    'Actividad' => { 
      campos: [
        'id', 'fecha', 'responsable', 'nombre', 
        'departamento', 'tipos_de_actividad', 'objetivo', 
        'proyecto', 'convenios_financieros', 'resultado', 
        'contexto', 'mujeres', 'hombres', 
        'blancos', 'mestizos', 'indigenas', 
        'negros', 'observaciones', 
        'creacion', 'actualizacion', 'corresponsables'
      ],
      controlador: 'Cor1440Gen::ActividadesController',
      ruta: '/actividades'
    },
    'Cuadro General de Seguimiento' => { 
      campos: [
        'compromiso_id',  'referenciacinep', 
        'financiador', 'responsablegp', 
        'estado', 'gradoexigencia'
      ],
      controlador: 'Cor1440Gen::Proyectofinanciero',
      ruta: '/proyectosfinancieros'
    },
    'Cronograma de Solicitud de Informes' => { 
      campos: [
        'compromiso_id',  'titulo', 
        'coordinador', 'responsable', 
        'fechaplaneada', 'fechareal', 
        'devoluciones', 'observaciones', 'seguimiento',
        'a_tiempo'
      ],
      controlador: 'Cor1440Gen::Proyectofinanciero',
      ruta: '/proyectosfinancieros'
    },



  }

  def campos_plantillas 
    Heb412Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS.
      clone.merge(CAMPOS_PLANTILLAS_PROPIAS)
  end

  # Ver documentacion de este metodo en app/models/ability de sip
  def initialize(usuario = nil)
    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    lgrupos = usuario.sip_grupo.map(&:nombre)
    can :descarga_anexo, Sip::Anexo
    if !usuario.nil? && !usuario.rol.nil? then
      can :nuevo, Cor1440Gen::Actividad
      can :new, Cor1440Gen::Actividad
      # Contexto es para equipo derechos humanos 
      if Cor1440Gen::GruposHelper.mis_grupos_sinus(usuario).
        where(cn: 'EquipoDerechosHumanos').count > 0
        can :edit, :contextoac
      end
      case usuario.rol 
      when Ability::ROLOPERADOR
        can :read, ::Tasacambio
        can :read, Heb412Gen::Doc
        can :read, Heb412Gen::Plantillahcm
        can [:read], ::Usuario # Directorio institucional
        can :manage, Cor1440Gen::Actividad#, grupo.map(&:nombre).to_set <= grupos.to_set
        #can [:read, :update, :create, :destroy], Cor1440Gen::Actividad, oficina_id: { id: usuario.oficina_id}
        can :manage, Cor1440Gen::Informe # limitar a oficina?
        can :read, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichaimp, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichapdf, Cor1440Gen::Proyectofinanciero # Los de su grupo

        # Sólo equipos
        can :manage, ::Actor
        can :manage, :tablasbasicas

        if lgrupos.include?(GRUPO_COMPROMISOS)
          can :manage, ::Convenio
          can :manage, ::Tasacambio
          can :manage, ::Tipoanexo
          can :manage, ::Tipoconvenio
          can :manage, ::Tipomoneda
          can :manage, ::Cargo
          can :manage, :tablasbasicas
          can :manage, Cor1440Gen::Actividad
          # Oficina Gerencia de Proyectos
          can :manage, Cor1440Gen::Proyectofinanciero
          can :manage, Cor1440Gen::Financiador
        end
        if lgrupos.include?(GRUPO_GESTIONDECALIDAD)
          can :manage, Heb412Gen::Doc
          can :manage, Heb412Gen::Plantillahcm
        end
        if lgrupos.include?(GRUPO_ARCHIVOYCORRESPONDENCIA)
          can [:edit, :update], ::Usuario
        end
        if lgrupos.include?(GRUPO_GESTIONHUMANA)
          can [:edit, :update, :create], ::Usuario
          can [:read], Sip::Grupo
        end
      when Ability::ROLADMIN, Ability::ROLDIR
        can :edit, :contextoac
        can :manage, ::Convenio
        can :manage, ::Tasacambio
        can :manage, ::Usuario
        can :manage, Cor1440Gen::Proyectofinanciero
        can :manage, Cor1440Gen::Actividad
        can :manage, Cor1440Gen::Informe
        can :manage, Heb412Gen::Doc
        can :manage, Heb412Gen::Plantillahcm
        can :manage, :tablasbasicas
        tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

