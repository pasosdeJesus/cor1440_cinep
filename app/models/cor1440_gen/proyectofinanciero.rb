# encoding: UTF-8

require 'cor1440_gen/concerns/models/proyectofinanciero'

module Cor1440Gen
  class Proyectofinanciero < ActiveRecord::Base

    include Cor1440Gen::Concerns::Models::Proyectofinanciero
    include Cor1440Gen::ApplicationHelper


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

    belongs_to :sectorapc, class_name: '::Sectorapc',
      foreign_key: 'sectorapc_id'
    belongs_to :respgp, class_name: '::Usuario',
      foreign_key: 'respgp_id'
    belongs_to :respgp2, class_name: '::Usuario',
      foreign_key: 'respgp2_id'
    belongs_to :tasaformulacion, class_name: '::Tasacambio',
      foreign_key: 'tasaformulacion_id'
    belongs_to :tipomoneda, class_name: '::Tipomoneda',
      foreign_key: 'tipomoneda_id'

    def duracion
      if fechainicio && fechacierre
        LibMisc.dif_meses_dias(fechainicio, fechacierre)
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

    campofecha_mesanio :fechaformulacion

    def montoejp_localizado
      r = 0
      r = montoej * tasaej if montoej && tasaej
      r.a_decimal_localizado
    end

    def aportecinepp_localizado
      r = 0
      r = aportecinep * tasa if aportecinep && tasa
      r.a_decimal_localizado
    end
 
    def aportecinepejp_localizado
      r = 0
      r = aportecinepej * tasaej if aportecinepej && tasaej
      r.a_decimal_localizado
    end
 
    def aporteotrosp_localizado
      r = 0
      r = aotrosfin * tasa if aotrosfin && tasa
      r.a_decimal_localizado
    end
 
    def aporteotrosejp_localizado
      r = 0
      r = aporteotrosej * tasaej if aporteotrosej && tasaej
      r.a_decimal_localizado
    end
 
    def saldop_localizado
      r = 0
      r = saldo * tasa if saldo && tasa
      r.a_decimal_localizado
    end
 
    def saldoejp_localizado
      r = 0
      r = saldoej * tasaej  if saldoej && tasaej
      r.a_decimal_localizado
    end
 
    def presupuestototalp_localizado
      r = 0 
      r = presupuestototal * tasa if presupuestototal && tasa
      r.a_decimal_localizado
    end
 
    def presupuestototalejp_localizado
      r = 0
      r = presupuestototalej * tasaej if presupuestototalej && tasaej
      r.a_decimal_localizado
    end
 
 
    has_many :indicadorobjetivo, foreign_key: 'proyectofinanciero_id',
      validate: true, dependent: :destroy, 
      class_name: 'Cor1440Gen::Indicadorpf'
    accepts_nested_attributes_for :indicadorobjetivo,
      allow_destroy: true, reject_if: :all_blank


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

    has_many :informeauditoria, dependent: :delete_all,
      class_name: '::Informeauditoria',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :informeauditoria, 
      allow_destroy: true, reject_if: :all_blank

    has_many :informeevaluacion, dependent: :delete_all,
      class_name: '::Informeevaluacion',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :informeevaluacion, 
      allow_destroy: true, reject_if: :all_blank

    has_many :informefinanciero, dependent: :delete_all,
      class_name: '::Informefinanciero',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :informefinanciero, 
      allow_destroy: true, reject_if: :all_blank

    has_many :informenarrativo, dependent: :delete_all,
      class_name: '::Informenarrativo',
      foreign_key: 'proyectofinanciero_id', validate: true
    accepts_nested_attributes_for :informenarrativo, 
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

    campofecha_localizado :fechaliquidacion
    campofecha_localizado :fechaformulacion

    flotante_localizado :aotrosfin
    flotante_localizado :aportecinep
    flotante_localizado :aportecinepej
    flotante_localizado :aporteotrosej
    flotante_localizado :monto
    flotante_localizado :montoej
    flotante_localizado :montopesos
    flotante_localizado :presupuestototal
    flotante_localizado :presupuestototalej
    flotante_localizado :saldo
    flotante_localizado :saldoej
    flotante_localizado :tasa
    flotante_localizado :tasaej

    validates :anotacionescontab, length: { maximum: 5000}
    validates :aotrosesp, length: { maximum: 500}
    validates :aportecinep, numericality: 
      { allow_blank: true, less_than: 1000000000000000000 }
    validates :domiciliofinanciador, allow_blank: true,
      length: { maximum: 511}
    validates :emailrespagencia, length: { maximum: 100}
    validates :estado, presence: true, allow_blank: false
    validates :fechaformulacion, presence: true  
    validates :fuentefinanciador, length: { maximum: 1000 }
    validates :gestiones, length: { maximum: 5000}
    validates :monto, numericality: 
      { less_than: 1000000000000000000 }
    validates :montopesos, numericality: 
      { less_than: 1000000000000000000 }
    validates :nitfinanciador, allow_blank: true,
      length: { maximum: 127}
    validates :objeto, length: { maximum: 5000}
    validates :observacionestramite, length: { maximum: 5000}
    validates :observacionesejecucion, length: { maximum: 5000}
    validates :observacionescierre, length: { maximum: 5000}
    validates :otrosaportescinep, length: { maximum: 500}
    validates :presupuestototal, numericality: 
      { less_than: 1000000000000000000 }
    validates :razonsocialfinanciador, allow_blank: true,
      length: { maximum: 511}
    validates :referencia, allow_blank: true,
      length: { maximum: 1000 }
    validates :referenciacinep, allow_blank: true,
      length: { maximum: 1000 }
    validates :replegalfinanciador, allow_blank: true,
      length: { maximum: 511}
    validates :respagencia, length: { maximum: 100}
    validates :saldo, numericality: {allow_blank: true,
                                     less_than: 1000000000000000000 }
    validates :skypefinanciador, allow_blank: true,
      length: { maximum: 127}
    validates :telrespagencia, length: { maximum: 100}
    validates :webfinanciador, allow_blank: true,
      length: { maximum: 511}

    validate :fechainicio_posterior2000 
    def fechainicio_posterior2000
      if fechainicio && fechainicio < Date.new(2000,1,1)
        errors.add(:fechainicio, 'Fecha de inicio debe ser posterior a 1/Ene/2000')
      end
    end

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

    
    scope :filtro_fechaformulacionini, lambda { |f|
      where('fechaformulacion >= ?', f)
    }

    scope :filtro_fechaformulacionfin, lambda { |f|
      where('fechaformulacion <= ?', f)
    }

    def presenta_nombre
      self.referenciacinep
    end

    def presenta(atr)
      case atr.to_s
      when 'compromiso_institucional'
        referenciacinep
      when 'estado'
        Sip::ModeloHelper.etiqueta_coleccion(::ApplicationHelper::ESTADO, estado)
      when 'monto_localizado'
        if tipomoneda_id.nil?
          monto_localizado
        else
          monto_localizado + ' ' + tipomoneda.codiso4217
        end
      when 'tutorarea'
        l = self.grupo.select {|g| g.nombre.start_with?('Línea')}
        return '' if l.count == 0
        gus = Sip::Grupo.where(nombre: 'Usuarios').take
        return '' if !gus
        ra = ::GrupoSubgrupo.where(
          "subgrupo_id in (?)", l.map(&:id)).where(
          "grupo_id<>#{gus.id}")
        return '' if ra.count == 0
        lt = []
        ra.each do |pa|
          a = Sip::Grupo.find(pa.grupo_id)
          if a.cn[0..3] == 'Area'
            ta = Sip::Grupo.where("cn LIKE ?", "Tutor#{a.cn[4..-1]}").take
            return "Falta grupo tutor de #{a.nombre}" if !ta
            gu = Sip::GrupoUsuario.where(sip_grupo_id: ta.id).take
            return "Falta usuario en grupo tutor #{a.nombre}" if !gu
            lt << ::Usuario.find(gu.usuario_id).presenta_nombre
          end
        end
        lt.uniq.join('; ')
      when 'coordinadorlinea'
        vl = self.grupo.select {|g| g.nombre.start_with?('Línea')}
        return '' if vl.count == 0
        lc = []
        vl.each do |lin|
          ta = Sip::Grupo.where("cn LIKE ?", "Coordinador#{lin.cn[5..-1]}").
            take
          return "Falta grupo coordinador para línea #{lin.nombre}" if !ta
          gu = Sip::GrupoUsuario.where(sip_grupo_id: ta.id).take
          return "Falta usuario en grupo coordinador para " +
            "la línea #{lin.nombre}" if !gu
          lc << ::Usuario.find(gu.usuario_id).presenta_nombre
        end
        lc.uniq.join('; ')
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
