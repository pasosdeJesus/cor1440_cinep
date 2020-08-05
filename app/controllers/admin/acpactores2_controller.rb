# encoding: UTF-8

module Admin
  class Acpactores2Controller < Sip::Admin::BasicasController
    before_action :set_acpactor2, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpactor2

    def clase 
      "::Acpactor2"
    end

    def set_acpactor2
      @basica = Acpactor2.find(params[:id])
    end

    def atributos_index
      [
        :id, 
        :nombre, 
        :actor1, 
        :observaciones, 
        :fechacreacion_localizada, 
        :habilitado
      ]
    end

    def genclase
      'M'
    end

    def acpactor2_params
      params.require(:acpactor2).permit(*atributos_form-[:actor1]+[:actor1_id])
    end

  end
end
