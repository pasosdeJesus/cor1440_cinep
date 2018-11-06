# encoding: UTF-8

class ActorsocialGrupo < ActiveRecord::Base
  belongs_to :actorsocial, class_name: 'Sip::Actorsocial',
    foreign_key: 'actorsocial_id'
  belongs_to :grupo, class_name: 'Sip::Grupo', 
    foreign_key: 'grupo_id'
end

