# encoding: UTF-8

class Sectoractor < ActiveRecord::Base
	include Sip::Basica

  has_many :actor_sectoractor, dependent: :delete_all,
    class_name: '::ActorSectoractor', foreign_key: 'sectoractor_id'
  has_many :actor, through: :actor_sectoractor,
    class_name: '::Actor'


end
