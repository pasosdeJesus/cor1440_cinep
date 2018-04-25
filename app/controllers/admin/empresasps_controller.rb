# encoding: UTF-8

module Admin
  class EmpresaspsController < Sip::Admin::BasicasController
    before_action :set_empresaps, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Empresaps

    def clase 
      "::Empresaps"
    end

    def set_empresaps
      @basica = Empresaps.find(params[:id])
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

    def empresaps_params
      params.require(:empresaps).permit(*atributos_form)
    end

  end
end
