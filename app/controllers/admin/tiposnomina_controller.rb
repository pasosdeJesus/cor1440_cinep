# encoding: UTF-8

module Admin
  class TiposnominaController < Sip::Admin::BasicasController
    before_action :set_tiponomina, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tiponomina

    def clase 
      "::Tiponomina"
    end

    def set_tiponomina
      @basica = Tiponomina.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion_localizada", 
        "habilitado"
      ]
    end

    def genclase
      'F'
    end

    def tiponomina_params
      params.require(:tiponomina).permit(*atributos_form)
    end

  end
end
