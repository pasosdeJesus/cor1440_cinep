# encoding: UTF-8

module Admin
  class CargosController < Sip::Admin::BasicasController
    before_action :set_cargo, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Cargo

    def clase 
      "::Cargo"
    end

    def set_cargo
      @basica = Cargo.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion_localizada", 
        "habilitado"
      ]
    end

    def genclase
      'M'
    end

    def cargo_params
      params.require(:cargo).permit(*atributos_form)
    end

  end
end
