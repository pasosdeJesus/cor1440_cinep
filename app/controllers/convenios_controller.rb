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
      "id", "clasificacion", "tipoconvenio_id", "institucion", 
      "descripcion", "fechainicio_localizada", "duracion"
    ]
  end

  def atributos_form
    atributos_index - [ "id" ] #+ [ "duracion" ]
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
    params.require(:convenio).permit(*atributos_form)
  end

end
