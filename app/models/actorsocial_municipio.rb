# encoding: UTF-8

class ActorsocialMunicipio< ActiveRecord::Base
  belongs_to :actorsocial, class_name: 'Sip::Actorsocial',
    foreign_key: 'actorsocial_id'
  belongs_to :municipiotrab, class_name: 'Sip::Municipio', 
    foreign_key: 'municipio_id'
end

