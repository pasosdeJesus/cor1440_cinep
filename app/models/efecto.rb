# encoding: UTF-8

class Efecto < ActiveRecord::Base
	include Sip::Modelo
	include Sip::Localizacion

  belongs_to :indicadorpf, class_name: 'Cor1440Gen::Indicadorpf',
            foreign_key: "indicadorpf_id", validate: true
  belongs_to :registradopor, class_name: '::Usuario',
            foreign_key: "registradopor_id", validate: true

  has_many :actor_efecto, dependent: :delete_all
  has_many :actor, through: :actor_efecto

  campofecha_localizado :fecha

  has_many :anexo_efecto, dependent: :delete_all,
    class_name: '::AnexoEfecto',
    foreign_key: 'efecto_id', validate: true
  accepts_nested_attributes_for :anexo_efecto, 
    allow_destroy: true, reject_if: :all_blank
  has_many :sip_anexo, :through => :anexo_efecto, 
    class_name: 'Sip::Anexo'
  accepts_nested_attributes_for :sip_anexo,  reject_if: :all_blank

  has_many :efecto_valorcampotind, dependent: :delete_all,
    class_name: '::EfectoValorcampotind',
    foreign_key: 'efecto_id', validate: true
  accepts_nested_attributes_for :efecto_valorcampotind,
    allow_destroy: true, reject_if: :all_blank
  has_many :valorcampotind, :through => :efecto_valorcampotind,
    class_name: '::Cor1440Gen::Valorcampotind'
  accepts_nested_attributes_for :valorcampotind,  reject_if: :all_blank

  validates :indicadorpf_id, presence: true
  validates :actor_efecto, presence: true
  validates :fecha, presence: true

  scope :filtro_actor_id, lambda { |a|
    where('actor_id = ?', a)
  }

  scope :filtro_fechaini, lambda { |f|
    where('fecha >= ?', f)
  }

  scope :filtro_fechafin, lambda { |f|
    where('fecha <= ?', f)
  }

  scope :filtro_indicadorpf_id, lambda { |i|
    where('indicadorpf_id = ?', i)
  }
 
  scope :filtro_registradopor_id, lambda { |r|
    where('registradopor_id = ?', i)
  }
  
end
