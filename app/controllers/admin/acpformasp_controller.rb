# encoding: UTF-8

module Admin
  class AcpformaspController < Sip::Admin::BasicasController
    before_action :set_acpformap, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpformap

    def clase 
      "::Acpformap"
    end

    def set_acpformap
      @basica = Acpformap.find(params[:id])
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

    def acpformap_params
      params.require(:acpformap).permit(*atributos_form)
    end

  end
end
