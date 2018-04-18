# encoding: UTF-8

class Tipocontrato < ActiveRecord::Base
	include Sip::Basica

  has_many :usuario, class_name: "Usuario",  foreign_key: "tipocontrato_id",
    validate: true 

end
