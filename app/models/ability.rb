# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

  ROLOPERADOR = 5

  ROLES = [
    ["Administrador", ROLADMIN], 
    ["Directivo", ROLDIR],
    ["Operador", ROLOPERADOR]
  ]

  GRUPO_COMPROMISOS = "Gerencia de Proyectos"

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
        ['Sip', 'grupo']
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
    'Solicitud de Informe' => { 
      campos: [
        'compromiso_id',  'titulo', 
        'coordinador', 'responsable', 
        'fechaplaneada', 'fechareal', 
        'devoluciones', 'observaciones', 'seguimiento',
        'a_tiempo'
      ],
      controlador: 'Cor1440Gen::Proyectofinanciero'
    },
    'Cuadro General de Seguimiento' => { 
      campos: [
        'compromiso_id',  'referenciacinep', 
        'financiador', 'responsablegp', 
        'estado', 'gradoexigencia'
      ],
      controlador: 'Cor1440Gen::Proyectofinanciero'
    }

  }

  def campos_plantillas 
    Heb412Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS.
      clone.merge(CAMPOS_PLANTILLAS_PROPIAS).merge(
        Cor1440Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS)
  end

  # Ver documentacion de este metodo en app/models/ability de sip
  def initialize(usuario = nil)
    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    grupos = usuario.sip_grupo.map(&:nombre)
    can :descarga_anexo, Sip::Anexo
    if !usuario.nil? && !usuario.rol.nil? then
      can :nuevo, Cor1440Gen::Actividad
      can :new, Cor1440Gen::Actividad
      # Contexto es para equipo derechos humanos 
      if Cor1440Gen::GruposHelper.mis_grupos_sinus(usuario).where(cn: 'EquipoDerechosHumanos').count > 0
        can :edit, :contextoac
      end
      case usuario.rol 
      when Ability::ROLOPERADOR
        can :read, ::Tasacambio
        can :read, Heb412Gen::Plantillahcm
        if grupos.include?(GRUPO_COMPROMISOS)
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
        else
          can :manage, ::Actor
          can :manage, :tablasbasicas
          can [:read], ::Usuario # Limita a oficina?
          can :manage, Cor1440Gen::Actividad#, grupo.map(&:nombre).to_set <= grupos.to_set
          can :read, Cor1440Gen::Proyectofinanciero
          can :manage, Cor1440Gen::Informe # limitar a oficina?
          #can [:read, :update, :create, :destroy], Cor1440Gen::Actividad, oficina_id: { id: usuario.oficina_id}
        end
      when Ability::ROLADMIN, Ability::ROLDIR
        can :edit, :contextoac
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

