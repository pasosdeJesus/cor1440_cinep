# encoding: UTF-8

class Acpcatmotivo < ActiveRecord::Base
  include Sip::Basica

  has_many :motivo, class_name: '::Acpmotivo', 
    foreign_key: 'catmotivo_id', validate: true
end
