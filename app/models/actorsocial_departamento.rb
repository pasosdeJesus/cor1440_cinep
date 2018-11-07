# encoding: UTF-8

class ActorsocialDepartamento < ActiveRecord::Base
  belongs_to :actorsocial, class_name: 'Sip::Actorsocial',
    foreign_key: 'actorsocial_id'
  belongs_to :departamentotrab, class_name: 'Sip::Departamento', 
    foreign_key: 'departamento_id'
end

