# encoding: utf-8

module Cor1440Gen
  class Mindicadorpf < ActiveRecord::Base
    include Sip::Modelo
    include Sip::Localizacion

    belongs_to :cor1440_gen_proyectofinanciero, 
      class_name: 'Cor1440Gen::Proyectofinanciero', 
      foreign_key: 'proyectofinanciero_id'
    belongs_to :cor1440_gen_indicadorpf, 
      class_name: 'Cor1440Gen::Indicadorpf', 
      foreign_key: 'indicadorpf_id'

    has_many :pmindicador, foreign_key: 'mindicadorpf_id', validate: true,
      dependent: :destroy, class_name: 'Cor1440Gen::Pmindicadorpf'
    accepts_nested_attributes_for :pmindicador, allow_destroy: true, 
      reject_if: :all_blank
    
  end
end
