# encoding: utf-8

module Cor1440Gen
  class MindicadorespfController < Sip::ModelosController
    helper ::ApplicationHelper
    include Rails.application.routes.url_helpers 

    before_action :set_mindicadorpf, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Cor1440Gen::Mindicadorpf
 

    def clase
      "Cor1440Gen::Mindicadorpf"
    end

    def atributos_index
      [ "id",
        "proyectofinanciero_id",
        "indicadorpf_id",
        "frecuenciaanual",
        "descd1",
        "descd2",
        "descd3",
        "pmindicador"
      ]
    end

    def index_reordenar(registros)
      return registros.reorder(proyectofinanciero_id: :asc, indicadorpf_id: :asc)
    end

    def new_modelo_path(o)
      return new_minidicadorpf_path()
    end

    def genclase
      return 'F'
    end
     
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_mindicadorpf
      @registro = @mindicadorpf = Mindicadorpf.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def mindicadorpf_params
      params.require(:mindicadorpf).permit(
        atributos_form - ["pmindicador"] + [
          'pmindicador_attributes' => [
            'fecha_localizada', 'finicio_localizada', 'ffin_localizada', 
            'restiempo', 'dmed1', 'dmed2', 'dmed3', 
            'rind', 'meta', 'porcump', 'analisis', 'acciones', 'responsables', 
            'plazo', 'id', '_destroy'
          ]
        ]
      ) 
    end
  end
end
