module Admin
  class CategoriasrevistaController < Sip::Admin::BasicasController
    before_action :set_categoriarevista, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Categoriarevista

    def clase 
      "::Categoriarevista"
    end

    def set_categoriarevista
      @basica = Categoriarevista.find(params[:id])
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
      'F'
    end

    def categoriarevista_params
      params.require(:categoriarevista).permit(*atributos_form)
    end

  end
end
