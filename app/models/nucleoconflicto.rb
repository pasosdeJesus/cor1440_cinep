# encoding: UTF-8

class Nucleoconflicto < ActiveRecord::Base
	include Sip::Basica

  has_many :actividad_nucleoconflicto, dependent: :delete_all,
    class_name: '::ActividadNucleoconflicto', foreign_key: 'nucleoconflicto_id'
  has_many :actividad, through: :actividad_nucleoconflicto,
    class_name: 'Cor1440Gen::Actividad'

end
