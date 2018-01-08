

module ApplicationHelper
  include Sip::ConsultasHelper
  include FontAwesome::Rails::IconHelper 

  # Las letras escogidas para cada estado están en orden para facilitar presentar
  # en ese orden
  ESTADO = [
            ['EN CIERRE', :C],  # Necesario para pestana en cierre de Cuadro General Seguimiento
            ['EN TRAMITE', :E], 
            ['EN EJECUCIÓN', :J], 
            ['TERMINADO', :M],
            ['DESCARTADO', :O], 
            ['RECHAZADO', :R] 
  ] 

  ESTADOS_APROBADO = [:J, :C, :M]

  DIFICULTAD = [['BAJA', :B], ['MEDIA', :M], 
                ['ALTA', :A], ['N/A', :N]]

  CLASIFICACIONCONV = [['EN EL MARCO DE UN CONVENIO', :E], 
                       ['NIVEL INTERINSTITUCIONAL', :I]]


  def dif_meses_dias(fechaini, fechafin) 
    m = 0
    d = 0
    if fechaini && fechafin && fechaini < fechafin
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
      # Hasta aqui, era preciso, el siguiente tiene en cuenta lo tipico
      if (d+1) == fechafin.end_of_month.day
        m += 1
        d = 0
      end
      if (m == 0) then
        return I18n.translate(:dia, count: d)
      elsif (d == 0) then
        return I18n.translate(:mes, count: m)
      end
      return I18n.translate(:mes, count: m) + " y " + 
        I18n.translate(:dia, count: d)
    else
      return ''
    end
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
    "/proyectosfinancieros/nuevo"
  end

  def edita_proyectofinanciero_ruta(proyecto)
    "/proyectosfinancieros/#{conv_proyecto_id(proyecto).to_s}/edita"
  end

  def proyectofinanciero_ruta(proyecto)
    "/proyectosfinancieros/#{conv_proyecto_id(proyecto).to_s}"
  end

  def proyectosfinancieros_ruta()
    "/proyectosfinancieros"
  end

end
