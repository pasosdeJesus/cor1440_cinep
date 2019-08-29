# encoding: UTF-8
module Cor1440Gen
  class HogarController < Sip::HogarController

    def index
      if current_usuario
        authorize! :read, Sip::Pais
      end
      render layout: 'application'
    end

  end
end
