#encoding: UTF-8

module Sip
  module ConsultasHelper 

    ##
    # Agrega una nueva tabla al listado $t
    #
    # @param string &$t Listado de tablas separadas por ,
    # @param string $nt Nueva tabla por agregar si falta
    #
    # @return string cadena t completada para asegurar tabla
    #/
    def agrega_tabla(t, nt)
      at = t.split(',')
      if (!at.include? nt)
        at << nt
      end
      t = at.join(",")
    end

    ##
    # Agrega condición a WHERE en un SELECT de SQL
    #
    # @param unknown &$db   Conexión a base de datos
    # @param string  &$w    cadena con WHERE que se completa
    # @param string  $n     nombre de campo
    # @param string  $v     valor esperado
    # @param string  $opcmp operador de comparación por usar.
    # @param string  $con   con
    #
    # @return string cadena w completada con nueva condición
    def consulta_and(w, n, v, opcmp = '=', con='AND')
      if (!v || v === '' || $v === ' ') 
        return
      end
      if (w != "") 
        w += " #{con}"
      end
      w += " " + n + opcmp + Sivel2Gen::Caso.sanitize(v)
    end


    ##
    # Como la función anterior sólo que el valor no lo pone entre apostrofes
    # y supone que ya viene escapado el valor $v
    #
    # @param string &$w    cadena con WHERE que se completa
    # @param string $n     nombre de campo
    # @param string $v     valor esperado
    # @param string $opcmp operador de comparación por usar.
    # @param string $con   con
    #
    # @return string cadena w completada con nueva condición
    #/
    def consulta_and_sinap(w, n, v, opcmp = '=', con = "AND")
      if (w != "") 
        w += " " + con
      end
      w += " " + n + opcmp + v
    end

    ##
    # Escapa cadena para pasarla a consulta SQL
    #
    # @param p Cadena por escapar
    ##
    def param_escapa(p)
      params[p] ? Sip::Pais.connection.quote_string(params[p]) : ''
    end

    ##
    # Retorna fecha inicial del semestre anterior
    ##
    def inicio_semestre_ant
      hoy = Date.today 
      anio = hoy.year
      if hoy.mon >= 7 && hoy.mon < 12 
        ini = anio.to_s + "-" + "01-01"
      elsif hoy.mon == 12
        ini = anio.to_s + "-" + "07-01"
      else
        anio -= 1
        ini = anio.to_s + "-" + "07-01"
      end
      return ini
    end

    ##
    # Retorna fecha final del semestre anterior
    ##
    def fin_semestre_ant 
      hoy = Date.today 
      anio = hoy.year
      if hoy.mon >= 7 && hoy.mon < 12
        fin = anio.to_s + "-" + "06-30"
      elsif hoy.mon == 12
        fin = anio.to_s + "-" + "12-31"
      else
        anio -= 1
        fin = anio.to_s + "-" + "12-31"
      end
      return fin
    end
  end
end
