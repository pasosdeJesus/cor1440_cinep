# encoding: UTF-8

class GrupoProyectofinanciero < ActiveRecord::Base
  belongs_to :grupo, class_name: 'Sip::Grupo', 
    foreign_key: 'grupo_id'
  belongs_to :proyectofinanciero, 
    class_name: 'Cor1440Gen::Proyectofinanciero',
    foreign_key: 'proyectofinanciero_id'
end

