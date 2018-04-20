# encoding: UTF-8

module Admin
  class ProfesionesController < Sip::Admin::BasicasController
    before_action :set_profesion, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Profesion

    def clase 
      "::Profesion"
    end

    def set_profesion
      @basica = Profesion.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "areaestudios_id", "observaciones", 
        "fechacreacion", "fechadeshabilitacion"
      ]
    end

    def genclase
      'M'
    end

    def profesion_params
      params.require(:profesion).permit(*atributos_form)
    end

  end
end
