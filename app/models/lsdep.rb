class Lsdep < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha

  belongs_to :ls, class_name: '::Ls', 
    foreign_key: 'ls_id'
  belongs_to :departamento, class_name: 'Sip::Departamento', 
    foreign_key: 'departamento_id'

  has_many :lsmun, dependent: :destroy

  validates :orden, presence: true

  validates :descripcion, uniqueness: {
    message: 'no puede haber dos departamentos con la misma descripción' },
    length: {maximum: 5000}
  validates :fuente, length: {maximum: 512}

end
