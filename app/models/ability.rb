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
    'Administrar tablas básicas (actores sociales, tipos de convenios, etc). ' +
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
  GRUPO_MEDIACION = "Línea Mediación y Reconciliación"
  GRUPO_INICIATIVASPAZ = "Línea Iniciativas de Paz"
  GRUPO_MOVIMIENTOSSOCIALES = "Línea Movimientos Sociales"
  GRUPO_CONFLICTOYESTADO = "Línea Conflicto y Estado"
  GRUPO_LINEA = "Línea"
  GRUPO_OFICINATI = "Oficina TI"
  GRUPO_COORDINADOR = "Coordinador(a)"
  GRUPO_COORDINADORGP = GRUPO_COORDINADOR + " " + GRUPO_COMPROMISOS 


  def tablasbasicas 
    super() - [ 
      ['Cor1440Gen', 'actividadarea'] ,
      ['Cor1440Gen', 'proyecto'] ,
      ['Cor1440Gen', 'proyectofinanciero'] ,
      ['Sip', 'etiqueta'] ,
      ['Sip', 'perfilactorsocial'] ,
    ] + 
    [
        ['', 'acpcataccion'],
        ['', 'areaestudios'],
        ['', 'cajacompensacion'],
        ['', 'cargo'],
        ['', 'comunicado'],
        ['', 'empresaps'],
        ['', 'fondopensiones'],
        ['', 'nivelrelacion'],
        ['', 'niveleducacion'],
#        ['', 'nucleoconflicto'],
        ['', 'perfilprofesional'],
        ['', 'plantillacorreo'],
        ['', 'procesogh'],
        ['', 'profesion'],
        ['', 'publicacion'],
        ['', 'redactor'],
        ['', 'regiongrupo'],
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
      ['Sip', 'grupo'],
      ['Sip', 'sectoractor'],
      ['', 'tiponomina']
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
    'Actividad' => { 
      campos: [
        Cor1440Gen::Actividad.human_attribute_name(
          :actividadpf).downcase.gsub(' ', '_'), 
        'actorsocial', 
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

    'Actorsocial' => { 
      campos: [
          'actorsocial_persona',
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
          'lineabase20182020',
          'nivelrelacion',
          'nombre',
          'pais',
          'sectores',
          'telefono', 
          'web'
      ],
      controlador: 'Sip::Actorsocial',
      ruta: '/actoressociales'
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
    if !usuario.nil? && !usuario.rol.nil? 
      if usuario.rol == Ability::ROLOPERADOR &&
        (lgrupos.count == 0 || lgrupos == ['Usuarios'])
        return
      end
      can :descarga_anexo, Sip::Anexo
      can :nuevo, Cor1440Gen::Actividad
      can :new, Cor1440Gen::Actividad
      case usuario.rol 
      when Ability::ROLOPERADOR
        can :manage, Cor1440Gen::Actividad#, grupo.map(&:nombre).to_set <= grupos.to_set
        #can :manage, Cor1440Gen::Informe # limitar a oficina?
        can :read, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichaimp, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :fichapdf, Cor1440Gen::Proyectofinanciero # Los de su grupo
        can :objetivospf, Cor1440Gen::Proyectofinanciero
        can :actividadespf, Cor1440Gen::Proyectofinanciero

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

        can [:read, :index], Sip::Actorsocial# Directorio institucional
        can :read, Sip::Grupo # Directorio institucional
        #can [:read, :update, :create, :destroy], Cor1440Gen::Actividad, oficina_id: { id: usuario.oficina_id}
        
        can :read, ::Tasacambio
        can :read, ::Usuario # Directorio institucional

        lineas = lgrupos.select {|g| g.start_with?(GRUPO_LINEA)}
        # Sólo investigadores
        if lineas.length > 0
          can [:create, :read, :update], Sip::Actorsocial
          can :manage, :tablasbasicas
          can :manage, Cor1440Gen::Efecto
          can :index, Cor1440Gen::Mindicadorpf
          can :index, :busquedaunificada
          can :index, :exploradordatosrel
        end

        coords = lgrupos.select {|g| g.start_with?(GRUPO_COORDINADOR)}
        # Posibilidad de editar Marco Logico para coordinadores
        if coords.length > 0
          lineas = coords.map { |gc| GRUPO_LINEA + ' ' + gc[15..-1] }
          lineasm = lineas.select { |nl| Sip::Grupo.where(nombre: nl).count == 0 }
          if lineasm.count > 0
              puts "OJO problemas en nombres #{lineasm}"
              return
          end
          lineasb = lineas.select { |nl| Sip::Grupo.where(nombre: nl).count > 0 }
          idlineas = lineasb.map { |nl| Sip::Grupo.where(nombre: nl).take.id }
          pc = ::Cor1440Gen::Proyectofinanciero.
            where('cor1440_gen_proyectofinanciero.id IN
              (SELECT proyectofinanciero_id FROM 
                (SELECT proyectofinanciero_id, COUNT(grupo_id) FROM 
                  grupo_proyectofinanciero WHERE proyectofinanciero_id 
                  IN (select proyectofinanciero_id from 
                  grupo_proyectofinanciero where grupo_id IN (?)) GROUP BY 1) 
                AS sub WHERE sub.count=1)', idlineas)
          can [:edit, :update], pc
          can [:edit], Cor1440Gen::Indicadorpf
          can :manage, ::Publicacion
          can [:read], Mr519Gen::Encuestapersona
        else
          # Investigador
          lineasb = lineas.select { |nl| Sip::Grupo.where(nombre: nl).count > 0 }
          idlineas = lineasb.map { |nl| Sip::Grupo.where(nombre: nl).take.id }

          encper = Mr519Gen::Encuestapersona.joins(:persona).
            joins('JOIN sip_actorsocial_persona ON 
            sip_persona.id = sip_actorsocial_persona.persona_id').
            joins( 'JOIN actorsocial_grupo ON actorsocial_grupo.actorsocial_id
            =sip_actorsocial_persona.actorsocial_id').
            where('grupo_id IN (?)', idlineas)
          puts "encper.ids=#{encper.map(&:id)}"
          can [:edit, :update], encper
         
        end
 
        # Responsables de un proyecto también pueden editar marco lógico
        pc = ::Cor1440Gen::Proyectofinanciero.where('id IN
          (SELECT proyectofinanciero_id FROM proyectofinanciero_uresponsable
            WHERE uresponsable_id=?)', usuario.id)
        if pc.count > 0
          can [:edit, :update], pc
          can [:edit], Cor1440Gen::Indicadorpf
          can :manage, ::Publicacion
        end

        # Contexto es para equipo derechos humanos 
        if lgrupos.include?(GRUPO_DERECHOSHUMANOS)
          can :edit, :contextoac
        end

        if lgrupos.include?(GRUPO_MEDIACION)
          can :index, :conflictividades
        end

        if lgrupos.include?(GRUPO_MOVIMIENTOSSOCIALES)
          can :index, :movilizacion
        end

        if lgrupos.include?(GRUPO_INICIATIVASPAZ)
          can :index, :datapaz
        end

        if lgrupos.include?(GRUPO_CONFLICTOYESTADO)
          can :index, :dinamicas
        end

        if lgrupos.include?(GRUPO_OFICINATI)
          can :manage, Mr519Gen::Formulario
        end

        if lgrupos.include?(GRUPO_COMPROMISOS) || 
          lgrupos.include?(GRUPO_COORDINADORGP)
          # Oficina Gerencia de Proyectos
          can :objetivospf, Cor1440Gen::Proyectofinanciero
          can :actividadespf, Cor1440Gen::Proyectofinanciero
          can :manage, Cor1440Gen::Actividad
          can [:index, :read], Cor1440Gen::Efecto
          can :manage, Cor1440Gen::Financiador
          can :manage, Cor1440Gen::Mindicadorpf
          can [:creacomogp, :read, :index, :show, :create, :validar], 
            Cor1440Gen::Proyectofinanciero
          can [:manage, :validar], Cor1440Gen::Proyectofinanciero.where(
            'respgp_id IS NOT NULL')

          can [:create, :read, :update], Sip::Actorsocial

          can :manage, :tablasbasicas
          can :manage, ::Convenio
          can :manage, ::Sectorapc
          can :manage, ::Tasacambio
          can :manage, ::Tipoanexo
          can :manage, ::Tipoconvenio
          can :manage, ::Tipomoneda
          can :manage, ::Tipoproductopf

        end
        if lgrupos.include?(GRUPO_GESTIONDECALIDAD)
          can :manage, Heb412Gen::Doc
          can :manage, Heb412Gen::Plantilladoc
          can :manage, Heb412Gen::Plantillahcm
          can :manage, Heb412Gen::Plantillahcr
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
        can :dir, :aprobadoefecto
        can :index, :busquedaunificada
        can :index, :exploradordatosrel
        can :index, :conflictividades
        can :edit, :contextoac
        can :index, :datapaz
        can :index, :dinamicas
        can :manage, :lineabase20182020
        can :index, :movilizacion
        can :dir, :vistobuenoactividad

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

        can :manage, Heb412Gen::Doc
        can :manage, Heb412Gen::Plantilladoc
        can :manage, Heb412Gen::Plantillahcm
        can :manage, Heb412Gen::Plantillahcr

        can :manage, Mr519Gen::Formulario
        can :manage, Mr519Gen::Encuestausuario
        can :manage, Mr519Gen::Encuestapersona
        can :manage, ::Planencuesta

        can :manage, Sip::Actorsocial
        can :manage, :tablasbasicas
        tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

