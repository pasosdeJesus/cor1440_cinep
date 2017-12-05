# encoding: UTF-8

class Desembolso < ActiveRecord::Base
  include Sip::Localizacion

  belongs_to :proyectofinanciero, 
    class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'

  validates :detalle, length: { maximum: 5000}
  flotante_localizado :valorplaneado
  validates :valorplaneado, numericality:
    { greater_than: 0, less_than: 1000000000000000000 }

  campofecha_localizado :fechaplaneada

  validate :fechaplaneada_posterior_inicio 

  def fechaplaneada_posterior_inicio
    # Estefania solicito quitarla el 4.Dic.2017, pero se pregunta se bastan 6 meses
    if fechaplaneada && proyectofinanciero && 
      proyectofinanciero.fechainicio && 
      fechaplaneada < (proyectofinanciero.fechainicio - 90) then
      errors.add(:fechaplaneada,
                 "La fecha planeada debe ser posterior a la fecha de inicio menos 90 días")
    end
  end

  default_scope { order(:id) }


end
