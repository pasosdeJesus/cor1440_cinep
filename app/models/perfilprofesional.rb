# encoding: UTF-8

class Perfilprofesional < ActiveRecord::Base
	include Sip::Basica

   has_many :usuario, class_name: "::Usuario", 
     foreign_key: "perfilprofesional_id", validate: true

end
