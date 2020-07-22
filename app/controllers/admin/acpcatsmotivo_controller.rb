# encoding: UTF-8

module Admin
  class AcpcatsmotivoController < Sip::Admin::BasicasController
    before_action :set_acpcatmotivo, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpcatmotivo

    def clase 
      "::Acpcatmotivo"
    end

    def set_acpcatmotivo
      @basica = Acpcatmotivo.find(params[:id])
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

    def acpcatmotivo_params
      params.require(:acpcatmotivo).permit(*atributos_form)
    end

  end
end
