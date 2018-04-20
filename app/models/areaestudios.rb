# encoding: UTF-8

class Areaestudios < ActiveRecord::Base
	include Sip::Basica

  has_many :profesion, dependent: :delete_all,
    class_name: '::Profesion', foreign_key: 'areaestudios_id'
end
