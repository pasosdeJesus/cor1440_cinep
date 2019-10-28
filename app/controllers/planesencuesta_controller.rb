# encoding: UTF-8

class PlanesencuestaController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_planencuesta, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  class: ::Planencuesta

  def clase 
    "::Planencuesta"
  end

  def atributos_index
    [
      :id,
      :formulario_id,
      :fechaini_localizada,
      :fechafin_localizada,
      :plantillacorreoinv_id,
      :encuestapersona
    ]
  end

  def atributos_form
    atributos_index - [:id]
  end

  def index_reordenar(registros)
    return registros.reorder(:id)
  end

  def new_modelo_path(o)
    return new_planencuesta_path()
  end

  def genclase
    return 'F'
  end


  private

  def set_planencuesta
    @registro = @planencuesta = ::Planencuesta.find(
      ::Planencuesta.connection.quote_string(params[:id]).to_i
    )
  end

  def lista_params
    atributos_form - [:id]
  end


  # No confiar parametros a Internet, sólo permitir lista blanca
  def planencuesta_params
    params.require(:planencuesta).permit(*lista_params)
  end

end
