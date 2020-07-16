# encoding: UTF-8

class Acpestrategia < ActiveRecord::Base
  include Sip::Basica

  has_many :cataccion, class_name: '::Acpcataccion', 
    foreign_key: 'estrategia_id', validate: true
end
