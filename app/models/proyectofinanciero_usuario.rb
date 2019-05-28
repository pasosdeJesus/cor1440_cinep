# encoding: UTF-8

class ProyectofinancieroUsuario < ActiveRecord::Base
  belongs_to :proyectofinanciero, 
    class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'
  belongs_to :usuario, class_name: '::Usuario',
    foreign_key: 'usuario_id'
  belongs_to :cargo, class_name: '::Cargo',
    foreign_key: 'cargo_id', optional: true
  belongs_to :perfilprofesional, class_name: '::Perfilprofesional',
    foreign_key: 'perfilprofesional_id', optional: true
  belongs_to :tipocontrato, class_name: '::Tipocontrato',
    foreign_key: 'tipocontrato_id', optional: true

  validates :cargo, presence: true

  validates :porcentaje, numericality: {
    greater_than_or_equal: 0, less_than_or_equal_to: 100 
  }, allow_blank: true
#  default_scope { joins(:usuario).order("usuario.nombre") }
end
