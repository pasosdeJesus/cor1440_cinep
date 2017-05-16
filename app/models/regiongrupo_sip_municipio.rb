# encoding: UTF-8

class RegiongrupoSipMunicipio < ActiveRecord::Base
  belongs_to :regiongrupo, class_name: '::Regiongrupo', 
    foreign_key: 'regiongrupo_id'
  belongs_to :municipio, 
    class_name: 'Sip::Municipio',
    foreign_key: 'sip_municipio_id'
end

