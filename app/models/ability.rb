# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

  @@tablasbasicas = Cor1440Gen::Ability::BASICAS + [
    ['', 'actor'],
    ['', 'sectoractor']
  ]
  
  @@basicas_seq_con_id = Cor1440Gen::Ability::BASICAS_SID + [
    ['', 'actor'],
    ['', 'sectoractor']
  ]

  @@tablasbasicas_prio = BASICAS_PRIO + [
    ['', 'sectoractor']
  ]
end

