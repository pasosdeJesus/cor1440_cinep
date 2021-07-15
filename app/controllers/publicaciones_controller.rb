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
      :tipoproductopf,
      :descargaspublicacion,
      :observaciones, 
      :created_at_localizada, 
      :updated_at_localizada, 
    ]
  end

  def atributos_form
    [
      :nombre, 
      :tipoproductopf,
      :descargaspublicacion,
      :observaciones, 
    ]
  end


  def genclase
    'F'
  end

  def lista_params
    [
      :nombre, 
      :observaciones, 
      :tipoproductopf_id,
      :descargaspublicacion_attributes => [
        :anio,
        :descargas,
        :id,
        :_destroy
      ]
    ]
  end

  def publicacion_params
    l = lista_params
    params.require(:publicacion).permit(l)
  end

end
