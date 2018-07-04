# encoding: UTF-8

require 'cor1440_gen/concerns/models/valorcampotind'

module Cor1440Gen
  class Valorcampotind < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Valorcampotind
    has_many :efecto_valorcampotind, dependent: :delete_all,
      class_name: '::EfectoValorcampotind',
      foreign_key: 'valorcampotind_id', validate: true
  end
end
