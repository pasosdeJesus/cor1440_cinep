# encoding: UTF-8

class Tiponomina < ActiveRecord::Base
	include Sip::Basica

   has_many :contrato, validate: true, inverse_of: :tiponomina


end
