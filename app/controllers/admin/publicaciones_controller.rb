# encoding: UTF-8
module Admin
  class PublicacionesController < Sip::Admin::BasicasController
    before_action :set_publicacion, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Publicacion

    def clase 
      "::Publicacion"
    end

    def set_publicacion
      @basica = Publicacion.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion_localizada", 
        "fechadeshabilitacion_localizada"
      ]
    end

    def genclase
      'F'
    end

    def publicacion_params
      params.require(:publicacion).permit(*atributos_form)
    end

  end
end
