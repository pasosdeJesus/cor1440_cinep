# encoding: UTF-8

class Tipocontrato < ActiveRecord::Base
	include Sip::Basica

  belongs_to :tiponomina, class_name: "Tiponomina", 
    foreign_key: "tiponomina_id", validate: true, optional: true

  has_many :contrato, class_name: "::Contrato",  foreign_key: "tipocontrato_id",
    validate: true 

end
