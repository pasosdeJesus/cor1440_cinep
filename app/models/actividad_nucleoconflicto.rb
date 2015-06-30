# encoding: UTF-8

class ActividadNucleoconflicto < ActiveRecord::Base
  belongs_to :actividad, class_name: 'Cor1440Gen::Actividad', 
    foreign_key: 'actividad_id'
  belongs_to :otronucleoconflicto, class_name: '::Nucleoconflicto',
    foreign_key: 'nucleoconflicto_id'
end

