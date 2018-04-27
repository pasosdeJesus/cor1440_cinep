# encoding: UTF-8

class Contrato < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  belongs_to :tipocontrato, class_name: "::Tipocontrato",
    foreign_key: "tipocontrato_id", validate: true

  has_one :usuario, inverse_of: :contrato

  campofecha_localizado :fechaini
  campofecha_localizado :fechafin
  flotante_localizado :salario
  flotante_localizado :salarioanterior

  validates :ciudadresidencia, length: { maximum: 127}
  validates :ciudadlabora, length: { maximum: 127}

  mattr_accessor :procesogh
  def procesogh
    r = ""
    sep = ""
    usuario.sip_grupo.map do |g|
      if g.procesogh
        r << sep << g.procesogh.nombre
        sep ="; "
      end
    end
    return r;
  end

  mattr_accessor :tiponomina
  def tiponomina
    r = ""
    if tipocontrato && tipocontrato.tiponomina
      r = tipocontrato.tiponomina.nombre
    end
    return r
  end

  validate :fechas_ordenadas
  def fechas_ordenadas
    if fechaini && fechafin && fechaini > fechafin
      errors.add(:fechafin, 
                 "La fecha de terminación debe ser posterior a la de inicio")
    end
  end

end
