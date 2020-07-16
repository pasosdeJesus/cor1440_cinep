# encoding: UTF-8

module Admin
  class AcpmotivosController < Sip::Admin::BasicasController
    before_action :set_acpmotivo, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Acpmotivo

    def clase 
      "::Acpmotivo"
    end

    def set_acpmotivo
      @basica = Acpmotivo.find(params[:id])
    end

    def atributos_index
      [
        :id, 
        :nombre, 
        :catmotivo,
        :observaciones, 
        :fechacreacion_localizada, 
        :habilitado
      ]
    end

    def genclase
      'M'
    end

    def acpmotivo_params
      params.require(:acpmotivo).permit(*atributos_form)
    end

  end
end
