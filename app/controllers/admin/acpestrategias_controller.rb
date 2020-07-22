# encoding: UTF-8

module Admin
  class AcpestrategiasController < Sip::Admin::BasicasController
    before_action :set_acpestrategia, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpestrategia

    def clase 
      "::Acpestrategia"
    end

    def set_acpestrategia
      @basica = Acpestrategia.find(params[:id])
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

    def acpestrategia_params
      params.require(:acpestrategia).permit(*atributos_form)
    end

  end
end
