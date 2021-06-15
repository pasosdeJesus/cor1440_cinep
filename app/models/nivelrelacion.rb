class Nivelrelacion < ActiveRecord::Base
  include Sip::Basica

  has_many :orgsocial, class_name: "Sip::Orgsocial", 
    foreign_key: 'nivelrelacion_id', validate: true
end
