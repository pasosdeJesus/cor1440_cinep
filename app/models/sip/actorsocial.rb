# encoding: UTF-8

require 'cor1440_gen/concerns/models/actorsocial'

module Sip
  class Actorsocial < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Actorsocial

    belongs_to :nivelrelacion, class_name: "::Nivelrelacion",
      foreign_key: "nivelrelacion_id", validate: true

    has_many :actorsocial_departamento, dependent: :delete_all
    has_many :departamentotrab, through: :actorsocial_departamento,
      class_name: 'Sip::Departamento'

    has_many :actorsocial_efecto, dependent: :delete_all
    has_many :efecto, through: :actorsocial_efecto

    has_many :actorsocial_grupo, validate: true, dependent: :delete_all
      #class_name: '::ActorsocialGrupo', foreign_key: "actorsocial_id", 
    has_many :grupo, class_name: 'Sip::Grupo',
      through: :actorsocial_grupo

    has_many :actorsocial_municipio, dependent: :delete_all
    has_many :municipiotrab, through: :actorsocial_municipio,
      class_name: 'Sip::Municipio'

    has_many :actorsocial_regiongrupo, validate: true, 
      dependent: :delete_all
      #class_name: '::ActorsocialRegiongrupo', foreign_key: "actorsocial_id"
    has_many :regiongrupo, class_name: '::Regiongrupo',
      through: :actorsocial_regiongrupo

    campofecha_localizado :fechadeshabilitacion
    
    campofecha_localizado :created_at

    validates :personacontacto, length: { maximum: 100 }
    validates :cargo, length: { maximum: 100 }
    validates :correo, length: { maximum: 100 }
    validates :telefono, length: { maximum: 100 }
    validates :fax, length: { maximum: 100 }
    validates :celular, length: { maximum: 100 }
    validates :direccion, length: { maximum: 200 }
    validates :ciudad, length: { maximum: 200 }

    scope :habilitados, -> () {
      where(fechadeshabilitacion: nil)
    }

    attr_accessor :habilitado

    def habilitado
      fechadeshabilitacion.nil? ? 'Si' : 'No'
    end

    def self.human_attribute_name(atr, options = {})
      if (atr.to_s == "{:actorsocial_ids=>[]}")
        "Actores"
      elsif (atr.to_s == "{:sectoractor_ids=>[]}")
        "Sectores"
      else
        super(atr, options)
      end
    end

    scope :filtro_created_atini, lambda { |f|
      where('date(created_at) >= ?', f)
    }

    scope :filtro_created_atfin, lambda { |f|
      where('date(created_at) <= ?', f)
    }

    scope :filtro_grupo_ids, lambda { |g|
      joins(:actorsocial_grupo).where('actorsocial_grupo.grupo_id=?', g)
    }

    scope :filtro_habilitado, lambda {|o|
      if o.upcase.strip == 'SI'
        where(fechadeshabilitacion: nil)
      elsif o.upcase.strip == 'NO'
        where.not(fechadeshabilitacion: nil)
      end 
    }

    scope :filtro_lineabase20182020, lambda {|o|
      if o.upcase.strip == 'SI'
        where(lineabase20182020: true)
      elsif o.upcase.strip == 'NO'
        where(lineabase20182020: false)
      end 
    }

    scope :filtro_nivelrelacion_id, lambda { |n|
      where(nivelrelacion_id: n)
    }

    scope :filtro_personacontacto, lambda { |p|
      where("personacontacto ILIKE '%' || unaccent(?) || '%'", p)
    }

    scope :filtro_regiongrupo_ids, lambda { |r|
      joins(:actorsocial_regiongrupo).where(
        'actorsocial_regiongrupo.regiongrupo_id=?', r)
    }

    scope :filtro_sectoractor_ids, lambda { |s|
      joins(:actorsocial_sectoractor).where(
        'sip_actorsocial_sectoractor.sectoractor_id=?', s)
    }

    def presenta(atr)
      #byebug
      case atr.to_s
      when 'created_at_localizada'
        Sip::FormatoFechaHelper::fecha_estandar_local(self.created_at.utc.to_date)
      else
        presenta_gen(atr)
      end
    end

  end
end
