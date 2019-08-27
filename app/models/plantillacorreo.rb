# encoding: UTF-8

class Plantillacorreo < ActiveRecord::Base
  include Sip::Basica
  has_rich_text :contenido
  validates :contenido, length: { maximum: 5000 }
end
