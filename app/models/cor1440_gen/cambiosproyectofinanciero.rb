# encoding: UTF-8

module Cor1440Gen
  class Cambiosproyectofinanciero < ActiveRecord::Base

    include Sip::Localizacion

    belongs_to :usuario, foreign_key: 'usuario_id',
      validate: true, class_name: '::Usuario'
    belongs_to :proyectofinanciero, foreign_key: 'proyectofinanciero_id',
      validate: true, class_name: 'Cor1440Gen::Proyectofinanciero'

  end
end
