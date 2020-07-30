# encoding: UTF-8

module Admin
  class LscoberturasController < Sip::Admin::BasicasController
    before_action :set_lscobertura, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Lscobertura

    def clase 
      "::Lscobertura"
    end

    def set_lscobertura
      @basica = Lscobertura.find(params[:id])
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

    def lscobertura_params
      params.require(:lscobertura).permit(*atributos_form)
    end

  end
end
