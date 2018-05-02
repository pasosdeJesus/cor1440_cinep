# encoding: UTF-8

class ActorEfecto < ActiveRecord::Base
  belongs_to :efecto
  belongs_to :actor
end

