# encoding: UTF-8

class Cargo < ActiveRecord::Base
	include Sip::Basica

  has_many :usuario, class_name: '::Usuario', foreign_key: 'cargo_id',
    validate: true
end
