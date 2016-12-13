# encoding: UTF-8
module Admin
  class RedesactorController < Sip::Admin::BasicasController
    before_action :set_redactor, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Redactor

    def clase 
      "::Redactor"
    end

    def set_redactor
      @basica = Redactor.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion_localizada", 
        "fechadeshabilitacion_localizada"
      ]
    end

    def genclase
      'F'
    end

    def redactor_params
      params.require(:redactor).permit(*atributos_form)
    end

  end
end
