# encoding: UTF-8

class ActorGrupo < ActiveRecord::Base
  belongs_to :actor, class_name: '::Actor', foreign_key: 'actor_id'
  belongs_to :grupo, class_name: 'Sip::Grupo', foreign_key: 'sip_grupo_id'
end

