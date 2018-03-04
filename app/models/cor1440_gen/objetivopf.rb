# encoding: UTF-8

require 'cor1440_gen/concerns/models/objetivopf'

module Cor1440Gen
  class Objetivopf < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Objetivopf

    has_many :actividad_objetivopf, dependent: :delete_all,
      class_name: 'Cor1440Gen::ActividadObjetivopf', 
      foreign_key: 'objetivopf_id'
    has_many :actividad, through: :actividad_objetivopf,
      class_name: 'Cor1440Gen::Actividad'

  end
end
