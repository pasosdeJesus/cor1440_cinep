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

  has_many :actor_regiongrupo, dependent: :delete_all,
    class_name: '::ActorRegiongrupo',
    foreign_key: 'regiongrupo_id'
  has_many :actor, through: :actor_regiongrupo,
    class_name: '::Actor'

  def self.incluye_municipio(grupo_id, departamento_id, municipio_id)
    ::Regiongrupo.where(grupo_id: grupo_id).where(
      'id IN (SELECT regiongrupo_id FROM 
      regiongrupo_sip_departamento WHERE sip_departamento_id=?) OR
      id IN (SELECT regiongrupo_id FROM regiongrupo_sip_municipio WHERE
      sip_municipio_id=?)', departamento_id, municipio_id)
  end
end
