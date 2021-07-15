class Descargaspublicacion < ActiveRecord::Base

  belongs_to :publicacion, optional: false

  validates :anio, numericality: { 
    only_integer: true, greater_than: 1990
  }, uniqueness: {scope: :publicacion_id,
                  message: 'No se permite repetir año'
  }
  
  validates :descargas, numericality: { 
    only_integer: true, greater_than_or_equal_to: 0
  }

  default_scope { order(:anio) }

end
