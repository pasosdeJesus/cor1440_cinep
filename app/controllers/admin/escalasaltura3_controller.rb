# encoding: UTF-8

module Admin
  class Escalasaltura3Controller < Sip::Admin::BasicasController
    before_action :set_escalaaltura3, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Escalaaltura3

    def clase 
      "::Escalaaltura3"
    end

    def set_escalaaltura3
      @basica = Escalaaltura3.find(params[:id])
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
      'M'
    end

    def escalaaltura3_params
      params.require(:escalaaltura3).permit(*atributos_form)
    end

  end
end
