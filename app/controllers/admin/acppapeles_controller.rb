# encoding: UTF-8

module Admin
  class AcppapelesController < Sip::Admin::BasicasController
    before_action :set_acppapel, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acppapel

    def clase 
      "::Acppapel"
    end

    def set_acppapel
      @basica = Acppapel.find(params[:id])
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

    def acppapel_params
      params.require(:acppapel).permit(*atributos_form)
    end

  end
end
