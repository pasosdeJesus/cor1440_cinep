# encoding: UTF-8

class Lineabase < ActiveRecord::Base
  include Sip::Basica

  has_and_belongs_to_many :organizacionsocial, 
    class_name: 'Sip::Actorsocial',
    foreign_key: 'lineabase_id',
    association_foreign_key: 'organizacionsocial_id',
    join_table: 'lineabase_organizacionsocial'

end
