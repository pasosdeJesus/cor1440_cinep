# encoding: UTF-8

class Actor < ActiveRecord::Base
	include Sip::Basica

  belongs_to :pais, class_name: 'Sip::Pais',
            foreign_key: "pais_id", validate: true
  belongs_to :nivelrelacion, class_name: "::Nivelrelacion",
    foreign_key: "nivelrelacion_id", validate: true

  has_many :actor_sectoractor, class_name: '::ActorSectoractor',
    foreign_key: "actor_id", validate: true, dependent: :delete_all
  has_many :sectoractor, class_name: '::Sectoractor',
    through: :actor_sectoractor

  has_many :actor_grupo, class_name: '::ActorGrupo',
    foreign_key: "actor_id", validate: true, dependent: :delete_all
  has_many :grupo, class_name: 'Sip::Grupo',
    through: :actor_grupo

  has_many :actor_regiongrupo, class_name: '::ActorRegiongrupo',
    foreign_key: "actor_id", validate: true, dependent: :delete_all
  has_many :regiongrupo, class_name: '::Regiongrupo',
    through: :actor_regiongrupo

  has_many :actividad_actor, dependent: :delete_all,
    class_name: '::ActividadActor', foreign_key: 'actor_id'
  has_many :actividad, through: :actividad_actor,
    class_name: 'Cor1440Gen::Actividad'

  validates :personacontacto, length: { maximum: 100 }
  validates :cargo, length: { maximum: 100 }
  validates :correo, length: { maximum: 100 }
  validates :telefono, length: { maximum: 100 }
  validates :fax, length: { maximum: 100 }
  validates :celular, length: { maximum: 100 }
  validates :direccion, length: { maximum: 200 }
  validates :ciudad, length: { maximum: 200 }

  def presenta(atr)
    case atr.to_s
    when "pais_id" 
      self[atr] ? Sip::Pais.find(self[atr]).nombre : ""
    else
      presenta_gen(atr)
    end
  end

  def self.human_attribute_name(atr, options = {})
    if (atr.to_s == "{:actor_ids=>[]}")
      "Actores"
    elsif (atr.to_s == "{:sectoractor_ids=>[]}")
      "Sectores"
    else
      super(atr, options)
    end
  end

  def presenta_nombre
    nombre
  end

  scope :filtro_sectoractor_ids, lambda { |s|
    joins(:actor_sectoractor).where('actor_sectoractor.sectoractor_id=?', s)
  }
  
  scope :filtro_grupo_ids, lambda { |g|
    joins(:actor_grupo).where('actor_grupo.sip_grupo_id=?', g)
  }

  scope :filtro_regiongrupo_ids, lambda { |r|
    joins(:actor_regiongrupo).where('actor_regiongrupo.regiongrupo_id=?', r)
  }

  scope :filtro_personacontacto, lambda { |p|
    where("personacontacto ILIKE '%' || unaccent(?) || '%'", p)
  }


end
