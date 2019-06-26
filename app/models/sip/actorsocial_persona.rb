# encoding: UTF-8

require 'sip/concerns/models/actorsocial_persona'

module Sip
  class ActorsocialPersona < ActiveRecord::Base
    include Sip::Concerns::Models::ActorsocialPersona

    accepts_nested_attributes_for :persona, reject_if: :all_blank

    validates :correo, length: {maximum: 254}, 
      format: { with: URI::MailTo::EMAIL_REGEXP, 
        message: 'Formato de correo incorrecto'}
    validates :cargo, length: {maximum: 254}
  end
end
