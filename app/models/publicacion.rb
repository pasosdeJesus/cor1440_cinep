# encoding: UTF-8

class Publicacion < ActiveRecord::Base
	include Sip::Basica

  has_many :actividad_publicacion, dependent: :delete_all,
    class_name: '::ActividadPublicacion', foreign_key: 'publicacion_id'
  has_many :actividad, through: :actividad_publicacion,
    class_name: 'Cor1440Gen::Actividad'

end
