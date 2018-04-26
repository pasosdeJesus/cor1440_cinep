# encoding: UTF-8

class Sectorapc < ActiveRecord::Base
	include Sip::Basica

  has_many :cor1440_gen_proyectofinanciero, 
    class_name: "Cor1440Gen::Proyectofinanciero",  
    foreign_key: "sectorapc_id", validate: true 

end
