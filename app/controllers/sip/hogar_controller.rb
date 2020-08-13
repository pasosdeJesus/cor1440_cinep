# encoding: UTF-8

require 'sip/concerns/controllers/hogar_controller'

module Sip
  class HogarController < ApplicationController

    include Sip::Concerns::Controllers::HogarController

    def index
      if current_usuario
        authorize! :read, Sip::Pais
      end
      render layout: 'application'
    end

    def confytransf
      authorize! :index, :confytransf
      render layout: 'application'
    end

    def dinamicasconflicto
      authorize! :index, :dinamicas
      render layout: 'application'
    end
  end
end
