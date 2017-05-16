# encoding: UTF-8

module Admin
  class RegionesgrupoController < Sip::Admin::BasicasController
    before_action :set_regiongrupo, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Regiongrupo

    def clase 
      "::Regiongrupo"
    end

    def set_regiongrupo
      @basica = Regiongrupo.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "grupo_id"] +
      [ :departamento_ids =>  [] ] +
#      [ :municipios_ids =>  [] ] +
      [ 
        "fechacreacion", 
        "fechadeshabilitacion"
      ]
    end

    def genclase
      'F'
    end

    def regiongrupo_params
      params.require(:regiongrupo).permit(*atributos_form)
    end

  end
end
