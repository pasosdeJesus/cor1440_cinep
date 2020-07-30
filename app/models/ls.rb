class Ls < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha

  belongs_to :cobertura, class_name: '::Lscobertura', 
    foreign_key: 'cobertura_id'

  has_many :lsdep, dependent: :destroy

  validates :fecha, presence: true
  validates :descripcion, presence: true, uniqueness: { 
    message: 'no puede haber dos luchas con la misma descripción' }, 
    length: { maximum: 5000 }
  validates :orgconvocante, length: { maximum: 512}
  validates :dirig1, length: { maximum: 512}
  validates :dirig2, length: { maximum: 512}
  validates :dirig3, length: { maximum: 512}
  validates :partici1, length: { maximum: 512}
  validates :partici2, length: { maximum: 512}
  validates :partici3, length: { maximum: 512}
  validates :motivopp, length: { maximum: 512}
  validates :motivo2, length: { maximum: 512}
  validates :motivo3, length: { maximum: 512}
  validates :motivo4, length: { maximum: 512}
  validates :motivo5, length: { maximum: 512}
  validates :entidad1, length: { maximum: 512}
  validates :entidad2, length: { maximum: 512}
  validates :entidad3, length: { maximum: 512}
  validates :fuente, length: { maximum: 512}

  scope :filtro_cobertura_id, lambda { |t| 
    where(cobertura_id: t)
  }

  scope :filtro_fechaini, lambda { |f|
      where('fecha >= ?', f)
  }
  scope :filtro_fechafin, lambda { |f|
      where('fecha <= ?', f)
  }

  scope :filtro_descripcion, lambda {|d|
    where("unaccent(descripcion) ILIKE '%' || unaccent(?) || '%'", d)
  }

  def presenta_nombre
    "#{fini} #{descripcion[0..49]}"
  end
end
