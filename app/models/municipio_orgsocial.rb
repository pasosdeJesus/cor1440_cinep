class MunicipioOrgsocial < ActiveRecord::Base
  belongs_to :orgsocial, class_name: 'Sip::Orgsocial',
    foreign_key: 'orgsocial_id'
  belongs_to :municipiotrab, class_name: 'Sip::Municipio', 
    foreign_key: 'municipio_id'
end

