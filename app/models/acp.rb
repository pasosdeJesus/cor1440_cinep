class Acp < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fini
  campofecha_localizado :ffin

  belongs_to :cataccion, class_name: '::Acpcataccion', 
    foreign_key: 'cataccion_id'
  belongs_to :cobertura, class_name: '::Acpcobertura', 
    foreign_key: 'cobertura_id'
  belongs_to :motivo, class_name: '::Acpmotivo', 
    foreign_key: 'motivo_id'

  has_many :fuente, class_name: '::Acpfuente', dependent: :delete_all,
    foreign_key: 'acp_id', validate: true
  has_many :lugar, class_name: '::Acplugar', dependent: :delete_all,
    foreign_key: 'acp_id', validate: true
  has_many :actor, class_name: '::Acpactor', dependent: :delete_all,
    foreign_key: 'acp_id', validate: true

  validates :cataccion_id, presence: true
  validates :fini, presence: true
  validates :cobertura_id, presence: true
  validates :motivo_id, presence: true
  validates :descripcion, presence: true, allow_blank: false
  validates :cobertura_id, presence: true

  validates :descripcion, uniqueness: {
    message: 'no puede haber dos acciones con la misma descripción'
  }

  scope :filtro_cataccion_id, lambda { |t| 
    where(cataccion_id: t)
  }
  
  scope :filtro_cobertura_id, lambda { |t| 
    where(cobertura_id: t)
  }

  scope :filtro_motivo_id, lambda { |t| 
    where(motivo_id: t)
  }

  scope :filtro_fini, lambda { |f|
      where('fini >= ?', f)
  }

  scope :filtro_ffin, lambda { |f|
      where('ffin <= ?', f)
  }

  scope :filtro_confrini, lambda {|p|
    where('confr >= ?', p)
  }

  scope :filtro_confrfin, lambda {|p|
    where('confr <= ?', p)
  }

  scope :filtro_descripcion, lambda {|d|
    where("unaccent(descripcion) ILIKE '%' || unaccent(?) || '%'", d)
  }

  def presenta_nombre
    "#{fini} #{descripcion[0..49]}"
  end

  def presenta(atr)
    case atr.to_s
    when 'fuentes'
      self.fuente.inject("") { |memo,f|
        (memo == "" ? "" : memo + "; ") + 
          f.fuente + " - " + 
          (f.pagina ? f.pagina : '') + " - " + 
          f.ffuente_localizada.to_s
      }
    when 'actores'
      self.actor.inject("") { |memo,a|
        (memo == "" ? "" : memo + "; ") + 
          (a.actor3 ? a.actor3 : '') + " - " + 
          a.actor2.nombre + " - " + 
          a.papel.nombre + " - " + 
          a.formap.nombre + " - " +
          (a.nump ? a.nump.to_s : '')
      }
    when 'lugares'
      if self.lugar.count == 0
        'Nacional'
      else
        self.lugar.inject("") { |memo,l|
          (memo == "" ? "" : memo + "; ") + 
            l.departamento.nombre + 
            (l.municipio ? " / " + l.municipio.nombre : '')
        }
      end
    else
      presenta_gen(atr)
    end
  end


end
