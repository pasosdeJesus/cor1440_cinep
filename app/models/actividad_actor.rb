# encoding: UTF-8

class ActividadActor < ActiveRecord::Base
  belongs_to :actividad, class_name: 'Cor1440Gen::Actividad', 
    foreign_key: 'actividad_id'
  belongs_to :actor, class_name: 'Actor',
    foreign_key: 'actor_id'
end

