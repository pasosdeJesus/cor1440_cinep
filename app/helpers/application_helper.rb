# encoding: UTF-8

module ApplicationHelper
  include Sip::ConsultasHelper
  include FontAwesome::Rails::IconHelper 

  def dif_meses_dias(fechaini, fechafin) 
    m = 0
    d = 0
    if fechaini < fechafin
      if (fechafin.month < fechaini.month)
        m = (fechafin.year - fechaini.year - 1)*12
        m += 12 - fechaini.month + fechafin.month
      else
        m = (fechafin.year - fechaini.year)*12
        m += fechafin.month - fechaini.month
      end
      if (fechafin.day < fechaini.day)
        m = m - 1
        d = fechaini.end_of_month.day - fechaini.day + fechafin.day
      else
        d = fechafin.day - fechaini.day
      end
    end
    if (m == 0) then
      return d.to_s + " días"
    elsif (d == 0) then
      return m.to_s + " meses"
    end
    return (m.to_s + " meses y " + d.to_s + " días")
  end

  def conv_proyecto_id(proyecto)
    if proyecto.is_a? Integer
      return proyecto
    else
      return proyecto.id
    end
  end

  # Toco crear los siguientes porque no hubo forma de hacer
  # funcionar proyectofinanciero_path y demás.
 
  def nuevo_proyectofinanciero_ruta()
    "/act/proyectosfinancieros/nuevo"
  end

  def edita_proyectofinanciero_ruta(proyecto)
    "/act/proyectosfinancieros/#{conv_proyecto_id(proyecto).to_s}/edita"
  end

  def proyectofinanciero_ruta(proyecto)
    "/act/proyectosfinancieros/#{conv_proyecto_id(proyecto).to_s}"
  end

  def proyectosfinancieros_ruta()
    "/act/proyectosfinancieros"
  end

end
