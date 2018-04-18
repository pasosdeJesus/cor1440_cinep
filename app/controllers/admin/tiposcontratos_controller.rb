# encoding: UTF-8

module Admin
  class TiposcontratosController < Sip::Admin::BasicasController
    before_action :set_tipocontrato, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tipocontrato

    def clase 
      "::Tipocontrato"
    end

    def set_tipocontrato
      @basica = Tipocontrato.find(params[:id])
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

    def tipocontrato_params
      params.require(:tipocontrato).permit(*atributos_form)
    end

  end
end
