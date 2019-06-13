# encoding: UTF-8

module Cor1440Gen
  class ActorsocialEfecto < ActiveRecord::Base
    belongs_to :actorsocial, class_name: 'Sip::Actorsocial',
      foreign_key: 'actorsocial_id'
    belongs_to :efecto, class_name: 'Cor1440Gen::Efecto',
      foreign_key: 'efecto_id'
  end
end

