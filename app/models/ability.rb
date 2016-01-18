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
    super(usuario)

    if usuario && usuario.rol 
        can :manage, Cor1440Gen::Proyectofinanciero
    end
  end

end

