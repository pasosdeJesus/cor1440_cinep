# encoding: UTF-8

class Efecto < ActiveRecord::Base
	include Sip::Modelo
	include Sip::Localizacion

  belongs_to :indicadorpf, class_name: 'Cor1440Gen::Indicadorpf',
            foreign_key: "indicadorpf_id", validate: true
  belongs_to :actor, class_name: '::Actor',
            foreign_key: "actor_id", validate: true

  campofecha_localizado :fecha

  validates :indicadorpf_id, presence: true
  validates :actor_id, presence: true
  validates :fecha, presence: true

  scope :filtro_indicadorpf_id, lambda { |i|
    where('indicadorpf_id=?', i)
  }
  
  scope :filtro_actor_id, lambda { |a|
    where('actor_id=?', a)
  }

  scope :filtro_fecha_localizadaini, lambda { |f|
    where('fecha >= ?', Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }

  scope :filtro_fecha_localizadafin, lambda { |f|
    where('fecha <= ?', Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }
end
