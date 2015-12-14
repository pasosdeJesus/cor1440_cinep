#encoding: UTF-8

module Sip
  module ProyectosfinancierosHelper

    def conv_proyecto_id(proyecto)
      if proyecto.is_a? Integer
        return proyecto
      else
        return proyecto.id
      end
    end

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
end

