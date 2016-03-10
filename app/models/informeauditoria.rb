# encoding: UTF-8

class Informeauditoria < ActiveRecord::Base
  belongs_to :proyectofinanciero, class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'

  validates :detalle, length: { maximum: 500}
  validate :fechaplaneada_posterior_inicio

  def fechaplaneada_posterior_inicio
    if fechaplaneada && fechaplaneada < proyectofinanciero.fechainicio then
      errors.add(:fechaplaneada,
                 "La fecha planeada debe ser posterior a la de inicio")
    end
  end

end
