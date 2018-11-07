# encoding: UTF-8

module Cor1440Gen
  module Admin
    class FinanciadoresController < Sip::Admin::BasicasController
      before_action :set_financiador, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Cor1440Gen::Financiador

      def clase 
        "Cor1440Gen::Financiador"
      end

      def set_financiador
        @basica = Financiador.find(params[:id])
      end

      def atributos_index
        ["id", 
         "nombre", 
         "pais_id", 
         "domicilio",
         "razonsocial",
         "nit",
         "replegal",
         "web",
         "observaciones", 
         "fechacreacion_localizada", 
         "habilitado"]
      end

      # Genero del nombre (F - Femenino, M - Masculino)
      def genclase
        return 'M';
      end

      def financiador_params
        a = atributos_form - ["id"]
        params.require(:financiador).permit(*a)
      end
    end
  end
end

