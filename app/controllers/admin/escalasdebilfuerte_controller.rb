# encoding: UTF-8

module Admin
  class EscalasdebilfuerteController < Sip::Admin::BasicasController
    before_action :set_escaladebilfuerte, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Escaladebilfuerte

    def clase 
      "::Escaladebilfuerte"
    end

    def set_escaladebilfuerte
      @basica = Escaladebilfuerte.find(params[:id])
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

    def escaladebilfuerte_params
      params.require(:escaladebilfuerte).permit(*atributos_form)
    end

  end
end
