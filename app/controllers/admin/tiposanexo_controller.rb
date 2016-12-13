# encoding: UTF-8

module Admin
  class TiposanexoController < Sip::Admin::BasicasController
    before_action :set_tipoanexo, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tipoanexo

    def clase 
      "::Tipoanexo"
    end

    def set_tipoanexo
      @basica = Tipoanexo.find(params[:id])
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

    def tipoanexo_params
      params.require(:tipoanexo).permit(*atributos_form)
    end

  end
end
