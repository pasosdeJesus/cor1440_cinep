# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

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

