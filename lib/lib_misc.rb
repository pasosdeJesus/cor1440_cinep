module LibMisc
  include Sip::ConsultasHelper

  def self.dif_meses_dias(fechaini, fechafin) 
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

end
