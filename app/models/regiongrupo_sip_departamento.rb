# encoding: UTF-8

class RegiongrupoSipDepartamento < ActiveRecord::Base
  belongs_to :regiongrupo, class_name: '::Regiongrupo', 
    foreign_key: 'regiongrupo_id'
  belongs_to :departamento, 
    class_name: 'Sip::Departamento',
    foreign_key: 'sip_departamento_id'
end

