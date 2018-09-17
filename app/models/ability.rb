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
    'Administrar actividades e informes de su grupo. ' +
    'Áreas de investigación: Ver, editar y agregar actores sociales. ' +
    'Área Derechos Humanos: En formulario de actividades usan contexto. Ver reportes trienal 2015-2017 ' +
    'Grupo Gerencia de Proyectos: Administrar actividades de todos los grupos. ' +
    'Grupo Gerencia de Proyectos: Administrar convenios institucionales. ' +
    'Grupo Gerencia de Proyectos: Administrar algunas tablas básicas: tipos de anexos, tipos de convenios, tipos de moneda, financiadores y cargos. ' +
    'Grupo Gestion de Calidad: Editar documentos en Nube y plantilas, asi como descripciones de cada carpeta. ' +
    'Grupo Archivo y Correspondencia: Editar usuarios pero sólo los campos extensión, oficina y teléfonos personales. ' +
    'Grupo Gestión Humana: Agregar y editar usuarios, campos privados de gestión humana, grupos y campos públicos. ' +
    'Grupo Gestión Humana: Maneja tablas básicas perfil profesional, cargos, tipos de contrato. ' +
    'Grupo Comunicaciones: Gestionar publicaciones. '  #ROLOPERADOR, 5

  ]

  GRUPO_COMPROMISOS = "Gerencia de Proyectos"
  GRUPO_ARCHIVOYCORRESPONDENCIA= "Archivo y Correspondencia"
  GRUPO_GESTIONHUMANA = "Gestión Humana"
  GRUPO_GESTIONDECALIDAD = "Gestión de Calidad"
  GRUPO_EXTERNOS = "Externos"
  GRUPO_USUARIOS = "Usuarios"
  GRUPO_DESACTIVADOS = "Desactivados"
  GRUPOS_GENERICOS = [GRUPO_EXTERNOS, GRUPO_USUARIOS, GRUPO_DESACTIVADOS]
  GRUPO_COMUNICACIONES = "Comunicaciones"
  GRUPO_DERECHOSHUMANOS = "Línea Derechos Humanos y Derecho Internacional Humanitario"
  GRUPO_LINEA = "Línea"
  GRUPO_COORDINADOR = "Coordinador(a)"
  def tablasbasicas 
    super() - [ 
      ['Cor1440Gen', 'actividadarea'] ,
      ['Cor1440Gen', 'actorsocial'] ,
      ['Cor1440Gen', 'proyecto'] ,
      ['Cor1440Gen', 'proyectofinanciero'] ,
      ['Cor1440Gen', 'sectoractor'],
      ['Sip', 'etiqueta'] ,
      ['Sip', 'perfilactorsocial'] ,
      ['Sip', 'sectoractor'] ,
    ] + 
    [
        ['', 'actor'],
        ['', 'areaestudios'],
        ['', 'cajacompensacion'],
        ['', 'cargo'],
        ['', 'empresaps'],
        ['', 'fondopensiones'],
        ['', 'nivelrelacion'],
        ['', 'niveleducacion'],
#        ['', 'nucleoconflicto'],
        ['', 'perfilprofesional'],
        ['', 'procesogh'],
        ['', 'profesion'],
        ['', 'publicacion'],
        ['', 'redactor'],
        ['', 'regiongrupo'],
        ['', 'sectoractor'],
        ['', 'sectorapc'],
        ['', 'tipoanexo'],
        ['', 'tipocontrato'],
        ['', 'tipoconvenio'],
        ['', 'tiponomina'],
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
      ['', 'nivelrelacion'],
      ['', 'sectoractor'],
      ['', 'tiponomina']
    ]
  end

  CAMPOS_PLANTILLAS_PROPIAS = {
    'Usuario' => {
      campos: [
        'apellidos', 
        'areaestudios',
        'cajacompensacion',
        'cargo',
        'ciudadlabora',
        'ciudadresidencia',
        'created_at',
        'direccionresidencia',
        'email', 
        'encrypted_password',
        'extension',
        'email',
        'empresaps',
        'failed_attempts',
        'fechacreacion_localizada',
        'fechadeshabilitacion_localizada',
        'fechaini_localizada',
        'fechafin_localizada',
        'fechanacb',
        'fondopensiones',
        'grupos',
        'gruposesp',
        'id', 
        'idioma',
        'locked_at',
        'lugardocumento',
        'lugarnacimiento',
        'niveleducacion',
        'nombres', 
        'numerocontrato',
        'numerodocumento',
        'numhijos',
        'numhijosmen12',
        'nusuario', 
        'oficina_id',
        'perfilprofesional',
        'procesogh',
        'profesion',
        'rol',
        'salario',
        'salarioanterior',
        'sexonac',
        'tdocumento',
        'telefonos',
        'tipocontrato',
        'tiponomina',
        'vinculaciones',
        'uidNumber',
        'unlock_token',
        'updated_at',
        ],
        controlador: '::UsuariosController',
        ruta: '/usuarios'
    },
    'Actividad' => { 
      campos: [
        Cor1440Gen::Actividad.human_attribute_name(
          :actividadpf).downcase.gsub(' ', '_'), 
        'actor', 
        'actualizacion', 
        'campos_dinamicos', 
        'contexto', 
        'corresponsables',
        'creacion', 
        'duracionhoras_localizado',
        'etnia_onr', 
        'fecha', 
        'fecha_localizada',
        'grupo', 
        'hombres', 
        'id', 
        'indigenas', 
        'departamento', 
        'departamento_s', 
        'mujeres', 
        'municipio', 
        'municipio_s', 
        'negros', 
        'nombre', 
        'objetivo_convenio_financiero',
        'observaciones', 
        'poblacion', 
        Cor1440Gen::Actividad.human_attribute_name(
          :proyectofinanciero).downcase.gsub(' ', '_'), 
        'publicacion', 
        'responsable', 
        'sexo_onr', 
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
    'Compromiso Institucional' => { 
      campos: [
        'acuse', 
        'anotaciones',
        'anotacionescontab',
        'anotacionesdb', 
        'anotacionesinf', 
        'anotacionesrh', 
        'anotacionesre',
        'aportecinepej',  
        'aportefinanciador',  
        'aportefinancierocinep',  
        'aporteotrosej',  
        'autenticarcompulsar', 
        'centrocosto', 
        'coordinador',
        'coordinadorlinea',
        'copiasdesoporte', 
        'cuentasbancarias', 
        'duracion',
        'emailrespagencia',
        'empresaauditoria',
        'equipotrabajo',
        'fechacierre',  
        'fechainicio',  
        'fechaliquidacion',
        'financiador',
        'formatosespecificos',
        'fuentefinanciador', 
        'gestiones',
        'informesespecificos', 
        'informessolicitudpago', 
        'montoej', 
        'nit', 
        'nombre', 
        'observaciones',
        'organigramacinep',
        'otrosaportescinep',
        'paisfinanciador',
        'presupuestototal',  
        'presupuestototalej',  
        'publicaciones',  
        'rendimientosfinancieros',
        'referencia', 
        'referenciacinep',
        'reinvertirrendimientosfinancieros',
        'reportarrendimientosfinancieros',
        'respagencia', 
        'responsable',
        'saldo', 
        'sectorapc',
        'sucursal', 
        'telrespagencia', 
        'tipomoneda',
        'tutorarea',
      ],
      controlador: 'Cor1440Gen::Proyectofinanciero',
      ruta: '/proyectosfinancieros'
    },




  }

  def campos_plantillas 
    c = Heb412Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS.
      clone.merge(CAMPOS_PLANTILLAS_PROPIAS)
    return c
  end

  # Ver documentacion de este metodo en app/models/ability de sip
  def initialize(usuario = nil)
    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    lgrupos = ApplicationHelper.supergrupos_usuario(usuario) #nombres
    can :descarga_anexo, Sip::Anexo
    if !usuario.nil? && !usuario.rol.nil? then
      can :nuevo, Cor1440Gen::Actividad
      can :new, Cor1440Gen::Actividad
      case usuario.rol 
      when Ability::ROLOPERADOR
        can :read, ::Tasacambio
        can :read, Heb412Gen::Doc
        can :read, Heb412Gen::Plantillahcm
        can :read, Heb412Gen::Plantilladoc
        can :read, ::Usuario # Directorio institucional
        can :read, Sip::Grupo # Directorio institucional
        can :manage, Cor1440Gen::Actividad#, grupo.map(&:nombre).to_set <= grupos.to_set
        #can [:read, :update, :create, :destroy], Cor1440Gen::Actividad, oficina_id: { id: usuario.oficina_id}
        can :manage, Cor1440Gen::Informe # limitar a oficina?
        can :read, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichaimp, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichapdf, Cor1440Gen::Proyectofinanciero # Los de su grupo

        lineas = lgrupos.select {|g| g.start_with?(GRUPO_LINEA)}
        # Sólo investigadores
        if lineas.length > 0
          can [:create, :read, :update], ::Actor
          can :manage, :tablasbasicas
          can :manage, ::Efecto
          can :index, Cor1440Gen::Mindicadorpf
          can :objetivospf, Cor1440Gen::Proyectofinanciero
          can :actividadespf, Cor1440Gen::Proyectofinanciero
        end

        coords = lgrupos.select {|g| g.start_with?(GRUPO_COORDINADOR)}
        # Posibilidad de editar Marco Logico para coordinadores
        if coords.length > 0
          pc = ::Cor1440Gen::Proyectofinanciero.
            where('cor1440_gen_proyectofinanciero.id IN 
                (SELECT proyectofinanciero_id FROM 
                coordinador_proyectofinanciero WHERE coordinador_id=?)',
                usuario.id)
          can [:edit, :update], pc
          can [:edit], Cor1440Gen::Indicadorpf
        end

        # Contexto es para equipo derechos humanos 
        if lgrupos.include?(GRUPO_DERECHOSHUMANOS)
          can :edit, :contextoac
        end

        if lgrupos.include?(GRUPO_COMPROMISOS)
          # Oficina Gerencia de Proyectos
          can :manage, ::Convenio
          can :manage, Cor1440Gen::Actividad
          can :manage, Cor1440Gen::Mindicadorpf
          can [:creacomogp, :read, :index, :show, :create, :validar], 
            Cor1440Gen::Proyectofinanciero
          can [:manage, :validar], Cor1440Gen::Proyectofinanciero.where(
            'respgp_id IS NOT NULL')

          can :manage, :tablasbasicas
          can :manage, ::Sectorapc
          can :manage, ::Tasacambio
          can :manage, ::Tipoanexo
          can :manage, ::Tipoconvenio
          can :manage, ::Tipomoneda
          can :manage, ::Tipoproductopf
          can :manage, Cor1440Gen::Financiador
        end
        if lgrupos.include?(GRUPO_GESTIONDECALIDAD)
          can :manage, Heb412Gen::Doc
          can :manage, Heb412Gen::Plantillahcm
          can :manage, Heb412Gen::Plantilladoc
        end
        if lgrupos.include?(GRUPO_ARCHIVOYCORRESPONDENCIA)
          can [:edit, :update], ::Usuario
        end
        if lgrupos.include?(GRUPO_GESTIONHUMANA)
          can [:edit, :update, :create], ::Usuario
          can :manage, ::Areaestudios
          can :manage, ::Cargo
          can :manage, ::Cajacompensacion
          can :manage, ::Empresaps
          can :manage, ::Fondopensiones
          can :manage, ::Niveleducacion
          can :manage, ::Perfilprofesional
          can :manage, ::Procesogh
          can :manage, ::Profesion
          can :read, Sip::Grupo
          can :manage, ::Tipocontrato
          can :manage, ::Tiponomina
          can :manage, :tablasbasicas
        end
        if lgrupos.include?(GRUPO_COMUNICACIONES)
          can :manage, Sal7711Gen::Articulo
          can :manage, ::Publicacion
          can :manage, :tablasbasicas
        end
      when Ability::ROLADMIN, Ability::ROLDIR
        can :edit, :contextoac
        can :manage, ::Convenio
        can :manage, ::Efecto
        can :manage, ::Tasacambio
        can :manage, ::Usuario
        can :manage, Cor1440Gen::Actividad
        can :manage, Cor1440Gen::Indicadorpf
        can :manage, Cor1440Gen::Informe
        can :manage, Cor1440Gen::Mindicadorpf
        can :manage, Cor1440Gen::Proyectofinanciero
        can :manage, Cor1440Gen::Tipoindicador
        can :manage, Heb412Gen::Doc
        can :manage, Heb412Gen::Plantillahcm
        can :manage, Heb412Gen::Plantilladoc
        can :manage, :tablasbasicas
        tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

