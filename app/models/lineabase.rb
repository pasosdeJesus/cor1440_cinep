class Lineabase < ActiveRecord::Base
  include Sip::Basica

  has_and_belongs_to_many :orgsocial, 
    class_name: 'Sip::Orgsocial',
    foreign_key: 'lineabase_id',
    association_foreign_key: 'orgsocial_id',
    join_table: 'lineabase_orgsocial'

end
