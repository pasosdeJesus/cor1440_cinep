# encoding: UTF-8

require 'cor1440_gen/concerns/models/proyectofinanciero'

module Cor1440Gen
  class Proyectofinanciero < ActiveRecord::Base

    include Cor1440Gen::Concerns::Models::Proyectofinanciero
    include ApplicationHelper


    @current_usuario = nil
    attr_accessor :current_usuario
    attr_accessor :duracion
    attr_accessor :semestreformulacion
    attr_accessor :montoejp_localizado
    attr_accessor :aportecinepp_localizado
    attr_accessor :aportecinepejp_localizado
    attr_accessor :aporteotrosp_localizado
    attr_accessor :aporteotrosejp_localizado
    attr_accessor :saldop_localizado
    attr_accessor :saldoejp_localizado
    attr_accessor :presupuestototalp_localizado
    attr_accessor :presupuestototalejp_localizado
    cattr_accessor :ip
    cattr_accessor :current_usuario
    serialize :cambios

    belongs_to :respgp, class_name: '::Usuario',
      foreign_key: 'respgp_id'
    belongs_to :tasaformulacion, class_name: '::Tasacambio',
      foreign_key: 'tasaformulacion_id'
    belongs_to :tipomoneda, class_name: '::Tipomoneda',
      foreign_key: 'tipomoneda_id'

    def duracion
      if fechainicio && fechacierre
        dif_meses_dias(fechainicio, fechacierre)
      else
        ''
      end
    end

    def semestreformulacion
      if fechaformulacion
        if fechaformulacion.month<=6
          '1'
        else
          '2'
        end        
      end
    end


    def anioformulacion
      fechaformulacion.year 
    end

    def mesformulacion
      fechaformulacion.month
    end

    def anioformulacion=(a)
      if self.fechaformulacion 
        self.fechaformulacion = Date.new(a.to_i, 
                                         self.fechaformulacion.month, 15) 
      else
        self.fechaformulacion = Date.new(a.to_i, 6, 15)
      end
    end

    def mesformulacion=(m)
      if self.fechaformulacion 
        self.fechaformulacion = Date.new(self.fechaformulacion.year, 
                                         m.to_i, 15)
      else
        self.fechaformulacion = Date.new(Date.today.year, m.to_i, 15)
      end
    end

    def mesformulacion_localizado
      fechaformulacion.year.to_s + "-" + fechaformulacion.month.to_s
    end

    def montoejp_localizado
      if montoej && tasaej
        return montoej * tasaej
      else
        return 0
      end
    end

    def aportecinepp_localizado
      if aportecinep && tasa
        return aportecinep * tasa
      else
        return 0
      end
    end
 
    def aportecinepejp_localizado
      if aportecinepej && tasaej
        return aportecinepej * tasaej
      else
        return 0
      end
    end
 
    def aporteotrosp_localizado
      if aotrosfin && tasa
        return aotrosfin * tasa
      else
        return 0
      end
    end
 
    def aporteotrosejp_localizado
      if aporteotrosej && tasaej
        return aporteotrosej * tasaej
      else
        return 0
      end
    end
 
    def saldop_localizado
      if saldo && tasa
        return saldo * tasa
      else
        return 0
      end
    end
 
    def saldoejp_localizado
      if saldoej && tasaej
        return saldoej * tasaej
      else
        return 0
      end
    end
 
    def presupuestototalp_localizado
      if presupuestototal && tasa
        return presupuestototal * tasa
      else
        return 0
      end
    end
 
    def presupuestototalejp_localizado
      if presupuestototalej && tasaej
        return presupuestototalej * tasaej
      else
        return 0
      end
    end
 
 
    has_many :indicadorobjetivo, foreign_key: 'proyectofinanciero_id',
      validate: true, dependent: :destroy, 
      class_name: 'Cor1440Gen::Indicadorpf'
    accepts_nested_attributes_for :indicadorobjetivo,
      allow_destroy: true, reject_if: :all_blank


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

    has_many :cambiosproyectofinanciero, dependent: :delete_all,
      class_name: 'Cor1440Gen::Cambiosproyectofinanciero',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :cambiosproyectofinanciero, 
      allow_destroy: true, reject_if: :all_blank


    validates :anotacionescontab, length: { maximum: 5000}
    validates :aotrosesp, length: { maximum: 500}
    flotante_localizado :aotrosfin
    flotante_localizado :aportecinep
    validates :aportecinep, numericality: 
      { allow_blank: true, less_than: 1000000000000000000 }
    flotante_localizado :tasa
    flotante_localizado :tasaej
    flotante_localizado :montoej
    flotante_localizado :aportecinepej
    flotante_localizado :aporteotrosej
    flotante_localizado :saldoej
    flotante_localizado :presupuestototalej
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

    
    scope :filtro_fechaformulacion_localizadaini, lambda { |f|
      where('fechaformulacion >= ?', 
            Sip::FormatoFechaHelper.fecha_local_estandar(f))
    }

    scope :filtro_fechaformulacion_localizadafin, lambda { |f|
      where('fechaformulacion <= ?', 
            Sip::FormatoFechaHelper.fecha_local_estandar(f))
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

# after_update o after_commit solo ven cambios a este objeto
#    after_commit do
#      if saved_changes != {}
#        c = Cor1440Gen::Cambiosproyectofinanciero.new(cuando: updated_at,
#                                                      usuario_id: current_usuario.id,
#                                                      ip: ip,
#                                                      proyectofinanciero_id: self.id,
#                                                      cambios: saved_changes)
#        c.save!
#      end
#    end

  end
end
