class Acpactor < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  belongs_to :acp, class_name: '::Acp'
  belongs_to :actor2, class_name: '::Acpactor2',
    foreign_key: 'actor2_id'
  belongs_to :papel, class_name: '::Acppapel',
    foreign_key: 'papel_id'
  belongs_to :formap, class_name: '::Acpformap',
    foreign_key: 'formap_id'

  validates :actor3, length: {maximum: 500}
  validates :nump, numericality: {greather_than: 0}

  def presenta_nombre
    "#{actor3} #{actor2.nombre} #{actor2.actor1.nombre}"
  end
end
