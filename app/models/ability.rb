# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

  @@tablasbasicas += [
    ['', 'actor'],
    ['', 'sectoractor']
  ]
  
  @@basicas_seq_con_id += [
    ['', 'actor'],
    ['', 'sectoractor']
  ]

  @@tablasbasicas_prio += [
    ['', 'sectoractor']
  ]
end

