# encoding: UTF-8

class ActorSectoractor < ActiveRecord::Base
  belongs_to :actor, class_name: '::Actor', foreign_key: 'actor_id'
  belongs_to :sectoractor, class_name: '::Sectoractor',
    foreign_key: 'sectoractor_id'
end

