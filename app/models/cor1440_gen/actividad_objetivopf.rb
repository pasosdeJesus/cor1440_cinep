# encoding: UTF-8

module Cor1440Gen
  class ActividadObjetivopf < ActiveRecord::Base

    belongs_to :actividad, class_name: 'Cor1440Gen::Actividad', 
      foreign_key: 'actividad_id'
    belongs_to :objetivopf, class_name: 'Cor1440Gen::Objetivopf',
      foreign_key: 'objetivopf_id'

  end
end



