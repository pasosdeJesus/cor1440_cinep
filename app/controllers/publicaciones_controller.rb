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
      :autor,
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
      :revista,
      :categoriarevista_id,
      :editorial,
      :isbn,
      :issn,
      :descargaspublicacion,
      :observaciones, 
    ]
  end


  def genclase
    'F'
  end

  def index_reordenar(c)
    c.reorder('id DESC')
  end

  def lista_params
    [
      :autor,
      :categoriarevista_id,
      :editorial,
      :isbn,
      :issn,
      :nombre, 
      :observaciones, 
      :revista,
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
