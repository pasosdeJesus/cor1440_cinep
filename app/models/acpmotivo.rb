# encoding: UTF-8

class Acpmotivo < ActiveRecord::Base
  include Sip::Basica

  belongs_to :catmotivo, class_name: '::Acpcatmotivo',
    foreign_key: 'catmotivo_id', validate:true, optional: true
   
  has_many :acp, class_name: '::Acp', 
    foreign_key: 'motivo_id', validate: true
end
