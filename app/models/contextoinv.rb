# encoding: UTF-8

class Contextoinv < ActiveRecord::Base
	include Sip::Basica

  belongs_to :usuario, class_name: '::Usuario',
    foreign_key: 'usuario_id', validate: true
  
  belongs_to :regiongrupo, class_name: '::Regiongrupo',
    foreign_key: 'usuario_id', validate: true

  has_many :actividad, validate: true,
    class_name: 'Cor1440Gen::Actividad', 
    foreign_key: 'contextoinv_id'

end
