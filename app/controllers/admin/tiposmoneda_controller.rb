# encoding: UTF-8

module Admin
  class TiposmonedaController < Sip::Admin::BasicasController
    before_action :set_tipomoneda, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tipomoneda

    def clase 
      "::Tipomoneda"
    end

    def set_tipomoneda
      @basica = Tipomoneda.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "codiso4217", "simbolo", "pais_id", 
        "observaciones", "fechacreacion_localizada", 
        "fechadeshabilitacion_localizada"
      ]
    end

    def genclase
      'F'
    end

    def tipomoneda_params
      params.require(:tipomoneda).permit(*atributos_form)
    end

  end
end
