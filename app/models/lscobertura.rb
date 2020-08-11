# encoding: UTF-8

class Lscobertura < ActiveRecord::Base
  include Sip::Basica

  validates :codigo, uniqueness: {
    message: 'no puede haber dos códigos iguales'
  }, length: { maximum: 3 }, presence: true

end
