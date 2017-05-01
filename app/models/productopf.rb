# encoding: UTF-8

class Productopf < ActiveRecord::Base
  include Sip::Localizacion

  belongs_to :proyectofinanciero, 
    class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'

  belongs_to :tipoproductopf, class_name: '::Tipoproductopf',
    foreign_key: 'tipoproductopf_id'
  validates :detalle, length: { maximum: 5000}
  validates :seguimiento, length: { maximum: 5000}

  default_scope { order(:id) }

  campofecha_localizado :fechaplaneada
  campofecha_localizado :fechareal

  validate :fechaplaneada_posterior_inicio
  def fechaplaneada_posterior_inicio
    if fechaplaneada && 
            proyectofinanciero &&
            proyectofinanciero.fechainicio &&
            fechaplaneada < proyectofinanciero.fechainicio then
      errors.add(:fechaplaneada,
                 "La fecha planeada debe ser posterior a la de inicio")
    end
  end

  validate :fechaplaneada_anterior_cierre
  def fechaplaneada_anterior_cierre
    if fechaplaneada && 
            proyectofinanciero &&
            proyectofinanciero.fechacierre &&
            fechaplaneada > proyectofinanciero.fechacierre then
      errors.add(:fechaplaneada,
                 "La fecha planeada debe ser anterior a la de terminación")
    end
  end


  validate :fechareal_posterior_inicio
  def fechareal_posterior_inicio
    if fechareal && 
      proyectofinanciero &&
      proyectofinanciero.fechainicio &&
      fechareal < proyectofinanciero.fechainicio then
      errors.add(:fechareal,
                 "La fecha de envío debe ser posterior a la de inicio")
    end
  end

  validate :fechareal_anterior_cierre
  def fechareal_anterior_cierre
    if fechareal && 
            proyectofinanciero &&
            proyectofinanciero.fechacierre &&
            fechareal > proyectofinanciero.fechacierre then
      errors.add(:fechareal,
                 "La fecha de envío debe ser anterior a la de terminación")
    end
  end



end
