class OrgsocialRegiongrupo < ActiveRecord::Base
  belongs_to :orgsocial, class_name: 'Sip::Orgsocial',
    foreign_key: 'orgsocial_id'
  belongs_to :regiongrupo, class_name: '::Regiongrupo',
    foreign_key: 'regiongrupo_id'
end

