# encoding: UTF-8

require 'cor1440_gen/concerns/models/proyectofinanciero'

module Cor1440Gen
  class Proyectofinanciero < ActiveRecord::Base
        include Cor1440Gen::Concerns::Models::Proyectofinanciero


          has_many :actividad_proyectofinanciero, dependent: :delete_all,
            class_name: 'Cor1440Gen::ActividadProyectofinanciero',
            foreign_key: 'proyectofinanciero_id'
          has_many :actividad, through: :actividad_proyectofinanciero,
            class_name: 'Cor1440Gen::Actividad'

  end
end
