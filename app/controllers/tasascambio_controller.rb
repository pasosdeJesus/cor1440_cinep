# encoding: UTF-8

class TasascambioController < Sip::ModelosController
  helper ::ApplicationHelper
  #include ::ApplicationHelper
  #include ::Sip::ModeloHelper
  #include ::Sip::ConsultasHelper

  before_action :set_tasacambio, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Tasacambio

  def clase
    "::Tasacambio"
  end

  def atributos_index
    [ "id", 
      "fecha_localizada",
      "tipomoneda_id",
      "enpesos_localizado",
      "observaciones"
    ] 
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, tipomoneda_id: :asc)
  end

  def new_modelo_path(o)
    return new_tasacambio_path()
  end

  def genclase
    return 'F'
  end


  private

  def set_tasacambio
    @registro = @basica = @tasacambio = ::Tasacambio.find(
      Tasacambio.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def tasacambio_params
    params.require(:tasacambio).permit([
      :enpesos_localizado,
      :fecha_localizada,
      :observaciones,
      :tipomoneda_id
    ])
  end
end
