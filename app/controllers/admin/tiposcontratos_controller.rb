# encoding: UTF-8

module Admin
  class TiposcontratosController < Sip::Admin::BasicasController
    before_action :set_tipocontrato, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tipocontrato, except: [:tiponomina]

    def clase 
      "::Tipocontrato"
    end

    def set_tipocontrato
      @basica = Tipocontrato.find(params[:id])
    end

    def atributos_index
      [
        "id", "nombre", "tiponomina_id", "observaciones", 
        "fechacreacion_localizada", 
        "habilitado"
      ]
    end

    def genclase
      'M'
    end

    # API
    def tiponomina
      authorize! :read, ::Tipocontrato
      authorize! :read, ::Tiponomina
      if !params[:id] || params[:id].to_i < 1
        render json: 'Sin parametro id', status: :unprocessable_entity
        return false
      end
      tc = Tipocontrato.find(params[:id])
      if !tc.tiponomina
        render json: 'Sin contrato sin tipo de nomina', 
          status: :unprocessable_entity
        return false
      end
      render json: {res: tc.tiponomina.nombre}, status: :ok
    end

    def tipocontrato_params
      params.require(:tipocontrato).permit(*atributos_form)
    end

  end
end
