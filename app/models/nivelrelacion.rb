# encoding: UTF-8

class Nivelrelacion < ActiveRecord::Base
	include Sip::Basica

  has_many :actor, class_name: "Actor", foreign_key: 'nivelrelacion_id',
    validate: true
end
