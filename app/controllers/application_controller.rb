# encoding: UTF-8
require 'cor1440_gen/application_controller'
class ApplicationController < Cor1440Gen::ApplicationController
  protect_from_forgery with: :exception
end

