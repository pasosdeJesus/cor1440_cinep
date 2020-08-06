class Busqunif < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha

  validates :base, length: { maximum: 5 }, presence: true
  validates :idbase, uniqueness: { scope: :base }, presence: true
  validates :url, presence: true, length: { maximum: 1024 },
    uniqueness: { message: 'no puede haber dos urls iguales' } 
  validates :fecha, presence: true
  validates :departamento, length: {maximum: 127}
  validates :municipio, length: {maximum: 127}
  validates :descripcion, length: {maximum: 6000}, presence: true


end
