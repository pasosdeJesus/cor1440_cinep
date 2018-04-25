# encoding: UTF-8

module Admin
  class ProcesosghController < Sip::Admin::BasicasController
    before_action :set_procesogh, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Procesogh

    def clase 
      "::Procesogh"
    end

    def set_procesogh
      @basica = Procesogh.find(params[:id])
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

    def procesogh_params
      params.require(:procesogh).permit(*atributos_form)
    end

  end
end
