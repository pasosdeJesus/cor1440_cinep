# encoding: UTF-8

class CoordinadorProyectofinanciero < ActiveRecord::Base
  belongs_to :proyectofinanciero, class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'proyectofinanciero_id'#, inverse_of: :coordinador_proyectofinanciero
  belongs_to :coordinador, class_name: '::Usuario',
    foreign_key: 'coordinador_id', inverse_of: :coordinador_proyectofinanciero
end
