# encoding: UTF-8

require 'cor1440_gen/concerns/models/tipoindicador'

module Cor1440Gen
  class Tipoindicador < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Tipoindicador


    has_many :pprogtind, foreign_key: 'tipoindicador_id',
      validate: true, dependent: :destroy, 
      class_name: 'Cor1440Gen::Pprogtind'
    accepts_nested_attributes_for :pprogtind,
      allow_destroy: true, reject_if: :all_blank

    validates :desc20, length: {maximum: 128}
    validates :desc40, length: {maximum: 128}
    validates :desc60, length: {maximum: 128}
    validates :desc80, length: {maximum: 128}
    validates :desc100, length: {maximum: 128}

    def presenta(atr)
      if atr == 'medircon'
        case medircon
        when 1 
          return 'Actividades'
        when 2
          return 'Efectos'
        when 3
          return 'Compromisos Institucionales'
        end
      end
      return presenta_gen(atr)
    end

  end
end
