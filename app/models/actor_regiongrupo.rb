# encoding: UTF-8

class ActorRegiongrupo < ActiveRecord::Base
  belongs_to :actor, class_name: '::Actor', foreign_key: 'actor_id'
  belongs_to :regiongrupo, class_name: '::Regiongrupo',
    foreign_key: 'regiongrupo_id'
end

