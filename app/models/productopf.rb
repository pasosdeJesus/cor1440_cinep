class Productopf < ActiveRecord::Base
  include Sip::Localizacion

  belongs_to :proyectofinanciero, 
    class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'

  belongs_to :tipoproductopf, class_name: '::Tipoproductopf',
    foreign_key: 'tipoproductopf_id', optional: true

  belongs_to :actividadpf, class_name: 'Cor1440Gen::Actividadpf',
    foreign_key: 'actividadpf_id', optional: true

  has_many :actividad, dependent: :nullify,
    class_name: 'Cor1440Gen::Actividad',
    foreign_key: 'productopf_id', validate: true

  validates :detalle, length: { maximum: 5000}
  validates :seguimiento, length: { maximum: 5000}
  validates :tipoproductopf, presence: true

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
                 "La fecha de envío debe ser posterior a la de inicio del compromiso")
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

  campofecha_mesanio :fechainiprod
  campofecha_mesanio :fechafinprod

  validate :fechainiprod_anterior_fechafinprod
  def fechainiprod_anterior_fechafinprod
    if fechainiprod && fechafinprod &&
            fechainiprod > fechafinprod then
      errors.add(:fechainiprod_mes,
                 "La fecha de inicio de producción debe ser anterior a la de terminación")
    end
  end

  validate :fechainiprod_posterior_inicio
  def fechainiprod_posterior_inicio
    if fechainiprod && 
      proyectofinanciero &&
      proyectofinanciero.fechainicio &&
      fechainiprod < proyectofinanciero.fechainicio then
      errors.add(:fechainiprod_mes,
                 "La fecha de inicio de producción (#{fechainiprod}) debe ser posterior a la de inicio del compromiso (#{proyectofinanciero.fechainicio})")
    end
  end

#  validate :fechafinprod_anterior_cierre
#  def fechafinprod_anterior_cierre
#    if fechafinprod && 
#            proyectofinanciero &&
#            proyectofinanciero.fechacierre &&
#            fechafinprod > proyectofinanciero.fechacierre then
#      errors.add(:fechafinprod_mes,
#                 "La fecha de finalización de producción debe ser anterior a la de terminación del compromiso financiero")
#    end
#  end


  flotante_localizado :costoprevisto

  def self.orden_presenta_nombre
    :detalle
  end

  def presenta_nombre
   detalle
  end
end
