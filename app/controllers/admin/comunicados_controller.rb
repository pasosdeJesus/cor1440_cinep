# encoding: UTF-8

module Admin
  class ComunicadosController < Sip::Admin::BasicasController
    before_action :set_comunicado, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Comunicado,
      except: [:presenta]

    def clase 
      "::Comunicado"
    end

    def set_comunicado
      @basica = @registro = @comunicado = Comunicado.find(params[:id])
    end

    def atributos_index
      [
        :id, 
        :nombre, 
        :contenido,
        :observaciones, 
        :fechacreacion_localizada, 
        :habilitado
      ]
    end

    def genclase
      'M'
    end

    def presenta
      @basica = @registro = @comunicado = ::Comunicado.
        where(nombre: params[:nombre]).take
      render layout: 'externo'
    end

    def comunicado_params
      params.require(:comunicado).permit(*atributos_form)
    end

  end
end
