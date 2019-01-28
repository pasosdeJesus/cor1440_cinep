

module ApplicationHelper
  include Sip::ConsultasHelper
  include FontAwesome::Rails::IconHelper 

  # Las letras escogidas para cada estado están en orden para facilitar presentar
  # en ese orden
  ESTADO = [
            ['EN CIERRE', :C],  # Necesario para pestana en cierre de Cuadro General Seguimiento
            ['EN TRAMITE', :E], 
            ['EN EJECUCIÓN', :J], 
            ['APROBADO', :K], 
            ['CERRADO O LIQUIDADO', :M], # Antes era TERMINADO cambio solicitado 13.Nov.2018
            ['DESCARTADO', :O], 
            ['RECHAZADO', :R] 
  ] 

  ESTADOS_APROBADO = [:C, :J, :K, :M]

  DIFICULTAD = [['BAJA', :B], ['MEDIA', :M], 
                ['ALTA', :A], ['N/A', :N]]

  CLASIFICACIONCONV = [['EN EL MARCO DE UN CONVENIO', :E], 
                       ['NIVEL INTERINSTITUCIONAL', :I]]



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

  # Concatena lista de nombres de supergrupos de g a l sin repetir
  def self.supergrupos_grupo(g, l)
    if g.nil?
      return
    end
    nl = ::GrupoSubgrupo.where(subgrupo_id: g.id)
    nl.each do |sg|
      if !l.include?(sg.grupo.nombre)
        l << sg.grupo.nombre
        supergrupos_grupo(sg.grupo, l)
      end
    end
  end

  # Retorna lista de nombres de supergrupos de usuario u
  def self.supergrupos_usuario(u)
    l = []
    u.sip_grupo.each do |g|
      l << g.nombre
      supergrupos_grupo(g, l)
    end
    return l
  end

end
