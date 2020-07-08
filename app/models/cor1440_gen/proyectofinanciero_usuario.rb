require 'cor1440_gen/concerns/models/proyectofinanciero_usuario'

module Cor1440Gen
  class ProyectofinancieroUsuario < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::ProyectofinancieroUsuario
    include Sip::Localizacion

    belongs_to :cargo, class_name: '::Cargo',
      foreign_key: 'cargo_id', optional: true
    belongs_to :perfilprofesional, class_name: '::Perfilprofesional',
      foreign_key: 'perfilprofesional_id', optional: true
    belongs_to :tipocontrato, class_name: '::Tipocontrato',
      foreign_key: 'tipocontrato_id', optional: true

    validates :cargo, presence: true

    validates :porcentaje, numericality: {
      greater_than_or_equal: 0, less_than_or_equal_to: 100 
    }, allow_blank: true

  end
end
