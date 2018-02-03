# encoding: UTF-8

module Admin
  class NivelesrelacionController < Sip::Admin::BasicasController
    before_action :set_nivelrelacion, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Nivelrelacion

    def clase 
      "::Nivelrelacion"
    end

    def set_nivelrelacion
      @basica = Nivelrelacion.find(params[:id])
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

    def nivelrelacion_params
      params.require(:nivelrelacion).permit(*atributos_form)
    end

  end
end
