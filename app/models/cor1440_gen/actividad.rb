# encoding: UTF-8

require 'cor1440_gen/concerns/models/actividad'

module Cor1440Gen
  class Actividad < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Actividad

    belongs_to :departamento, class_name: 'Sip::Departamento'
    belongs_to :municipio, class_name: 'Sip::Municipio'
    belongs_to :redactor, class_name: '::Redactor'
    belongs_to :nucleoconflicto, class_name: '::Nucleoconflicto'

    has_many :actividad_actor, dependent: :delete_all,
      class_name: '::ActividadActor', foreign_key: 'actividad_id'
    has_many :actor, through: :actividad_actor,
      class_name: '::Actor'
    has_many :actividad_nucleoconflicto, dependent: :delete_all,
      class_name: '::ActividadNucleoconflicto', foreign_key: 'actividad_id'
    has_many :otronucleoconflicto, through: :actividad_nucleoconflicto,
      class_name: '::Nucleoconflicto'
    has_many :actividad_publicacion, dependent: :delete_all,
      class_name: '::ActividadPublicacion', foreign_key: 'actividad_id'
    has_many :publicacion, through: :actividad_publicacion,
      class_name: '::Publicacion'
    has_many :actividad_proyectofinanciero, dependent: :delete_all,
      class_name: 'Cor1440Gen::ActividadProyectofinanciero', 
      foreign_key: 'actividad_id'
    has_many :proyectofinanciero, through: :actividad_proyectofinanciero,
      class_name: 'Cor1440Gen::Proyectofinanciero'


    validates :desarrollo, length: { maximum: 5000 }
    validates :resultado, length: { maximum: 5000 }
    validates :papel, length: { maximum: 5000 }
    validates :participantes, length: { maximum: 5000 }
    validates :lugar, length: { maximum: 5000 }
    validates :duracion, numericality: { only_integer: true, 
      greater_than: 0,
      allow_nil: true 
    }

  end
end
