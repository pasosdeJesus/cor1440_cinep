# encoding: UTF-8

require 'sip/concerns/models/oficina'

module Sip
  class Oficina < ActiveRecord::Base
    include Sip::Concerns::Models::Oficina

#    has_many :oficina_proyectofinanciero, dependent: :delete_all,
#      class_name: '::OficinaProyectofinanciero', 
#      foreign_key: 'oficina_id'
#    has_many :organigramacinep, through: :oficina_proyectofinanciero,
#      class_name: 'Cor1440Gen::Proyectofinanciero'

  end
end
