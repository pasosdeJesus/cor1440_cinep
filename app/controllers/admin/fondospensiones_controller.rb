# encoding: UTF-8

module Admin
  class FondospensionesController < Sip::Admin::BasicasController
    before_action :set_fondopensiones, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Fondopensiones

    def clase 
      "::Fondopensiones"
    end

    def set_fondopensiones
      @basica = Fondopensiones.find(params[:id])
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

    def fondopensiones_params
      params.require(:fondopensiones).permit(*atributos_form)
    end

  end
end
