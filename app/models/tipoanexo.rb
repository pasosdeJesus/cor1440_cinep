# encoding: UTF-8

class Tipoanexo < ActiveRecord::Base
	include Sip::Basica
  has_many :anexo_proyectofinanciero
end
