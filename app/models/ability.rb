# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

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
end

