# encoding: UTF-8

module Admin
  class ProfesionesController < Sip::Admin::BasicasController
    before_action :set_profesion, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Profesion, except: [:areaestudios]

    def clase 
      "::Profesion"
    end

    def set_profesion
      @basica = Profesion.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "areaestudios_id", "observaciones", 
        "fechacreacion_localizada", "habilitado"
      ]
    end

    def genclase
      'F'
    end

    # API
    def areaestudios
      authorize! :read, ::Profesion
      authorize! :read, ::Areaestudios
      if !params[:id]
        render json: 'Sin parametro id', status: :unprocessable_entity
        return false
      end
      p = Profesion.find(params[:id])
      if !p.areaestudios
        render json: 'Sin área de estudios', status: :unprocessable_entity
        return false
      end
      render json: {res: p.areaestudios.nombre}, status: :ok
    end

    def profesion_params
      params.require(:profesion).permit(*atributos_form)
    end

  end
end
