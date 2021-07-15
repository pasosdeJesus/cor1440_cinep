class Tipoproductopf < ActiveRecord::Base
  include Sip::Basica

  has_many :publicacion, dependent: :delete_all,
    class_name: '::Publicacion',
    foreign_key: 'tipoproductopf_id', validate: true

end
