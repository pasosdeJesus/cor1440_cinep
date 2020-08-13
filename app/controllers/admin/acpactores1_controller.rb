# encoding: UTF-8

module Admin
  class Acpactores1Controller < Sip::Admin::BasicasController
    before_action :set_acpactor1, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpactor1

    def clase 
      "::Acpactor1"
    end

    def set_acpactor1
      @basica = Acpactor1.find(params[:id])
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

    def acpactor1_params
      params.require(:acpactor1).permit(*atributos_form)
    end

  end
end
