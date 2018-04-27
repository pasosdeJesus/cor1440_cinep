# encoding: UTF-8

class Procesogh < ActiveRecord::Base
	include Sip::Basica

  has_many :grupo,  class_name: "::Sip::Grupo",
     foreign_key: "procesogh_id", validate: true   
end
