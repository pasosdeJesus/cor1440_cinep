# encoding: UTF-8

class Contrato < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fechaini
  campofecha_localizado :fechafin
  flotante_localizado :salario
  flotante_localizado :salarioanterior

  validate :fechas_ordenadas
  def fechas_ordenadas
    if fechaini && fechafin && fechaini > fechafin
      errors.add(:fechafin, 
                 "La fecha de terminación debe ser posterior a la de inicio")
    end
  end

end
