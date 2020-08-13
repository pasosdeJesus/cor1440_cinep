class RenombraCsiviSubgrupo < ActiveRecord::Migration[6.0]
  def up
    stcivcinep = Sip::Grupo.where(nombre:'CSIVI').take
    if stcivcinep.nil?
      puts "Falta grupo CSIVI"
      exit 1
    end
    stcivcinep.nombre='STCIV_CINEP'
    stcivcinep.cn='stciv_cinep'
    if stcivcinep.valid?
      stcivcinep.save!
    end
    stciv = Sip::Grupo.where(nombre:'STCIV').take
    stciv.cn='stciv'
    stciv.subgrupo_ids = [stcivcinep.id]
    if stciv.valid?
      stciv.save!
    end
  end
  def down
    stciv = Sip::Grupo.where(nombre:'STCIV').take
    stciv.subgrupo_ids = []
    if stciv.valid?
      stciv.save!
    end
    stcivcinep = Sip::Grupo.where(nombre:'STCIV_CINEP').take
    stcivcinep.nombre='CSIVI'
    stcivcinep.cn='csivi'
    if stcivcinep.valid?
      stcivcinep.save!
    end
  end
end
