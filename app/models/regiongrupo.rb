class Regiongrupo < ActiveRecord::Base
  include Sip::Basica

  belongs_to :grupo, class_name: 'Sip::Grupo',
    foreign_key: 'grupo_id', validate: true

  has_and_belongs_to_many :departamento, 
    class_name: 'Sip::Departamento',
    foreign_key: 'regiongrupo_id',
    association_foreign_key: 'sip_departamento_id',
    join_table: 'regiongrupo_sip_departamento'

  has_and_belongs_to_many :municipio, 
    class_name: 'Sip::Municipio',
    foreign_key: 'regiongrupo_id',
    association_foreign_key: 'sip_municipio_id',
    join_table: 'regiongrupo_sip_municipio'

  has_and_belongs_to_many :orgsocial, 
    class_name: 'Sip::Orgsocial',
    foreign_key: 'regiongrupo_id',
    association_foreign_key: 'orgsocial_id',
    join_table: 'orgsocial_regiongrupo'

  has_many :contextoinv,
    class_name: '::Contextoinv',
    foreign_key: 'regiongrupo_id',
    dependent: :nullify


  def self.incluye_municipio(grupo_id, departamento_id, municipio_id)
    ::Regiongrupo.where(grupo_id: grupo_id).where(
      'id IN (SELECT regiongrupo_id FROM 
      regiongrupo_sip_departamento WHERE sip_departamento_id=?) OR
      id IN (SELECT regiongrupo_id FROM regiongrupo_sip_municipio WHERE
      sip_municipio_id=?)', departamento_id, municipio_id)
  end
end
