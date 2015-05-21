# encoding: UTF-8
class Actor < ActiveRecord::Base
	include Sip::Basica

  belongs_to :sectoractor, class_name: '::Sectoractor',
    foreign_key: "sectoractor_id", validate: true
  belongs_to :pais, class_name: 'Sip::Pais',
            foreign_key: "pais_id", validate: true

 # has_many :actividad_actor, dependent: :delete_all,
 #   class_name: '::ActividadActor',
 #   foreign_key: 'actor_id'
 # has_many :actividad, through: :actividad_actor,
 #   class_name: 'Cor1440Gen::Actividad'

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
    when "sectoractor_id" 
      self[atr] ? ::Sectoractor.find(self[atr]).nombre : ""
    when "pais_id" 
      self[atr] ? Sip::Pais.find(self[atr]).nombre : ""
    else
      self[atr].to_s
    end
  end

  def self.human_attribute_name(atr)
    if (atr.to_s == "{:actor_ids=>[]}")
      "Actores"
    else
      super(atr)
    end
  end

end
