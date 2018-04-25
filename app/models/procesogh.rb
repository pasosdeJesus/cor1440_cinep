# encoding: UTF-8

class Procesogh < ActiveRecord::Base
	include Sip::Basica

  has_many :contrato,  class_name: "Contrato",
     foreign_key: "procesogh_id", validate: true   
end
