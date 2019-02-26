# encoding: UTF-8

module Cor1440Gen
  class Pprogtind < ActiveRecord::Base
    include Sip::Modelo 

    belongs_to :tipoindicador, class_name: 'Cor1440Gen::Tipoindicador',
            foreign_key: 'tipoindicador_id'

    validates :fase, length: { maximum: 1024}
    validates :porcentaje, numericality: { 
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    }, uniqueness: { scope: :tipoindicador_id }

  end # included
end

