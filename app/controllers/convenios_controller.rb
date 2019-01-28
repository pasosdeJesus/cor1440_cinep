# encoding: UTF-8

class ConveniosController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_convenio, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  class: ::Convenio

  def clase 
    "::Convenio"
  end

  def atributos_index
    [
      :id, 
      :clasificacion, 
      :tipoconvenio_id, 
      :institucion, 
      :descripcion, 
      :fechainicio_localizada, 
      :duracion,
      :anexo_convenio

    ]
  end

  def atributos_show
    atributos_index - [
      :anexo_convenio
    ] + [ 
      :fechacierre_localizada,
      :responsable,
      :observaciones,
      :anexo_convenio
    ]
  end


  def atributos_form
    atributos_show - [ 
      :id, 
      :duracion,
    ]  
  end

  def index_reordenar(registros)
    return registros.reorder(fechainicio: :desc)
  end

  def new_modelo_path(o)
    return new_convenio_path()
  end

  def genclase
    return 'M'
  end

  private

  def set_convenio
    @registro = @convenio = ::Convenio.find(
      ::Convenio.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def convenio_params
    lp = atributos_form  - [
      :anexo_convenio,
      :responsable
    ] + [
      :responsable_id,
      :anexo_convenio_attributes => [
        :id,
        :convenio_id,
        :_destroy,
        :sip_anexo_attributes => [
          :adjunto, 
          :descripcion, 
          :id, 
          :_destroy
        ]
      ]
    ]
    params.require(:convenio).permit(lp)
  end

end
