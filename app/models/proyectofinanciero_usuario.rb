# encoding: UTF-8

class ProyectofinancieroUsuario < ActiveRecord::Base
  belongs_to :proyectofinanciero, class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'
  belongs_to :usuario, class_name: '::Usuario',
    foreign_key: 'usuario_id'
  belongs_to :cargo, class_name: '::Cargo',
    foreign_key: 'cargo_id'

  validates :porcentaje, numericality: {
    greater_than: 0, less_than_or_equal_to: 100 
  }
#  default_scope { joins(:usuario).order("usuario.nombre") }
end
