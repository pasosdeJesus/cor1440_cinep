# encoding: UTF-8

module Admin
  class AreasestudiosController < Sip::Admin::BasicasController
    before_action :set_areaestudios, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Areaestudios

    def clase 
      "::Areaestudios"
    end

    def set_areaestudios
      @basica = Areaestudios.find(params[:id])
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

    def areaestudios_params
      params.require(:areaestudios).permit(*atributos_form)
    end

  end
end
