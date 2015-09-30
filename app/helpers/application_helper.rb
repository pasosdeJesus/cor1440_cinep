# encoding: UTF-8

module ApplicationHelper
  include Sip::ConsultasHelper

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
