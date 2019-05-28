# encoding: UTF-8

class Profesion < ActiveRecord::Base
	include Sip::Basica

  belongs_to :areaestudios, validate: true, optional: true

  has_many :usuario, class_name: '::Usuario',
    foreign_key: 'profesion_id', validate: true
end
