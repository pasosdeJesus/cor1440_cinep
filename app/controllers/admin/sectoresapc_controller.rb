# encoding: UTF-8

module Admin
  class SectoresapcController < Sip::Admin::BasicasController
    before_action :set_sectorapc, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Sectorapc

    def clase 
      "::Sectorapc"
    end

    def set_sectorapc
      @basica = Sectorapc.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion", 
        "fechadeshabilitacion"
      ]
    end

    def genclase
      'M'
    end

    def sectorapc_params
      params.require(:sectorapc).permit(*atributos_form)
    end

  end
end
