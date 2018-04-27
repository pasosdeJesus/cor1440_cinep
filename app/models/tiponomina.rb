# encoding: UTF-8

class Tiponomina < ActiveRecord::Base
	include Sip::Basica

   has_many :tipocontrato, validate: true, inverse_of: :tiponomina


end
