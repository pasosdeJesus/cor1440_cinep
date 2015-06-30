# encoding: UTF-8

class ActividadPublicacion < ActiveRecord::Base
  belongs_to :actividad, class_name: 'Cor1440Gen::Actividad', 
    foreign_key: 'actividad_id'
  belongs_to :publicacion, class_name: '::Publicacion',
    foreign_key: 'publicacion_id'
end

