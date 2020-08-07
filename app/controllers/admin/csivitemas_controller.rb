# encoding: UTF-8

module Admin
  class CsivitemasController < Sip::Admin::BasicasController
    before_action :set_csivitema, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Csivitema

    def clase 
      "::Csivitema"
    end

    def set_csivitema
      @basica = Csivitema.find(params[:id])
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

    def csivitema_params
      params.require(:csivitema).permit(*atributos_form)
    end

  end
end
