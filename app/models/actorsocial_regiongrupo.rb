# encoding: UTF-8

class ActorsocialRegiongrupo < ActiveRecord::Base
  belongs_to :actorsocial, class_name: 'Sip::Actorsocial',
    foreign_key: 'actorsocial_id'
  belongs_to :regiongrupo, class_name: '::Regiongrupo',
    foreign_key: 'regiongrupo_id'
end

