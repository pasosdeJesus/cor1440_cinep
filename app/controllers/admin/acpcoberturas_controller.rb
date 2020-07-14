# encoding: UTF-8

module Admin
  class AcpcoberturasController < Sip::Admin::BasicasController
    before_action :set_acpcobertura, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpcobertura

    def clase 
      "::Acpcobertura"
    end

    def set_acpcobertura
      @basica = Acpcobertura.find(params[:id])
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
      'F'
    end

    def acpcobertura_params
      params.require(:acpcobertura).permit(*atributos_form)
    end

  end
end
