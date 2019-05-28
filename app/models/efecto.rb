# encoding: UTF-8

class Efecto < ActiveRecord::Base
	include Sip::Modelo
	include Sip::Localizacion

  belongs_to :indicadorpf, class_name: 'Cor1440Gen::Indicadorpf',
            foreign_key: "indicadorpf_id", validate: true
  belongs_to :registradopor, class_name: '::Usuario',
            foreign_key: "registradopor_id", validate: true, optional: true

  has_many :actorsocial_efecto, dependent: :delete_all
  has_many :actorsocial, through: :actorsocial_efecto

  campofecha_localizado :fecha
  campofecha_localizado :fecha20
  campofecha_localizado :fecha40
  campofecha_localizado :fecha60
  campofecha_localizado :fecha80
  campofecha_localizado :fecha100

  has_many :anexo_efecto, dependent: :delete_all,
    class_name: '::AnexoEfecto',
    foreign_key: 'efecto_id', validate: true
  accepts_nested_attributes_for :anexo_efecto, 
    allow_destroy: true, reject_if: :all_blank
  has_many :sip_anexo, :through => :anexo_efecto, 
    class_name: 'Sip::Anexo'
  accepts_nested_attributes_for :sip_anexo,  reject_if: :all_blank

  has_many :efecto_valorcampotind, dependent: :delete_all,
    class_name: '::EfectoValorcampotind',
    foreign_key: 'efecto_id', validate: true
  accepts_nested_attributes_for :efecto_valorcampotind,
    allow_destroy: true, reject_if: :all_blank
  has_many :valorcampotind, :through => :efecto_valorcampotind,
    class_name: '::Cor1440Gen::Valorcampotind'
  accepts_nested_attributes_for :valorcampotind,  reject_if: :all_blank

  validates :actorsocial_efecto, presence: true
  validates :fecha, presence: true
  validates :nombre, presence: true, length: { maximum: 500} 
  validates :descripcion, length: { maximum: 5000} 
  validates :indicadorpf_id, presence: true

  validates :porcentajeprog, numericality: { 
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }

  validate :tiene_anexo
  def tiene_anexo
    if !anexo_efecto.present?
      errors.add(:anexo_efecto, 
                 'Debe tener medios de verificación anexos')
    end
  end

  validate :fechaporc_en_orden
  def fechaporc_en_orden
    fechas = [fecha20, fecha40, fecha60, fecha80, fecha100]
    (0..4).each do |i|
      (i+1..4).each do |j|
        if fechas[i] && fechas[j]
          if fechas[j] < fechas[i]
            campo="fecha#{20*(j+1)}"
            errors.add(campo.to_sym, 
                       "Fecha del #{20*(j+1)}% debería ser posterior " +
                       "a la del #{20*(i+1)}%")
          else
            break
          end
        end
      end
    end
  end


  attr_accessor :linea
  def linea
    #byebug
    g=Cor1440Gen::GruposHelper.mis_grupos_sinus(registradopor)
    return '' if g.nil?
    g = g.where("nombre like 'Línea%'")
    if g.count == 1
      g.take.nombre
    else
      ''
    end
  end

  attr_accessor :porcentajeprogop
  def porcentajeprogop
    if porcentajeprog &&
        indicadorpf && indicadorpf.tipoindicador && 
        indicadorpf.tipoindicador.pprogtind && 
        indicadorpf.tipoindicador.pprogtind.length > 0 then
      p = indicadorpf.tipoindicador.pprogtind.order(:porcentaje)
      i = 0
      while(i < p.length &&
          (p[i].porcentaje.nil? || p[i].porcentaje <= porcentajeprog)) do
        i += 1
      end
      if i >= 1 then
        return  p[i - 1].id
      end
    end
    return nil
  end

  scope :filtro_actorsocial_id, lambda { |a|
    where('actorsocial_id = ?', a)
  }

  scope :filtro_fechaini, lambda { |f|
    where('fecha >= ?', f)
  }

  scope :filtro_fechafin, lambda { |f|
    where('fecha <= ?', f)
  }

  scope :filtro_indicadorpf_id, lambda { |i|
    where('indicadorpf_id = ?', i)
  }

  scope :filtro_nombre, lambda {|n|
        where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", n)
  } 
 
  scope :filtro_registradopor_id, lambda { |r|
    where('registradopor_id = ?', r)
  }
 
  def presenta(atr)
    case atr
    when 'indicadorpf_id'
      if indicadorpf_id
        indicadorpf.numero
      else
        ''
      end
    else
      presenta_gen(atr)
    end
  end 

end
