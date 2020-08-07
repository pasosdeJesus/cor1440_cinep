class Ls < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha

  belongs_to :cobertura, class_name: '::Lscobertura', 
    foreign_key: 'cobertura_id'

  has_many :lsdep, dependent: :destroy

  validates :fecha, presence: true
  validates :descripcion, presence: true, uniqueness: { 
    message: 'No puede haber dos luchas con la misma descripción' }, 
    length: { maximum: 6000 }
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

  scope :filtro_departamentos, lambda { |d|
  
    joins(:lsdep).where('lsdep.departamento_id = ?', d)
  }


  scope :filtro_descripciones, lambda {|d|
    where("unaccent(ls.descripcion) ILIKE '%' || unaccent(?) || '%'", d)
  }

  def presenta_nombre
    "#{fecha} #{descripcion[0..49]}"
  end

  def presenta(atr)
    case atr
    when 'departamentos'
      r=''
      sep = ' '
      if lsdep.count == 0
        r << 'NACIONAL'
      else
        c = 1
        sep = ' '
        lsdep.each do |d|
          if lsdep.size > 1
            r << "#{sep}(#{c}) "
          end
          r << "#{d.departamento.nombre}"
          sep = "; "
          c += 1
        end
      end
      r
    when 'municipios'
      r=''
      sep = ' '
      if lsdep.count > 0
        c = 1
        sepd = ''
        lsdep.each do |d|
          rm = ''
          sepm = ' '
          d.lsmun.each do |m|
            rm << "#{sepm}#{m.municipio.nombre}"
            sepm = ' - '
          end
          if rm != ''
            if lsdep.size > 1
              r << "#{sepd}(#{c}) "
            end
            r << "#{rm}"
            sepd = '; '
          end
          c += 1
        end
      end
      r
    when 'fuentes'
      r=''
      if lsdep.count == 0
        r << fuente
      else
        c = 1
        sep = ' '
        lsdep.each do |d|
          if d.fuente
            if lsdep.size > 1
              r << "#{sep}(#{c}) "
            end
            r << "#{d.fuente}"
          end
          sep = '; '
          c += 1
        end
      end
      r
    when 'ffuentes'
      r=''
      if lsdep.count == 0 
        r << (ffuente.nil? ? '' : ffuente.to_s)
      else
        c = 1
        sep = ' '
        lsdep.each do |d|
          if d.ffuente
            if lsdep.size > 1
              r << "#{sep}(#{c}) "
            end
            r << "#{d.ffuente.to_s}"
            sep = '; '
          end
          c += 1
        end
      end
      r
    when 'ffuens_1'
      r=''
      if lsdep.count == 0
        r << (ffuen_1.nil? ? '' : ffuen_1.to_s)
      else
        c = 1
        sep = ' '
        lsdep.each do |d|
          if d.ffuen_1
            if lsdep.size > 1
              r << "#{sep}(#{c}) "
            end
            r << " #{d.ffuen_1.to_s}"
            sep = '; '
          end
          c += 1
        end
      end
      r
    when 'descripciones'
      r=''
      if lsdep.count == 0
        r << descripcion
      else
        c = 1
        sep = ' '
        lsdep.each do |d|
          if d.descripcion
            if lsdep.size > 1
              r << "#{sep}(#{c}) "
            end
            r << "#{d.descripcion}"
            sep = '; '
          end
          c += 1
        end
      end
      r
    else
      presenta_gen(atr)
    end
  end

end
