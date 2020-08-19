# encoding: UTF-8

module Admin
  class EscalasindmuyController < Sip::Admin::BasicasController
    before_action :set_escalaindmuy, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Escalaindmuy

    def clase 
      "::Escalaindmuy"
    end

    def set_escalaindmuy
      @basica = Escalaindmuy.find(params[:id])
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
      'F'
    end

    def escalaindmuy_params
      params.require(:escalaindmuy).permit(*atributos_form)
    end

  end
end
