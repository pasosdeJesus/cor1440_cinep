# encoding: UTF-8

require 'cor1440_gen/concerns/models/proyectofinanciero'

module Cor1440Gen
  class Proyectofinanciero < ActiveRecord::Base
    @current_usuario = nil
    attr_accessor :current_usuario
    attr_accessor :duracion

    include Cor1440Gen::Concerns::Models::Proyectofinanciero
   
    belongs_to :respgp, class_name: '::Usuario',
      foreign_key: 'respgp_id'
    belongs_to :tasaformulacion, class_name: '::Tasacambio',
      foreign_key: 'tasaformulacion_id'
    belongs_to :tipomoneda, class_name: '::Tipomoneda',
      foreign_key: 'tipomoneda_id'

    #has_many :oficina_proyectofinanciero, dependent: :delete_all,
    #  class_name: '::OficinaProyectofinanciero',
    #  foreign_key: 'proyectofinanciero_id'
    #has_many :oficina, through: :oficina_proyectofinanciero,
    #  class_name: 'Sip::Oficina'

    has_many :grupo_proyectofinanciero, dependent: :delete_all,
      class_name: '::GrupoProyectofinanciero',
      foreign_key: 'proyectofinanciero_id'
    has_many :grupo, through: :grupo_proyectofinanciero,
      class_name: 'Sip::Grupo'

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

    has_many :productopf, dependent: :delete_all,
      class_name: '::Productopf',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :productopf, 
      allow_destroy: true, reject_if: :all_blank



    validates :anotacionescontab, length: { maximum: 5000}
    validates :aotrosesp, length: { maximum: 500}
    flotante_localizado :aotrosfin
    flotante_localizado :aportecinep
    validates :aportecinep, numericality: 
      { allow_blank: true, less_than: 1000000000000000000 }
    validates :emailrespagencia, length: { maximum: 100}

    #requerido para cuadro general de seguimiento
    validates :estado, presence: true, allow_blank: false

    campofecha_localizado :fechaliquidacion
    campofecha_localizado :fechaformulacion

    #requerido para cuadro general de seguimiento
    validates :fechaformulacion, presence: true  
    
    validates :fuentefinanciador, length: { maximum: 1000 }
    validates :gestiones, length: { maximum: 5000}
    flotante_localizado :monto
    validates :monto, numericality: 
      { less_than: 1000000000000000000 }
    flotante_localizado :montopesos
    validates :montopesos, numericality: 
      { less_than: 1000000000000000000 }
    validates :objeto, length: { maximum: 5000}
    validates :observacionestramite, length: { maximum: 5000}
    validates :observacionesejecucion, length: { maximum: 5000}
    validates :observacionescierre, length: { maximum: 5000}
    validates :otrosaportescinep, length: { maximum: 500}
    flotante_localizado :presupuestototal
    validates :presupuestototal, numericality: 
      { less_than: 1000000000000000000 }
    validates :referencia, allow_blank: true,
      length: { maximum: 1000 }
    validates :referenciacinep, allow_blank: true,
      length: { maximum: 1000 }
    validates :respagencia, length: { maximum: 100}
    flotante_localizado :saldo
    validates :saldo, numericality: {allow_blank: true,
                                     less_than: 1000000000000000000 }
    validates :telrespagencia, length: { maximum: 100}


    validate :dificultad_valida
    def dificultad_valida
      cv = ::ApplicationHelper::DIFICULTAD.map {|r| r[1].to_s}
      if !cv.include?(dificultad)
        errors.add(:dificultad, 'Dificultad no es válida')
      end
    end

    validate :estado_valido
    def estado_valido
      cv = ::ApplicationHelper::ESTADO.map {|r| r[1].to_s}
      if !cv.include?(estado)
        errors.add(:estado, 'Estado no es válido')
      end
    end
#    validate :tiene_coordinador
#    def tiene_coordinador
#      if coordinador_proyectofinanciero.count == 0
#        errors.add(:coordinador, 
#                   "Falta un coordinador en la pestaña Recursos Humanos")
#      end
#    end

    def filtra_acceso(current_usuario, pf, params)
      mg = Cor1440Gen::GruposHelper.mis_grupos_sinus(current_usuario)
      if mg.count == 0
        pf = pf.where('TRUE=FALSE')
      end
      return pf
    end

    scope :filtro_referenciacinep, lambda { |rc|
      where("unaccent(referenciacinep) ILIKE '%' || unaccent(?) || '%'",
            rc)
    }

    scope :filtro_uresponsable_ids, lambda { |r|
      joins(:proyectofinanciero_uresponsable).
        where('proyectofinanciero_uresponsable.uresponsable_id=?',
            r)
    }

    scope :filtro_grupo_ids, lambda { |g|
      joins(:grupo_proyectofinanciero).
        where('grupo_proyectofinanciero.grupo_id=?', g)
    }

    scope :filtro_respgp_id, lambda { |r|
      where('respgp_id=?', r)
    }


    scope :filtro_estado, lambda { |e|
      where(estado: e)
    }

    def presenta(atr)
      if (atr == 'estado')
        Sip::ModeloHelper.etiqueta_coleccion(::ApplicationHelper::ESTADO, estado)
      elsif (atr == 'monto_localizado')
        if tipomoneda_id.nil?
          monto_localizado
        else
          monto_localizado + ' ' + tipomoneda.codiso4217
        end
      else
        presenta_gen(atr)
      end
    end

  end
end
