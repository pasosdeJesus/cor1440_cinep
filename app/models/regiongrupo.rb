# encoding: UTF-8

class Regiongrupo < ActiveRecord::Base
	include Sip::Basica

  belongs_to :grupo, class_name: 'Sip::Grupo',
    foreign_key: 'grupo_id', validate: true

  has_many :regiongrupo_departamento, dependent: :delete_all,
    class_name: '::RegiongrupoSipDepartamento',
    foreign_key: 'regiongrupo_id'
  has_many :departamento, through: :regiongrupo_departamento,
    class_name: 'Sip::Departamento'

  has_many :regiongrupo_municipio, dependent: :delete_all,
    class_name: '::RegiongrupoSipMunicipio',
    foreign_key: 'regiongrupo_id'
  has_many :municipio, through: :regiongrupo_municipio,
    class_name: 'Sip::Municipio'


end
