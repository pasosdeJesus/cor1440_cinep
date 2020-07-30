class Lsmun < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha

  belongs_to :lsdep, class_name: '::Lsdep', 
    foreign_key: 'lsdep_id'
  belongs_to :municipio, class_name: 'Sip::Municipio', 
    foreign_key: 'municipio_id'

  validates :orden, presence: true

end
