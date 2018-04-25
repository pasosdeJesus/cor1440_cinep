# encoding: UTF-8

class Fondopensiones < ActiveRecord::Base
  include Sip::Basica

  has_many :usuario, dependent: :delete_all, validate: true
  
end
