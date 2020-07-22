# encoding: UTF-8

class Acpcataccion < ActiveRecord::Base
  include Sip::Basica

  belongs_to :estrategia, class_name: '::Acpestrategia',
    foreign_key: 'estrategia_id', validate:true, optional: true
   
  has_many :acp, class_name: '::Acp', 
    foreign_key: 'cataccion_id', validate: true
end
