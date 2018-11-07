# encoding: UTF-8

module Admin
  class CajascompensacionController < Sip::Admin::BasicasController
    before_action :set_cajacompensacion, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Cajacompensacion

    def clase 
      "::Cajacompensacion"
    end

    def set_cajacompensacion
      @basica = Cajacompensacion.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion_localizada", 
        "habilitado"
      ]
    end

    def genclase
      'M'
    end

    def cajacompensacion_params
      params.require(:cajacompensacion).permit(*atributos_form)
    end

  end
end
