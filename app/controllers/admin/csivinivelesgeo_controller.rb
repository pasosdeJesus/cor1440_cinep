# encoding: UTF-8

module Admin
  class CsivinivelesgeoController < Sip::Admin::BasicasController
    before_action :set_csivinivelgeo, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Csivinivelgeo

    def clase 
      "::Csivinivelgeo"
    end

    def set_csivinivelgeo
      @basica = Csivinivelgeo.find(params[:id])
    end

    def atributos_index
      [
        :id, 
        :nombre, 
        :observaciones, 
        :fechacreacion_localizada, 
        :habilitado
      ]
    end

    def genclase
      'M'
    end

    def csivinivelgeo_params
      params.require(:csivinivelgeo).permit(*atributos_form)
    end

  end
end
