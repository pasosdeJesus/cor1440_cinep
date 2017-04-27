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
        ['', 'sectoractor'],
        ['', 'tipoanexo'],
        ['', 'tipomoneda'],
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
      case usuario.rol 
      when Ability::ROLOPERADOR
        if grupos.include?(GRUPO_COMPROMISOS)
          # Oficina Gerencia de Proyectos
          can :manage, Cor1440Gen::Proyectofinanciero
          can :manage, Cor1440Gen::Financiador
          can :manage, ::Tipomoneda
          can :manage, ::Tipoanexo
          can :manage, ::Cargo
          can :manage, :tablasbasicas
        else
          can :read, Cor1440Gen::Actividad
          can :read, Cor1440Gen::Proyectofinanciero
          #can :manage, Cor1440Gen::Informe
          can :manage, Cor1440Gen::Informe,
            oficina_id: { id: usuario.oficina_id}
          #can [:read, :update, :create, :destroy], Cor1440Gen::Actividad, oficina_id: { id: usuario.oficina_id}
        end
        #can :new, Usuario
        can [:read, :manage], Usuario, 
          oficina_id: { id: usuario.oficina_id}
      when Ability::ROLADMIN, Ability::ROLDIR
        can :manage, Cor1440Gen::Proyectofinanciero
        can :manage, Cor1440Gen::Actividad
        can :manage, Cor1440Gen::Informe
        can :manage, ::Usuario
        can :manage, :tablasbasicas
        tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

