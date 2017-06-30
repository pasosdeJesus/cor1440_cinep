# encoding: UTF-8

class ActividadGrupo < ActiveRecord::Base
  belongs_to :actividad, class_name: 'Cor1440Gen::Actividad', 
    foreign_key: 'actividad_id'
  belongs_to :grupo, class_name: 'Sip::Grupo',
    foreign_key: 'grupo_id'
end

