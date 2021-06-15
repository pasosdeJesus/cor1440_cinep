require 'sip/concerns/models/orgsocial_persona'

module Sip
  class OrgsocialPersona < ActiveRecord::Base
    include Sip::Concerns::Models::OrgsocialPersona

    validates :correo, length: {maximum: 254}, allow_blank: true,
      format: { with: URI::MailTo::EMAIL_REGEXP, 
        message: 'Formato de correo incorrecto'}
    validates :cargo, length: {maximum: 254}
  end
end
