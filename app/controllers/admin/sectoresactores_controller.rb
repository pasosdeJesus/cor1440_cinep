# encoding: UTF-8
module Admin
  class SectoresactoresController < Sip::Admin::BasicasController
    before_action :set_sectoractor, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: Sectoractor

    def clase 
      "::Sectoractor"
    end

    def set_sectoractor
      @basica = ::Sectoractor.find(params[:id])
    end

    def genclase
      'M'
    end

    def atributos_index
      [
        "id", "nombre", "enplantrienal", "observaciones", "fechacreacion", 
        "fechadeshabilitacion"
      ]
    end

    def sectoractor_params
      params.require(:sectoractor).permit(*atributos_form)
    end

  end
end
