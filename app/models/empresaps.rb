# encoding: UTF-8

class Empresaps < ActiveRecord::Base
  include Sip::Basica

  has_many :usuario, dependent: :delete_all, validate: true
end
