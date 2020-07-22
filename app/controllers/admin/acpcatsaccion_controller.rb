# encoding: UTF-8

module Admin
  class AcpcatsaccionController < Sip::Admin::BasicasController
    before_action :set_acpcataccion, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpcataccion

    def clase 
      "::Acpcataccion"
    end

    def set_acpcataccion
      @basica = Acpcataccion.find(params[:id])
    end

    def atributos_index
      [
        :id, 
        :nombre, 
        :estrategia,
        :observaciones, 
        :fechacreacion_localizada, 
        :habilitado
      ]
    end

    def genclase
      'F'
    end

    def acpcataccion_params
      params.require(:acpcataccion).permit(*atributos_form)
    end

  end
end
