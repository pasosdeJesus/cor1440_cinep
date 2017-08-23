# encoding: UTF-8

class Convenio < ActiveRecord::Base
	include Sip::Modelo
  include Sip::Localizacion
  include ::ApplicationHelper

  attr_accessor :duracion

  campofecha_localizado :fechainicio
  campofecha_localizado :fechacierre

  belongs_to :tipoconvenio, class_name: '::Tipoconvenio',
      foreign_key: 'tipoconvenio_id'

  validates :institucion, length: { maximum: 1000 }
  validates :descripcion, length: { maximum: 5000 }

  validate :clasificacion_valida
  def clasificacion_valida
    cv = ::ApplicationHelper::CLASIFICACIONCONV.map {|r| r[1].to_s}
    if !cv.include?(clasificacion)
      errors.add(:clasificacion, 'Clasificación no es válida')
    end
  end


  validate :fechas_ordenadas
  def fechas_ordenadas
    if fechainicio && fechacierre && fechainicio > fechacierre
      errors.add(:fechacierre, 
                 "La fecha de cierre debe ser posterior a la de inicio")
    end
  end

  def presenta_nombre
    "#{institucion} - #{descripcion[0..100]}"
  end

  def duracion
    if fechainicio && fechacierre
      dif_meses_dias(fechainicio, fechacierre)
    else
      ''
    end
  end

  scope :filtro_clasificacion, lambda {|c|
        where(clasificacion: c)
  } 

  scope :filtro_descripcion, lambda {|d|
        where("unaccent(descripcion) ILIKE '%' || unaccent(?) || '%'", d)
  } 

  scope :filtro_institucion, lambda {|d|
        where("unaccent(descripcion) ILIKE '%' || unaccent(?) || '%'", d)
  } 

  scope :filtro_tipoconvenio_id, lambda {|idt|
        where(tipoconvenio_id: idt)
  } 

  scope :filtro_fechainicio_localizadaini, lambda { |f|
    where('fechainicio >= ?', 
          Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }

  scope :filtro_fechainicio_localizadafin, lambda { |f|
    where('fechainicio <= ?', 
          Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }

  scope :filtro_fechacierre_localizadaini, lambda { |f|
    where('fechacierre >= ?', 
          Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }

  scope :filtro_fechacierre_localizadafin, lambda { |f|
    where('fechacierre <= ?', 
          Sip::FormatoFechaHelper.fecha_local_estandar(f))
  }


end
