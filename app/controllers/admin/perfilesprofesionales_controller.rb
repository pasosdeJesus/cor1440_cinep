# encoding: UTF-8

module Admin
  class PerfilesprofesionalesController < Sip::Admin::BasicasController
    before_action :set_perfilprofesional, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Perfilprofesional

    def clase 
      "::Perfilprofesional"
    end

    def set_perfilprofesional
      @basica = Perfilprofesional.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "observaciones", "fechacreacion", 
        "fechadeshabilitacion"
      ]
    end

    def genclase
      'M'
    end

    def perfilprofesional_params
      params.require(:perfilprofesional).permit(*atributos_form)
    end

  end
end
