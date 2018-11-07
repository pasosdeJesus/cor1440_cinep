# encoding: UTF-8

module Admin
  class TiposproductopfController < Sip::Admin::BasicasController
    before_action :set_tipoproductopf, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tipoproductopf

    def clase 
      "::Tipoproductopf"
    end

    def set_tipoproductopf
      @basica = Tipoproductopf.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", 
        "observaciones", "fechacreacion_localizada", 
        "habilitado"
      ]
    end

    def genclase
      'M'
    end

    def tipoproductopf_params
      params.require(:tipoproductopf).permit(*atributos_form)
    end

  end
end
