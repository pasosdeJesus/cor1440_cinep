# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

  ROLOPERADOR = 5

  ROLES = [
    ["Administrador", ROLADMIN], 
    ["Directivo", ROLDIR],
    ["Operador", ROLOPERADOR]
  ]

  @@tablasbasicas -=   [ ['Cor1440Gen', 'proyectofinanciero'] ]

  @@tablasbasicas += [
    ['', 'actor'],
    ['', 'nucleoconflicto'],
    ['', 'publicacion'],
    ['', 'redactor'],
    ['', 'sectoractor']
  ]
  
  @@tablasbasicas_prio += [
    ['', 'sectoractor']
  ]

  # Ver documentacion de este metodo en app/models/ability de sip
  def initialize(usuario)
    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    can :descarga_anexo, Sip::Anexo
    if !usuario.nil? && !usuario.rol.nil? then
      can :nuevo, Cor1440Gen::Actividad
      case usuario.rol 
      when Ability::ROLOPERADOR
        if usuario && usuario.rol && usuario.oficina == 27
          can :manage, Cor1440Gen::Proyectofinanciero
        else
          #can :manage, Cor1440Gen::Actividad
          can :read, Cor1440Gen::Proyectofinanciero
          can :manage, Cor1440Gen::Informe
          can [:update, :create, :destroy], Cor1440Gen::Actividad, 
            oficina: { id: usuario.oficina_id}
        end
        #can :new, Usuario
        can [:read, :manage], Usuario, oficina: { id: usuario.oficina_id}
      when Ability::ROLADMIN, Ability::ROLDIR
        can :manage, Cor1440Gen::Proyectofinanciero
        can :manage, Cor1440Gen::Actividad
        can :manage, Cor1440Gen::Informe
        can :manage, Usuario
        can :manage, :tablasbasicas
        @@tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

