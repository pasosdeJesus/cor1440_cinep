# encoding: UTF-8

class EfectosController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_efecto, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Efecto

  def clase
    "::Efecto"
  end

  def atributos_index
    [ "id", 
      "indicadorpf_id",
      "actor_id",
      "fecha_localizada"
    ] 
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, indicadorpf_id: :asc)
  end

  def new_modelo_path(o)
    return new_efecto_path()
  end

  def genclase
    return 'M'
  end

  private

  def set_efecto
    @registro = @efecto = ::Efecto.find(
      Efecto.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def efecto_params
    params.require(:efecto).permit(atributos_index)
  end
end
