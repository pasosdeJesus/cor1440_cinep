# encoding: UTF-8

module Admin
  class PlantillascorreoController < Sip::Admin::BasicasController
    before_action :set_plantillacorreo, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Plantillacorreo

    def clase 
      "::Plantillacorreo"
    end

    def set_plantillacorreo
      @basica = Plantillacorreo.find(params[:id])
    end

    def atributos_index
      [
        :id, 
        :nombre, 
        :contenido,
        :fechacreacion_localizada, 
        :habilitado
      ]
    end

    def genclase
      'M'
    end

    def plantillacorreo_params
      params.require(:plantillacorreo).permit(*atributos_form)
    end

  end
end
