# encoding: UTF-8

class Publicacion < ActiveRecord::Base
  include Sip::Localizacion
  include Sip::Modelo

  belongs_to :categoriarevista

  belongs_to :tipoproductopf

  # Actividad donde se lanza
  has_one :actividadpublicacionproducto,
    class_name: 'Cor1440Gen::Actividad',
    foreign_key: 'publicacionproducto_id'

  # Actividades donde se usa
  has_and_belongs_to_many :actividad,
    class_name: 'Cor1440Gen::Actividad',
    foreign_key: 'publicacion_id',
    association_foreign_key: 'actividad_id',
    join_table: 'actividad_publicacion'

  has_many :descargaspublicacion, dependent: :delete_all,
    class_name: '::Descargaspublicacion',
    foreign_key: 'publicacion_id', validate: true
  accepts_nested_attributes_for :descargaspublicacion, 
    allow_destroy: true, reject_if: :all_blank

  validates :nombre, presence: true, allow_blank: false, 
    length: { maximum: 500 }
  validates :observaciones, length: { maximum: 5000 }
  validates :autor, length: { maximum: 500 }
  validates :revista, length: { maximum: 500 }
  validates :editorial, length: { maximum: 500 }
  validates :issn, length: { maximum: 500 }

  campofecha_localizado :created_at
  campofecha_localizado :updated_at

  scope :filtro_nombre, lambda {|n|
    where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", n)
  }

  scope :filtro_autor, lambda {|a|
    where("unaccent(autor) ILIKE '%' || unaccent(?) || '%'", n)
  }

  scope :filtro_observaciones, lambda {|o|
    where("unaccent(observaciones) ILIKE '%' || unaccent(?) || '%'", o)
  }

  scope :filtro_tipoproductopf_id, lambda {|t|
    where(tipoproductopf_id: t)
  }

  def presenta(atr)
    case atr.to_s
    when 'descargaspublicacion'
      descargaspublicacion.inject(0) {|memo,v|
        memo+v.descargas
      }
    else
      presenta_gen(atr)
    end
  end
end
