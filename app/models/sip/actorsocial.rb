# encoding: UTF-8

require 'cor1440_gen/concerns/models/actorsocial'

module Sip
  class Actorsocial < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Actorsocial

    belongs_to :nivelrelacion, class_name: "::Nivelrelacion",
      foreign_key: "nivelrelacion_id", validate: true, optional: true
    belongs_to :csivinivelgeo, class_name: "::Csivinivelgeo",
      foreign_key: "csivinivelgeo_id", validate: true, optional: true
    belongs_to :csivinivelresp, class_name: "::Csivinivelresp",
      foreign_key: "csivinivelresp_id", validate: true, optional: true

    has_many :actorsocial_departamento, dependent: :delete_all
    has_many :departamentotrab, through: :actorsocial_departamento,
      class_name: 'Sip::Departamento'

    has_many :actorsocial_grupo, dependent: :delete_all,
      class_name: '::ActorsocialGrupo', foreign_key: "actorsocial_id"
    has_many :grupo, class_name: 'Sip::Grupo',
      through: :actorsocial_grupo

    has_many :actorsocial_municipio, dependent: :delete_all
    has_many :municipiotrab, through: :actorsocial_municipio,
      class_name: 'Sip::Municipio'

    has_many :actorsocial_regiongrupo, dependent: :delete_all,
      class_name: '::ActorsocialRegiongrupo', foreign_key: "actorsocial_id"
    has_many :regiongrupo, class_name: '::Regiongrupo',
      through: :actorsocial_regiongrupo

    has_and_belongs_to_many :csivitema, 
      class_name: '::Csivitema',
      foreign_key: 'actorsocial_id',
      association_foreign_key: 'csivitema_id',
      join_table: 'actorsocial_csivitema'




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

    scope :filtro_csivinivelgeo_id, lambda { |n|
      where(csivinivelgeo_id: n)
    }
    
    scope :filtro_csivinivelresp_id, lambda { |n|
      where(csivinivelgeo_id: n)
    }

    scope :filtro_csivitema, lambda { |t|
      joins(:csivitema).where('csivitema.id=?', t)
    }

    scope :filtro_grupo_ids, lambda { |g|
      joins(:actorsocial_grupo).where('actorsocial_grupo.grupo_id=?', g)
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

    scope :filtro_actorsocial_persona, lambda { |c|
      joins(:persona).
        where("(sip_persona.nombres || ' ' || sip_persona.apellidos 
               || ' ' || COALESCE(sip_actorsocial_persona.cargo, '')
               || ' ' || COALESCE(sip_actorsocial_persona.correo, '')
              ) ILIKE ?", "%#{c}%")
    }


    def presenta(atr)
      case atr.to_s
      when '{:actorsocial_persona=>[]}', 'actorsocial_persona'
        self.actorsocial_persona.inject('') do |memo, ap|
          n = ap.persona.nombres ? ap.persona.nombres : 'N'
          a = ap.persona.apellidos ? ap.persona.apellidos : 'N'
          c = ap.cargo ? ap.cargo + '. ' : ''
          e = ap.correo ? ap.correo : ''
          if c || e
            com = ' (' + c + e + ')'
          end
          (memo == '' ? '' : memo + '; ') + n + ' ' + a + com
        end
      when 'contactos_nombres'
        self.actorsocial_persona.inject('') do |memo, ap|
          n = ap.persona.nombres ? ap.persona.nombres : 'N'
          a = ap.persona.apellidos ? ap.persona.apellidos : 'N'
          (memo == '' ? '' : memo + ', ') + n + ' ' + a
        end
      when 'contactos_correos'
        self.actorsocial_persona.inject('') do |memo, ap|
          c = ap.correo ? ap.correo : ''
          (memo == '' ? '' : memo + ', ') + c 
        end
      when 'contactos_cargos'
        self.actorsocial_persona.inject('') do |memo, ap|
          c = ap.cargo ? ap.cargo : ''
          (memo == '' ? '' : memo + ', ') + c 
        end
      when 'created_at_localizada'
        Sip::FormatoFechaHelper::fecha_estandar_local(self.created_at.utc.to_date)
      when 'grupos'
         self.actorsocial_grupo.inject('') do |memo, ag|
          (memo == '' ? '' : memo + '; ') + ag.grupo.nombre 
        end
      when 'regiones'
         self.regiongrupo.inject('') do |memo, rg|
          (memo == '' ? '' : memo + '; ') + rg.nombre 
        end
      when 'nivelgeostciv'
        self.csivinivelgeo_id ? self.csivinivelgeo.nombre : ''
      when 'nivelrespstciv'
        self.csivinivelresp_id ? self.csivinivelresp.nombre : ''
      when 'temastciv'
         self.csivitema.inject('') do |memo, t|
          (memo == '' ? '' : memo + '; ') + t.nombre 
         end
      else
        presenta_sip(atr)
      end
    end

  end
end
