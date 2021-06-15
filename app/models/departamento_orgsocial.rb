class DepartamentoOrgsocial < ActiveRecord::Base
  belongs_to :orgsocial, class_name: 'Sip::Orgsocial',
    foreign_key: 'orgsocial_id'
  belongs_to :departamentotrab, class_name: 'Sip::Departamento', 
    foreign_key: 'departamento_id'
end

