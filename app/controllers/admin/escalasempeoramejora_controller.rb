# encoding: UTF-8

module Admin
  class EscalasempeoramejoraController < Sip::Admin::BasicasController
    before_action :set_escalaempeoramejora, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Escalaempeoramejora

    def clase 
      "::Escalaempeoramejora"
    end

    def set_escalaempeoramejora
      @basica = Escalaempeoramejora.find(params[:id])
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

    def escalaempeoramejora_params
      params.require(:escalaempeoramejora).permit(*atributos_form)
    end

  end
end
