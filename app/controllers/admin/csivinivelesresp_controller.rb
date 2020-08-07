# encoding: UTF-8

module Admin
  class CsivinivelesrespController < Sip::Admin::BasicasController
    before_action :set_csivinivelresp, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Csivinivelresp

    def clase 
      "::Csivinivelresp"
    end

    def set_csivinivelresp
      @basica = Csivinivelresp.find(params[:id])
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

    def csivinivelresp_params
      params.require(:csivinivelresp).permit(*atributos_form)
    end

  end
end
