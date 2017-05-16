# encoding: UTF-8

require 'sip/concerns/models/grupo'

module Sip
  class Grupo < ActiveRecord::Base
    include Sip::Concerns::Models::Grupo

    has_many :regiongrupo, foreign_key: "grupo_id", validate: true, 
      class_name: '::Regiongrupo'
  end
end
