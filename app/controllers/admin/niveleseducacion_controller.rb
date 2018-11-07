# encoding: UTF-8

module Admin
  class NiveleseducacionController < Sip::Admin::BasicasController
    before_action :set_niveleducacion, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Niveleducacion

    def clase 
      "::Niveleducacion"
    end

    def set_niveleducacion
      @basica = Niveleducacion.find(params[:id])
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

    def niveleducacion_params
      params.require(:niveleducacion).permit(*atributos_form)
    end

  end
end
