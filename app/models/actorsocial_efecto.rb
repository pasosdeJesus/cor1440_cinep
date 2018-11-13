# encoding: UTF-8

class ActorsocialEfecto < ActiveRecord::Base
  belongs_to :actorsocial, class_name: 'Sip::Actorsocial',
    foreign_key: 'actorsocial_id'
  belongs_to :efecto
end

