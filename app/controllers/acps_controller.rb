# encoding: UTF-8

class AcpsController < Heb412Gen::ModelosController
  helper ::ApplicationHelper

  before_action :set_acp, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Acp

  def clase
    "::Acp"
  end

  def atributos_index
    [ "id", 
      "cataccion_id",
      "fini_localizada",
      "ffin_localizada",
      "confr",
      "cobertura_id",
      "motivo_id",
      "descripcion"
    ] 
  end

  def index_reordenar(registros)
    return registros.reorder(fini: :desc, descripcion: :asc)
  end

  def new_modelo_path(o)
    return new_acp_path()
  end

  def genclase
    return 'F'
  end

  def vistas_manejadas
    ['Acp']
  end

  private

  def set_acp
    @registro = @basica = @acp = ::Acp.find(
      Acp.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def acp_params
    params.require(:acp).permit([
      :cataccion_id,
      :fini_localizada,
      :ffin_localizada,
      :confr,
      :cobertura_id,
      :motivo_id,
      :descripcion
    ])
  end
end
