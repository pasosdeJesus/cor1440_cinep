# encoding: UTF-8

module Admin
  class TiposconvenioController < Sip::Admin::BasicasController
    before_action :set_tipoconvenio, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tipoconvenio

    def clase 
      "::Tipoconvenio"
    end

    def set_tipoconvenio
      @basica = Tipoconvenio.find(params[:id])
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

    def tipoconvenio_params
      params.require(:tipoconvenio).permit(*atributos_form)
    end

  end
end
