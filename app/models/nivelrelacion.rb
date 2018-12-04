# encoding: UTF-8

class Nivelrelacion < ActiveRecord::Base
	include Sip::Basica

  has_many :actor, class_name: "Sip::Actorsocial", 
    foreign_key: 'nivelrelacion_id', validate: true
end
