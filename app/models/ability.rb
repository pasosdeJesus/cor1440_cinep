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
    'Administrar actividades de todos los grupos (con contexto). ' +
    'Administrar convenios institucionales. ' +
    'Administrar documentos en nube y plantillas. ' +
    'Administrar tablas básicas (tipos de convenios, etc). ' +
    'Administrar tasas de cambio. ' +
    'Administrar formularios y encuestas. ' +
    'Administrar usuarios. ', #ROLADMIN, 1

    '', #2

    'Igual al Administrador ', #ROLDIR, 3

    '', #4

    'Si sólo está en grupo Usuarios sólo puede gestionar su clave. ' +
    'Ver convenios institucionales. ' +
    'Ver documentos en nube y plantillas, así como descripciones de cada carpeta. ' +
    'Ver listado de usuarios y su información pública. ' +
    'Responder encuestas. ' +
    'Administrar actividades de su grupo. ' +
    'Áreas de investigación: Ver, editar y agregar organizaciones sociales. ' +
    'Área Derechos Humanos: En formulario de actividades usan contexto. Ver reportes trienal 2015-2017 ' +
    'Grupo Gerencia de Proyectos: Administrar actividades de todos los grupos. ' +
    'Grupo Gerencia de Proyectos: Administrar convenios institucionales. ' +
    'Grupo Gerencia de Proyectos: Administrar algunas tablas básicas: tipos de anexos, tipos de convenios, tipos de moneda, financiadores y cargos. ' +
    'Grupo Gestión de Calidad: Editar documentos en Nube y plantilas, asi como descripciones de cada carpeta. ' +
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
  GRUPO_DERECHOSHUMANOS = "Línea Derechos Humanos y Violencia Política"
  

  GRUPO_CONFLICTOYPAZ = 'Línea Conflicto y Paz'
  
  GRUPO_MOVIMIENTOSSOCIALESTIERRA = 'Línea Movimientos Sociales Tierra y Territorio'
 
  GRUPO_LINEA = "Línea"
  GRUPO_OFICINATI = "Oficina TI"
  GRUPO_STCIV = "STCIV"
  GRUPO_SIG = "Sistema de Información General"
  GRUPO_RESPONSABLE= "Responsable de"
  GRUPO_COORDINADORGP = "Coordinador(a) " + GRUPO_COMPROMISOS 


  def tablasbasicas 
    super() - [ 
      ['Cor1440Gen', 'actividadarea'] ,
      ['Cor1440Gen', 'proyecto'] ,
      ['Cor1440Gen', 'proyectofinanciero'] ,
      ['Sip', 'etiqueta'] ,
      ['Sip', 'perfilorgsocial'] ,
    ] + 
    [
        ['', 'acpactor1'],
        ['', 'acpactor2'],
        ['', 'acpcataccion'],
        ['', 'acpcatmotivo'],
        ['', 'acpcobertura'],
        ['', 'acpestrategia'],
        ['', 'acpformap'],
        ['', 'acpmotivo'],
        ['', 'acppapel'],
        ['', 'areaestudios'],
        ['', 'cajacompensacion'],
        ['', 'cargo'],
        ['', 'categoriarevista'],
        ['', 'comunicado'],
        ['', 'csivinivelgeo'],
        ['', 'csivinivelresp'],
        ['', 'csivitema'],
        ['', 'empresaps'],
        ['', 'escalaaltura3'],
        ['', 'escaladebilfuerte'],
        ['', 'escalaempeoramejora'],
        ['', 'escalaindmuy'],
        ['', 'fondopensiones'],
        ['', 'lineabase'],
        ['', 'lscobertura'],
        ['', 'nivelrelacion'],
        ['', 'niveleducacion'],
#        ['', 'nucleoconflicto'],
        ['', 'perfilprofesional'],
        ['', 'plantillacorreo'],
        ['', 'procesogh'],
        ['', 'profesion'],
        ['', 'redactor'],
        ['', 'regiongrupo'],
        ['Cor1440Gen', 'sectorapc'],
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
      ['', 'procesogh'],
      ['sip', 'grupo'],
      ['sip', 'sectororgsocial'],
      ['', 'tiponomina'],
      ['', 'acpestrategia']
    ]
  end

  CAMPOS_PLANTILLAS_PROPIAS = {
    'Usuario' => {
      campos: [
        'actualizacion', 
        'apellidos', 
        'apellidos_m', 
        'areaestudios',
        'cajacompensacion',
        'cargo',
        'ciudadlabora',
        'ciudadresidencia',
        'condensado_de_clave',
        'correo',
        'creacion',
        'created_at',
        'direccionresidencia',
        'email', 
        'empresaps',
        'encrypted_password',
        'extension',
        'fechacreacion',
        'fechacreacion_localizada',
        'fechadeshabilitacion',
        'fechadeshabilitacion_localizada',
        'fechaini_localizada',
        'fechafin_localizada',
        'fechanacb',
        'fondopensiones',
        'grupos',
        'gruposesp',
        'id', 
        'idioma',
        'lugardocumento',
        'lugarnacimiento',
        'niveleducacion',
        'nombres', 
        'nombres_m', 
        'numerocontrato',
        'numerodocumento',
        'numhijos',
        'numhijosmen12',
        'nusuario', 
        'oficina_id',
        'perfilprofesional',
        'presenta_nombre',
        'procesogh',
        'profesion',
        'rol',
        'salario',
        'salarioanterior',
        'sexonac',
        'tdocumento',
        'tdoc',
        'telefonos',
        'tipocontrato',
        'tiponomina',
        'vinculaciones',
        'uidNumber',
        'updated_at',
        ],
        controlador: '::UsuariosController',
        ruta: '/usuarios'
    },

    'Acp' => { 
      campos: [
        'id', 
        'cataccion', 
        'estrategia', 
        'fini', 
        'fini_localizada', 
        'ffin', 
        'ffin_localizada', 
        'confr', 
        'cobertura',
        'motivo',
        'descripcion', 
      ],
      controlador: '::AcpsController',
      ruta: '/acps'
    },



    'Actividad' => { 
      campos: [
        Cor1440Gen::Actividad.human_attribute_name(
          :actividadpf).downcase.gsub(' ', '_'), 
        'orgsocial', 
        'actualizacion', 
        'campos_dinamicos', 
        'cedula_responsable',
        'centros_costo_compromisos',
        'contexto', 
        'correo_responsable',
        'corresponsables',
        'creacion', 
        'duraciondias_localizado',
        'duracionhoras_localizado',
        'etnia_onr', 
        'fecha', 
        'fecha_localizada',
        'fecha_hoy_localizada',
        'fecha_terminacion_localizada',
        'fechanac_responsable_localizada',
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
        'telefono_responsable',
      ],
      controlador: 'Cor1440Gen::ActividadesController',
      ruta: '/actividades'
    },

    'Orgsocial' => { 
      campos: [
          'orgsocial_persona',
          'actualizado_en',
          'anotaciones',
          'celular',
          'ciudad',
          'creado_en',
          'contactos_nombres',
          'contactos_correos',
          'contactos_cargos',
          'correo',
          'direccion',
          'fax',
          'grupos',
          'id', 
          'lineabase',
          'nivelrelacion',
          'nivelgeostciv',
          'nivelrespstciv',
          'nombre',
          'pais',
          'regiones',
          'sectores',
          'telefono', 
          'temastciv',
          'web'
      ],
      controlador: 'Sip::Orgsocial',
      ruta: '/orgsociales'
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

  def self.externo?(usuario)
    if !usuario || usuario.fechadeshabilitacion || !usuario.rol
      return true
    end
    lgrupos = ApplicationHelper.supergrupos_usuario(usuario) #nombres
    if (lgrupos - ['Usuarios']) == ['STCIV'] # Externo, CERAC
      return true
    end
    return false
  end


  # Ver documentacion de este metodo en app/models/ability de sip
  def initialize(usuario = nil)
    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    lgrupos = ApplicationHelper.supergrupos_usuario(usuario) #nombres
    if !usuario.nil? && !usuario.rol.nil? 
      if usuario.rol == Ability::ROLOPERADOR &&
        (lgrupos.count == 0 || lgrupos == ['Usuarios'])
        return
      end
     
      case usuario.rol 
      when Ability::ROLOPERADOR

        if lgrupos.include?('STCIV') # CERAC o STCIV_CINEP
          can :read, [::Csivinivelgeo, ::Csivitema, 
                      ::Csivinivelresp, ::Regiongrupo, 
                      Sip::Grupo, Sip::Sectororgsocial]
          can :read, ::Regiongrupo
          can :read, Sip::Grupo
          can :read, Heb412Gen::Doc
          # Pueden manejar contactos STCIV (y no los de CINEP)
          can :stciv, Sip::OrgsocialPersona
          can [:create, :read, :index, :update], Sip::Orgsocial
          if (lgrupos - ['Usuarios']) == ['STCIV'] # Externo, CERAC
            return  # Nada más
          end
        end
        can :read, ::Nivelrelacion
        can :descarga_anexo, Sip::Anexo
        can :nuevo, Cor1440Gen::Actividad
        can :new, Cor1440Gen::Actividad

        can :manage, Cor1440Gen::Actividad#, grupo.map(&:nombre).to_set <= grupos.to_set
        #can :manage, Cor1440Gen::Informe # limitar a oficina?
        can :listado, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichaimp, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichapdf, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :objetivospf, Cor1440Gen::Proyectofinanciero
        #can :actividadespf, Cor1440Gen::Proyectofinanciero

        can :read, Heb412Gen::Doc
        can :read, Heb412Gen::Plantilladoc
        can :read, Heb412Gen::Plantillahcm
        can :read, Heb412Gen::Plantillahcr

        can :read, Mr519Gen::Formulario
        can :read, [Mr519Gen::Encuestausuario, 
                    Mr519Gen::Encuestapersona,
                    ::Planencuesta ]
        can [:edit, :update], 
          Mr519Gen::Encuestausuario.where(usuario_id: usuario.id)

        can [:read, :index], Sip::Persona # Contactos
        can [:read, :index], Sip::Orgsocial# Directorio institucional
        can :read, Sip::Grupo # Directorio institucional
        #can [:read, :update, :create, :destroy], Cor1440Gen::Actividad, oficina_id: { id: usuario.oficina_id}

        can :read, ::Busqunif
        can :read, ::Tasacambio
        can :read, ::Usuario # Directorio institucional

        lineas = lgrupos.select {|g| g.start_with?(GRUPO_LINEA)}
        coords = lgrupos.select {|g| g.start_with?(GRUPO_RESPONSABLE)}
        # Coordinadores también están en su línea
        if coords.length > 0
          lineas |= coords.map { |gc| GRUPO_LINEA + ' ' + gc[15..-1] }
          # Detección de problemas en nombres de líneas
          lineasm = lineas.select { |nl| Sip::Grupo.where(nombre: nl).count == 0 }
          if lineasm.count > 0
              puts "OJO problemas en nombres #{lineasm}"
              return
          end
        end

        # Dejar en lineas solo nombres validos y en idlineas sus ids
        lineas = lineas.select { |nl| Sip::Grupo.where(nombre: nl).count > 0 }
        idlineas = lineas.map { |nl| Sip::Grupo.where(nombre: nl).take.id }

        # Si hace fata agregar lineas a grupos
        lgrupos |= lineas
        lgrupos = lgrupos.select { |nl| Sip::Grupo.where(nombre: nl).count > 0 }
        idlgrupos = lgrupos.map { |nl| Sip::Grupo.where(nombre: nl).take.id }


        # Puede ver resumen de proyectos no exclusivos (i.e sin grupos),
        # los que cubran sus grupos y aquellos en los que esté en
        # el equipo de trabajo
        pc1 = Cor1440Gen::Proyectofinanciero.
          where(
            'id NOT IN (SELECT proyectofinanciero_id 
               FROM grupo_proyectofinanciero)'
        ).pluck(:id)
        pc2 = Cor1440Gen::Proyectofinanciero.
          where('id IN (SELECT proyectofinanciero_id FROM 
                  grupo_proyectofinanciero WHERE grupo_id IN (?))', idlineas).
        pluck(:id)
        pc3 = Cor1440Gen::Proyectofinanciero.
          where('id IN (SELECT proyectofinanciero_id FROM 
                  cor1440_gen_proyectofinanciero_usuario WHERE usuario_id=?)', 
                  usuario.id).pluck(:id)

        can [:read], Cor1440Gen::Proyectofinanciero, {id: pc1 | pc2 | pc3}

        # Convención de control de acceso a actividadespf
        # Las que no tengan control de acceso pueden usarlas todos los
        # investigadores
        # Las que tengan control de acceso son exclusivas para los grupos
        # que indiquen
        apf1 = Cor1440Gen::Actividadpf.
          where(proyectofinanciero_id: pc1 | pc2).
          where(
            'id NOT IN (SELECT actividadpf_id 
               FROM cor1440_gen_actividadpf_grupoexclusivo)'
        ).pluck(:id)
        apf2 = Cor1440Gen::Actividadpf.
          where(proyectofinanciero_id: pc1 | pc2).
          joins('JOIN cor1440_gen_actividadpf_grupoexclusivo ON
                  cor1440_gen_actividadpf_grupoexclusivo.actividadpf_id=
                  cor1440_gen_actividadpf.id ').
                  where('cor1440_gen_actividadpf_grupoexclusivo.grupo_id IN (?)', 
                        idlgrupos).
                        pluck(:id)
        apfper = apf1 | apf2
        apfper.uniq!
        can [:read], Cor1440Gen::Actividadpf, id: apfper

        # Puede editar encuestas que ha respondido
        encper = Mr519Gen::Encuestapersona.joins(:persona).
          joins('JOIN sip_orgsocial_persona ON 
            sip_persona.id = sip_orgsocial_persona.persona_id').
            joins( 'JOIN grupo_orgsocial ON grupo_orgsocial.orgsocial_id
            =sip_orgsocial_persona.orgsocial_id').
            where('grupo_id IN (?)', idlgrupos)
        puts "encper.ids=#{encper.map(&:id)}"
        can [:edit, :update], encper

        # Investigadores y coordinadores
        if lineas.length > 0
          can [:create, :read, :update], Sip::Orgsocial
          can [:create, :read, :update], ::Publicacion
          can :manage, :tablasbasicas
          can :manage, Cor1440Gen::Efecto
          #can :index, Cor1440Gen::Mindicadorpf
          can :read, Cor1440Gen::Mindicadorpf

          can :read, ::Acp
          #can :index, :exploradordatosrel
        end

        # Coordinadores de línea
        if coords.length > 0
          # Posibilidad de editar Marco Lógico de proyectos exclusivos de su línea
          pc = Cor1440Gen::Proyectofinanciero.
            where('cor1440_gen_proyectofinanciero.id IN
              (SELECT proyectofinanciero_id FROM 
                (SELECT proyectofinanciero_id, COUNT(grupo_id) FROM 
                  grupo_proyectofinanciero WHERE proyectofinanciero_id 
                  IN (SELECT proyectofinanciero_id FROM 
                  grupo_proyectofinanciero WHERE grupo_id IN (?)) GROUP BY 1) 
                AS sub WHERE sub.count=1)', idlineas)
          can [:read, :edit, :update], Cor1440Gen::Proyectofinanciero,
            {id: pc.pluck(:id)}
          can [:edit, :update], Cor1440Gen::Actividadpf,
            {proyectofinanciero_id: pc.pluck(:id)}
          can [:edit], Cor1440Gen::Indicadorpf
          can [:read], Mr519Gen::Encuestapersona
        end
 
        # Si un usuario es coordinador o responsable de un proyecto
        # puede editar su marco lógico.
        pc1 = Cor1440Gen::Proyectofinanciero.where(
          'cor1440_gen_proyectofinanciero.id IN
          (SELECT proyectofinanciero_id FROM proyectofinanciero_uresponsable
            WHERE uresponsable_id=?)', usuario.id).pluck(:id)
        pc2 = Cor1440Gen::Proyectofinanciero.where(
          'cor1440_gen_proyectofinanciero.id IN
          (SELECT proyectofinanciero_id FROM coordinador_proyectofinanciero
            WHERE coordinador_id=?)', usuario.id).pluck(:id)
        pc = Cor1440Gen::Proyectofinanciero.where(id: pc1 | pc2)

        if pc.count > 0
          can [:read, :edit, :update], Cor1440Gen::Proyectofinanciero,
            {id: pc.pluck(:id)}
          can [:edit], Cor1440Gen::Indicadorpf
          can [:edit], Cor1440Gen::Actividadpf
        end

        # Control de acceso por grupo
        ###############################

        if lgrupos.include?(GRUPO_ARCHIVOYCORRESPONDENCIA)
          can [:edit, :update], ::Usuario
        end

        if lgrupos.include?(GRUPO_COMPROMISOS) || 
          lgrupos.include?(GRUPO_COORDINADORGP)
          # Oficina Gerencia de Proyectos
          can :objetivospf, Cor1440Gen::Proyectofinanciero
          can :actividadespf, Cor1440Gen::Proyectofinanciero
          can :manage, Cor1440Gen::Actividad
          can :manage, Cor1440Gen::Actividadpf
          can [:index, :read], Cor1440Gen::Efecto
          can :manage, Cor1440Gen::Financiador
          can :manage, Cor1440Gen::Mindicadorpf
          can [:creacomogp, :read, :index, :show, :create, :validar], 
            Cor1440Gen::Proyectofinanciero
          can [:manage, :validar], Cor1440Gen::Proyectofinanciero,
            {id: Cor1440Gen::Proyectofinanciero.where(
              'respgp_id IS NOT NULL').pluck(:id)}
          can :manage, Cor1440Gen::Sectorapc

          can [:create, :read, :update], ::Publicacion

          can :manage, :tablasbasicas
          can :manage, ::Convenio
          can :manage, ::Tasacambio
          can :manage, ::Tipoanexo
          can :manage, ::Tipoconvenio
          can :manage, ::Tipomoneda
          can :manage, ::Tipoproductopf
        end

        if lgrupos.include?(GRUPO_COMUNICACIONES)
          can :manage, ::Publicacion
          can :manage, :tablasbasicas
        end


        # Contexto es para equipo derechos humanos 
        if lgrupos.include?(GRUPO_DERECHOSHUMANOS)
          can :edit, :contextoac
        end

        if lgrupos.include?(GRUPO_GESTIONDECALIDAD)
          can :manage, Heb412Gen::Doc
          can :manage, Heb412Gen::Plantilladoc
          can :manage, Heb412Gen::Plantillahcm
          can :manage, Heb412Gen::Plantillahcr
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

        if lgrupos.include?(GRUPO_CONFLICTOYPAZ)
          can :index, :confytransf
          can :read, ::Ls
          can :read, ::Lscobertura
          can :index, :exploradordatosrel
          can :index, :dinamicas  # Dinámicas del conflicto
          #Acciones colectivas por la paz
          can :manage, ::Acp
          can :manage, ::Acpactor1
          can :manage, ::Acpactor2
          can :manage, ::Acpcataccion
          can :manage, ::Acpcatmotivo
          can :manage, ::Acpestrategia
          can :manage, ::Acpformap
          can :manage, ::Acpmotivo
          can :manage, ::Acppapel
        end

        if lgrupos.include?(GRUPO_SIG)
          can :index, :confytransf
          can :read, ::Ls
          can :read, ::Lscobertura
          can :read, ::Acp
        end

        if lgrupos.include?(GRUPO_MOVIMIENTOSSOCIALESTIERRA)
          can :manage, ::Ls
          can :manage, ::Lscobertura
        end

        if lgrupos.include?(GRUPO_OFICINATI)
          can :manage, Mr519Gen::Formulario
        end

        if lgrupos.include?(GRUPO_STCIV)
          can :read, ::Csivinivelgeo
          can :read, ::Csivinivelresp
          can :read, ::Csivitema
        end


      when Ability::ROLADMIN, Ability::ROLDIR
        can :descarga_anexo, Sip::Anexo
        can :dir, :aprobadoefecto
        can :index, :exploradordatosrel
        can :index, :confytransf
        can :edit, :contextoac
        can :manage, ::Acp
        can :manage, ::Ls
        can :index, :dinamicas
        can :manage, :lineabase
        can :dir, :vistobuenoactividad

        can :read, ::Busqunif
        can :manage, ::Convenio
        can :manage, ::Tasacambio
        can :manage, ::Usuario

        can :manage, Cor1440Gen::Actividad
        can :manage, Cor1440Gen::Efecto
        can :manage, Cor1440Gen::Indicadorpf
        #can :manage, Cor1440Gen::Informe
        can :manage, Cor1440Gen::Mindicadorpf
        can :manage, Cor1440Gen::Proyectofinanciero
        can :manage, Cor1440Gen::Tipoindicador
        can :manage, Cor1440Gen::Actividadpf

        can :manage, Heb412Gen::Doc
        can :manage, Heb412Gen::Plantilladoc
        can :manage, Heb412Gen::Plantillahcm
        can :manage, Heb412Gen::Plantillahcr

        can :manage, Mr519Gen::Formulario
        can :manage, Mr519Gen::Encuestausuario
        can :manage, Mr519Gen::Encuestapersona
        can :manage, ::Planencuesta

        can :manage, ::Publicacion
        can :manage, Sip::Orgsocial
        can :manage, Sip::Persona
        can :manage, :tablasbasicas
        tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

