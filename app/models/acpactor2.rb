# encoding: UTF-8

class Acpactor2 < ActiveRecord::Base
  include Sip::Basica
  belongs_to :actor1, class_name: '::Acpactor1',
    foreign_key: 'actor1_id', validate: true
end
