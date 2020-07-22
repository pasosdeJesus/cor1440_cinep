# encoding: UTF-8

require 'sip/concerns/models/actorsocial_persona'

module Sip
  class ActorsocialPersona < ActiveRecord::Base
    include Sip::Concerns::Models::ActorsocialPersona

    validates :correo, length: {maximum: 254}, allow_blank: true,
      format: { with: URI::MailTo::EMAIL_REGEXP, 
        message: 'Formato de correo incorrecto'}
    validates :cargo, length: {maximum: 254}
  end
end
