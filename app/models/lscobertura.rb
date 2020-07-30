# encoding: UTF-8

class Lscobertura < ActiveRecord::Base
  include Sip::Basica

  validates :codigo, uniqueness: {
    message: 'no puede haber dos códigos iguales'
  }
  validates :codigo, length: { maximum: 3 }

end
