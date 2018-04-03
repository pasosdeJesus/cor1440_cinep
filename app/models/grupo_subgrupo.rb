# encoding: UTF-8

class GrupoSubgrupo < ActiveRecord::Base

  belongs_to :grupo, class_name: 'Sip::Grupo',
    foreign_key: 'grupo_id', validate: true
  belongs_to :subgrupo, class_name: 'Sip::Grupo',
    foreign_key: 'subgrupo_id', validate: true

end
