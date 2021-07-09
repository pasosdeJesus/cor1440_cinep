# encoding: UTF-8

class Publicacion < ActiveRecord::Base
  include Sip::Localizacion
  include Sip::Modelo

  validates :nombre, presence: true, allow_blank: false, 
    length: { maximum: 500 }
  validates :observaciones, length: { maximum: 5000 }

  campofecha_localizado :created_at
  campofecha_localizado :updated_at

  # Actividad donde se lanza
  has_one :actividadlanzamiento,
    class_name: 'Cor1440Gen::Actividad',
    foreign_key: 'lanzapublicacion_id'


    # Actividades donde se usa
  has_and_belongs_to_many :actividad,
    class_name: 'Cor1440Gen::Actividad',
    foreign_key: 'publicacion_id',
    association_foreign_key: 'actividad_id',
    join_table: 'actividad_publicacion'

end
