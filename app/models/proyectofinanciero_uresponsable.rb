# encoding: UTF-8

class ProyectofinancieroUresponsable < ActiveRecord::Base
  belongs_to :proyectofinanciero, class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'#, inverse_of: :coordinador_proyectofinanciero
  belongs_to :uresponsable, class_name: '::Usuario',
    foreign_key: 'uresponsable_id', 
    inverse_of: :proyectofinanciero_uresponsable
end
