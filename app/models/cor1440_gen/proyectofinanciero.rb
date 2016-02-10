# encoding: UTF-8

require 'cor1440_gen/concerns/models/proyectofinanciero'

module Cor1440Gen
  class Proyectofinanciero < ActiveRecord::Base
    @current_usuario = nil
    attr_accessor :current_usuario

    include Cor1440Gen::Concerns::Models::Proyectofinanciero
    
    validates :referencia, presence: true, allow_blank: false,
      length: { maximum: 1000 }
    validates :referenciacinep, presence: true, allow_blank: false,
      length: { maximum: 1000 }
    validates :fuentefinanciacion, length: { maximum: 1000 }
    validates :respagencia, length: { maximum: 100}
    validates :emailrespagencia, length: { maximum: 100}
    validates :telrespagencia, length: { maximum: 100}

  end
end
