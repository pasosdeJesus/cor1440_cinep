# encoding: UTF-8

class Acpcobertura < ActiveRecord::Base
  include Sip::Basica

  has_many :acp, class_name: '::Acp', 
    foreign_key: 'cobertura_id', validate: true
end
