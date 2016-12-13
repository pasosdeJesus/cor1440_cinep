# encoding: UTF-8

class Actor < ActiveRecord::Base
	include Sip::Basica

  belongs_to :pais, class_name: 'Sip::Pais',
            foreign_key: "pais_id", validate: true

  has_many :actor_sectoractor, class_name: '::ActorSectoractor',
    foreign_key: "actor_id", validate: true
  has_many :sectoractor, class_name: '::Sectoractor',
    through: :actor_sectoractor

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

end
