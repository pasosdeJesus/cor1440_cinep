# encoding: UTF-8

class Publicacion < ActiveRecord::Base
	include Sip::Basica

  has_and_belongs_to_many :actividad,
    class_name: 'Cor1440Gen::Actividad',
    foreign_key: 'publicacion_id',
    association_foreign_key: 'actividad_id',
    join_table: 'actividad_publicacion'

end
