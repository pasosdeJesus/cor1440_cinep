# encoding: UTF-8

module Admin
  class LineasbaseController < Sip::Admin::BasicasController
    before_action :set_lineabase, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Lineabase

    def clase 
      "::Lineabase"
    end

    def set_lineabase
      @basica = Lineabase.find(params[:id])
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

    def lineabase_params
      params.require(:lineabase).permit(*atributos_form)
    end

  end
end
