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
      LibMisc.dif_meses_dias(fechainicio, fechacierre)
    else
      ''
    end
  end

  def presenta(atr)
    if (atr == 'clasificacion')
      Sip::ModeloHelper.etiqueta_coleccion(
        ::ApplicationHelper::CLASIFICACIONCONV, clasificacion)
    else
      presenta_gen(atr)
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

  scope :filtro_fechainicioini, lambda { |f|
    where('fechainicio >= ?', f)
  }

  scope :filtro_fechainiciofin, lambda { |f|
    where('fechainicio <= ?', f)
  }

  scope :filtro_fechacierreini, lambda { |f|
    where('fechacierre >= ?', f)
  }

  scope :filtro_fechacierrefin, lambda { |f|
    where('fechacierre <= ?', f)
  }


end
