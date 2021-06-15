require 'cor1440_gen/concerns/models/orgsocial'

module Sip
  class Orgsocial < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Orgsocial

    belongs_to :nivelrelacion, class_name: "::Nivelrelacion",
      foreign_key: "nivelrelacion_id", validate: true, optional: true
    belongs_to :csivinivelgeo, class_name: "::Csivinivelgeo",
      foreign_key: "csivinivelgeo_id", validate: true, optional: true
    belongs_to :csivinivelresp, class_name: "::Csivinivelresp",
      foreign_key: "csivinivelresp_id", validate: true, optional: true

    has_many :departamento_orgsocial, dependent: :delete_all
    has_many :departamentotrab, through: :departamento_orgsocial,
      class_name: 'Sip::Departamento'

    has_many :grupo_orgsocial, dependent: :delete_all,
      class_name: '::GrupoOrgsocial', foreign_key: "orgsocial_id"
    has_many :grupo, class_name: 'Sip::Grupo',
      through: :grupo_orgsocial

    has_many :municipio_orgsocial, dependent: :delete_all
    has_many :municipiotrab, through: :municipio_orgsocial,
      class_name: 'Sip::Municipio'

    has_many :orgsocial_regiongrupo, dependent: :delete_all,
      class_name: '::OrgsocialRegiongrupo', foreign_key: "orgsocial_id"
    has_many :regiongrupo, class_name: '::Regiongrupo',
      through: :orgsocial_regiongrupo

    has_and_belongs_to_many :csivitema, 
      class_name: '::Csivitema',
      foreign_key: 'orgsocial_id',
      association_foreign_key: 'csivitema_id',
      join_table: 'csivitema_orgsocial'

    has_and_belongs_to_many :lineabase, 
      class_name: '::Lineabase',
      foreign_key: 'orgsocial_id',
      association_foreign_key: 'lineabase_id',
      join_table: 'lineabase_orgsocial'


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
      if (atr.to_s == "{:orgsocial_ids=>[]}")
        "Orgsocial"
      elsif (atr.to_s == "{:sectororgsocial_ids=>[]}")
        "Sectores"
      else
        super(atr, options)
      end
    end

    scope :filtro_csivinivelgeo_id, lambda { |n|
      where(csivinivelgeo_id: n.to_i)
    }
    
    scope :filtro_csivinivelresp_id, lambda { |n|
      where(csivinivelgeo_id: n.to_i)
    }

    scope :filtro_csivitema, lambda { |t|
      joins(:csivitema).where('csivitema.id=?', t.to_i)
    }

    scope :filtro_grupo_ids, lambda { |g|
      joins(:grupo_orgsocial).where('grupo_orgsocial.grupo_id=?', g.to_i)
    }

    scope :filtro_lineabase_ids, lambda {|l|
      joins('JOIN lineabase_orgsocial ON '\
      'lineabase_orgsocial.orgsocial_id=sip_orgsocial.id').
      where('lineabase_orgsocial.lineabase_id' => l.to_i)
    }

    scope :filtro_nivelrelacion_id, lambda { |n|
      where(nivelrelacion_id: n.to_i)
    }

    scope :filtro_personacontacto, lambda { |p|
      where("personacontacto ILIKE '%' || unaccent(?) || '%'", p)
    }

    scope :filtro_regiongrupo_ids, lambda { |r|
      joins(:orgsocial_regiongrupo).where(
        'orgsocial_regiongrupo.regiongrupo_id=?', r.to_i)
    }

    scope :filtro_orgsocial_persona, lambda { |c|
      joins(:persona).
        where("(sip_persona.nombres || ' ' || sip_persona.apellidos 
               || ' ' || COALESCE(sip_orgsocial_persona.cargo, '')
               || ' ' || COALESCE(sip_orgsocial_persona.correo, '')
              ) ILIKE ?", "%#{c}%")
    }


    def presenta(atr, stciv = false)
      case atr.to_s
      when '{:orgsocial_persona=>[]}', 'orgsocial_persona'
        self.orgsocial_persona.where(stciv: stciv).
          inject('') do |memo, ap|
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
        self.orgsocial_persona.inject('') do |memo, ap|
          n = ap.persona.nombres ? ap.persona.nombres : 'N'
          a = ap.persona.apellidos ? ap.persona.apellidos : 'N'
          (memo == '' ? '' : memo + ', ') + n + ' ' + a
        end
      when 'contactos_correos'
        self.orgsocial_persona.inject('') do |memo, ap|
          c = ap.correo ? ap.correo : ''
          (memo == '' ? '' : memo + ', ') + c 
        end
      when 'contactos_cargos'
        self.orgsocial_persona.inject('') do |memo, ap|
          c = ap.cargo ? ap.cargo : ''
          (memo == '' ? '' : memo + ', ') + c 
        end
      when 'created_at_localizada'
        Sip::FormatoFechaHelper::fecha_estandar_local(self.created_at.utc.to_date)
      when 'grupos'
         self.grupo_orgsocial.inject('') do |memo, ag|
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
