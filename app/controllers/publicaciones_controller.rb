class PublicacionesController < Heb412Gen::ModelosController
  before_action :set_publicacion, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  class: ::Publicacion

  def clase 
    "::Publicacion"
  end

  def set_publicacion
    @basica = Publicacion.find(params[:id])
  end

  def atributos_index
    [
      :id, 
      :nombre, 
      :observaciones, 
      :created_at_localizada, 
      :updated_at_localizada, 
    ]
  end

  def atributos_form
    [
      :nombre, 
      :observaciones, 
    ]
  end


  def genclase
    'F'
  end

  def lista_params
    atributos_form
  end

  def publicacion_params
    params.require(:publicacion).permit(*lista_params)
  end

end
