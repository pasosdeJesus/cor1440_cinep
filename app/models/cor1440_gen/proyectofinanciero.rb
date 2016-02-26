# encoding: UTF-8

require 'cor1440_gen/concerns/models/proyectofinanciero'

module Cor1440Gen
  class Proyectofinanciero < ActiveRecord::Base
    @current_usuario = nil
    attr_accessor :current_usuario
    attr_accessor :duracion

    include Cor1440Gen::Concerns::Models::Proyectofinanciero
   
    belongs_to :tipomoneda, class_name: '::Tipomoneda',
      foreign_key: 'tipomoneda_id'
    
    validates :anotacionescontab, length: { maximum: 5000}
    validates :autenticarcompulsar, length: { maximum: 500}
    validates :copiasdesoporte, length: { maximum: 500}
    validates :emailrespagencia, length: { maximum: 100}
    validates :formatosespecificos, length: { maximum: 500}
    validates :formatossolicitudpago, length: { maximum: 500}
    validates :fuentefinanciador, length: { maximum: 1000 }
    validates :gestiones, length: { maximum: 5000}
    validates :informesnarrativos, length: { maximum: 500}
    validates :informesfinancieros, length: { maximum: 500}
    validates :informesauditoria, length: { maximum: 500}
    validates :referencia, presence: true, allow_blank: false,
      length: { maximum: 1000 }
    validates :referenciacinep, presence: true, allow_blank: false,
      length: { maximum: 1000 }
    validates :rendimientosfinancieros, length: { maximum: 500}
    validates :respagencia, length: { maximum: 100}
    validates :telrespagencia, length: { maximum: 100}

    validate :fechas_ordenadas
    def fechas_ordenadas
      if fechainicio && fechacierre && fechainicio > fechacierre
        errors.add(:fechacierre, 
                   "La fecha de cierre debe ser posterior a la de inicio")
      end
    end

  end
end
