# encoding: UTF-8
module Admin
  class NucleosconflictoController < Sip::Admin::BasicasController
    before_action :set_nucleoconflicto, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Nucleoconflicto

    def clase 
      "::Nucleoconflicto"
    end

    def set_nucleoconflicto
      @basica = Nucleoconflicto.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion_localizada", 
        "fechadeshabilitacion_localizada"
      ]
    end

    def genclase
      'M'
    end

    def nucleoconflicto_params
      params.require(:nucleoconflicto).permit(*atributos_form)
    end

  end
end
