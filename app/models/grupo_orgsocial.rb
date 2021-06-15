class GrupoOrgsocial < ActiveRecord::Base
  belongs_to :orgsocial, class_name: 'Sip::Orgsocial',
    foreign_key: 'orgsocial_id'
  belongs_to :grupo, class_name: 'Sip::Grupo', 
    foreign_key: 'grupo_id'
end

