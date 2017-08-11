# encoding: UTF-8

class Tasacambio < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha
  flotante_localizado :enpesos

  belongs_to :tipomoneda, class_name: '::Tipomoneda', 
    foreign_key: 'tipomoneda_id'

  validates :fecha, presence: true
  validates :tipomoneda_id, presence: true
  validates :enpesos, numericality: { greater_than: 0}, presence: true

  validates :tipomoneda_id, uniqueness: {
    scope: :fecha,
    message: 'no puede haber dos tasas para una moneda en una misma fecha'
  }

  scope :filtro_tipomoneda_id, lambda { |t| 
    where(tipomoneda_id: t)
  }

  scope :filtro_fecha_localizadaini, lambda { |f|
      where('fecha >= ?', Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }

  scope :filtro_fecha_localizadafin, lambda { |f|
      where('fecha <= ?', Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }

  scope :filtro_enpesos_localizadoini, lambda {|p|
    where('enpesos >= ?', p.a_decimal_nolocalizado)
  }

  scope :filtro_enpesos_localizadofin, lambda {|p|
    where('enpesos <= ?', p.a_decimal_nolocalizado)
  }

  scope :filtro_observaciones, lambda {|o|
    where("unaccent(observaciones) ILIKE '%' || unaccent(?) || '%'", o)
  }

end
