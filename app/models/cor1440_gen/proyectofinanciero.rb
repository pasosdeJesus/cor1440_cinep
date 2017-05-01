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

    has_many :oficina_proyectofinanciero, dependent: :delete_all,
      class_name: '::OficinaProyectofinanciero',
      foreign_key: 'proyectofinanciero_id'
    has_many :oficina, through: :oficina_proyectofinanciero,
      class_name: 'Sip::Oficina'

    # Coordinador(es)
    has_many :coordinador_proyectofinanciero, dependent: :delete_all,
      class_name: '::CoordinadorProyectofinanciero',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :coordinador_proyectofinanciero, 
      allow_destroy: true, reject_if: :all_blank
    has_many :coordinador, through: :coordinador_proyectofinanciero,
      class_name: '::Usuario'
 
    # Responsable(s) 
    has_many :proyectofinanciero_uresponsable, dependent: :delete_all,
      class_name: '::ProyectofinancieroUresponsable',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :proyectofinanciero_uresponsable, 
      allow_destroy: true, reject_if: :all_blank
    has_many :uresponsable, through: :proyectofinanciero_uresponsable,
      class_name: '::Usuario'
 
    # Equipo de trabajo 
    has_many :proyectofinanciero_usuario, dependent: :delete_all,
      class_name: '::ProyectofinancieroUsuario',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :proyectofinanciero_usuario, 
      allow_destroy: true, reject_if: :all_blank
    has_many :usuario, through: :proyectofinanciero_usuario,
      class_name: '::Usuario'

 
    has_many :anexo_proyectofinanciero, dependent: :delete_all,
      class_name: '::AnexoProyectofinanciero',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :anexo_proyectofinanciero, 
      allow_destroy: true, reject_if: :all_blank
    has_many :sip_anexo, :through => :anexo_proyectofinanciero, 
            class_name: 'Sip::Anexo'
    accepts_nested_attributes_for :sip_anexo,  reject_if: :all_blank


    has_many :desembolso, dependent: :delete_all,
      class_name: '::Desembolso',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :desembolso, 
      allow_destroy: true, reject_if: :all_blank

    has_many :informenarrativo, dependent: :delete_all,
      class_name: '::Informenarrativo',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :informenarrativo, 
      allow_destroy: true, reject_if: :all_blank

    has_many :informefinanciero, dependent: :delete_all,
      class_name: '::Informefinanciero',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :informefinanciero, 
      allow_destroy: true, reject_if: :all_blank

    has_many :informeauditoria, dependent: :delete_all,
      class_name: '::Informeauditoria',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :informeauditoria, 
      allow_destroy: true, reject_if: :all_blank

    validates :anotacionescontab, length: { maximum: 5000}
    flotante_localizado :aportecinep
    validates :aportecinep, numericality: 
      { allow_blank: true, less_than: 1000000000000000000 }
    #validates :autenticarcompulsar, length: { maximum: 500}
    validates :emailrespagencia, length: { maximum: 100}
    #validates :formatosespecificos, length: { maximum: 500}
    #validates :formatossolicitudpago, length: { maximum: 500}
    validates :fuentefinanciador, length: { maximum: 1000 }
    validates :gestiones, length: { maximum: 5000}
    flotante_localizado :monto
    validates :monto, numericality: 
      { less_than: 1000000000000000000 }
    validates :otrosaportescinep, length: { maximum: 500}
    flotante_localizado :aotrosfin
    validates :aotrosesp, length: { maximum: 500}
    flotante_localizado :presupuestototal
    validates :presupuestototal, numericality: 
      { greater_than: 0, less_than: 1000000000000000000 }
    validates :referencia, presence: true, allow_blank: false,
      length: { maximum: 1000 }
    validates :referenciacinep, presence: true, allow_blank: false,
      length: { maximum: 1000 }
    #validates :rendimientosfinancieros, length: { maximum: 500}
    validates :respagencia, length: { maximum: 100}
    flotante_localizado :saldo
    validates :saldo, numericality: {allow_blank: true,
                                     less_than: 1000000000000000000 }
    validates :telrespagencia, length: { maximum: 100}

    campofecha_localizado :fechaliquidacion

#    validate :tiene_coordinador
#    def tiene_coordinador
#      if coordinador_proyectofinanciero.count == 0
#        errors.add(:coordinador, 
#                   "Falta un coordinador en la pestaña Recursos Humanos")
#      end
#    end


  end
end
