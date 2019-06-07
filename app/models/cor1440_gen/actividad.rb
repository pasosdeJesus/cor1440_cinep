# encoding: UTF-8

require 'cor1440_gen/concerns/models/actividad'

module Cor1440Gen
  class Actividad < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Actividad
    include Sip::Localizacion

    belongs_to :contextoinv, class_name: '::Contextoinv', optional: true
    accepts_nested_attributes_for :contextoinv

    belongs_to :creadopor, class_name: '::Usuario',
      foreign_key: 'creadopor_id'

    belongs_to :departamento, class_name: 'Sip::Departamento', optional: true
    belongs_to :municipio, class_name: 'Sip::Municipio', optional: true
    belongs_to :nucleoconflicto, class_name: '::Nucleoconflicto', optional: true
    belongs_to :precedida, foreign_key: 'precedidapor',
      class_name: 'Cor1440Gen::Actividad', optional: true
    belongs_to :redactor, class_name: '::Redactor', optional: true
    

    has_many :actividad_grupo, dependent: :delete_all,
      class_name: '::ActividadGrupo', foreign_key: 'actividad_id'
    has_many :grupo, through: :actividad_grupo,
      class_name: 'Sip::Grupo'
    has_many :actividad_nucleoconflicto, dependent: :delete_all,
      class_name: '::ActividadNucleoconflicto', foreign_key: 'actividad_id'
    has_many :otronucleoconflicto, through: :actividad_nucleoconflicto,
      class_name: '::Nucleoconflicto'
    has_many :actividad_publicacion, dependent: :delete_all,
      class_name: '::ActividadPublicacion', foreign_key: 'actividad_id'
    has_many :publicacion, through: :actividad_publicacion,
      class_name: '::Publicacion'

    has_many :actividad_objetivopf, dependent: :delete_all,
      class_name: 'Cor1440Gen::ActividadObjetivopf', 
      foreign_key: 'actividad_id'
    has_many :objetivopf, through: :actividad_objetivopf,
      class_name: 'Cor1440Gen::Objetivopf'

    flotante_localizado :duracion

    attr_accessor :duracionhoras_localizado
    def duracionhoras_localizado
      r = 0
      if duracion
        if mduracion
          case mduracion
          when 'Minutos'
            r = duracion*10/60.0
            r = r.round / 10.0
          when 'Días'
            r = duracion * 8
          when 'Meses'
            r = duracion * 8 * 25
          else # Horas
            r = duracion 
          end
        end
      end
      r.a_decimal_localizado
    end
 
    attr_accessor :duraciondias_localizado
    def duraciondias_localizado
      r = 0
      if duracion && mduracion
        case mduracion
        when 'Minutos'
          r = duracion*10/(24*60.0)
          r = r.round / 10.0
        when 'Días'
          r = duracion * 10
          r = r.round / 10.0
        when 'Meses'
          r = duracion * 25
        else # Horas
          r = duracion * 10 / 24.0
          r = r.round / 10.0
        end
      end
      r.a_decimal_localizado
    end
    
    attr_accessor :fecha_terminacion_localizada
    def fecha_terminacion_localizada
      ft = ''
      if fecha && duracion && mduracion
        dias = 0
        case mduracion
        when 'Minutos'
          dias = duracion/(24.0*60.0)
        when 'Días'
          dias = duracion
        when 'Meses'
          dias = duracion * 25
        else # Horas
          dias = duracion / 24.0
        end
        ftd = fecha + dias
        ft = fecha_estandar_local ftd
      end
      return ft
    end

    validates :desarrollo, length: { maximum: 5000 }
    validates :resultado, length: { maximum: 5000 }
    validates :papel, length: { maximum: 5000 }
    validates :participantes, length: { maximum: 5000 }
    validates :lugar, length: { maximum: 5000 }
    validates :duracion, numericality: { 
      greater_than: 0,
      allow_nil: true 
    }

    validate :existe_precedidapor
    def existe_precedidapor
      if self.precedidapor &&
        Cor1440Gen::Actividad.find_by_id(self.precedidapor).nil?
        errors.add(:precedidapor, 
                   'Debe corresponder al número de la actividad que precede')
        return false
      end
    end

    validate :tot_participantes
    def tot_participantes
      if hombres && mujeres && sexo_onr && negros && indigenas && etnia_onr &&
        hombres+mujeres+sexo_onr != negros+indigenas+etnia_onr
        errors.add(:sexo_onr, 'La suma de participantes por genero debería ' +
                   'ser la misma de participantes por etnia')
      end
    end

    # Deshabilita validacion con oficina que proviene de
    # Cor1440Gen::Concerns::Models::Actividad
    def rol_usuario
    end

    def presenta(atr)
      case atr.to_s
      when 'actividadpf'
        self.actividadpf.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.titulo
        }
      when 'actorsocial'
        self.actorsocial.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + 
            (i.grupoper ? i.grupoper.nombre : i.id.to_s)
        }
      when 'cedula_responsable'
        self.responsable && self.responsable.persona ?  
          self.responsable.persona.numerodocumento : ''
      when 'centros_costo_compromisos'
        self.proyectofinanciero.inject("") { |memo, i|
          (memo == "" ? "" : memo + "; ") +
            i.centrocosto
        }
      when 'correo_responsable'
        self.responsable.email
      when 'departamento_s'
        self.departamento_id ? self.departamento.nombre : ''
      when 'fecha_hoy_localizada'
        fecha_estandar_local Date.today
      when 'fechanac_responsable_localizada'
        self.responsable.persona.presenta_fechanac
      when 'grupo'
        self.grupo.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.nombre
        }
      when 'municipio_s'
        self.municipio_id ? self.municipio.nombre : ''
      when 'objetivopf'
        self.objetivopf.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.objetivo
        }
      when 'proyectofinanciero'
        self.proyectofinanciero.inject("") { |memo, i|
          (memo == "" ? "" : memo + "; ") +
            (i.referenciacinep ? i.referenciacinep : '')
        }
      when 'publicacion'
        self.publicacion.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.nombre
        }
      when 'telefono_responsable'
        self.responsable && self.responsable.telefonos ?  
          self.responsable.telefonos : ''
      else
        presenta_actividad(atr)
      end
    end

    scope :filtro_actividadpf, lambda { |aid|
      where("id IN (SELECT actividad_id FROM cor1440_gen_actividad_actividadpf
        WHERE actividadpf_id = ?)", aid)
    }

    scope :filtro_actorsocial, lambda { |aid|
      where("id IN (SELECT actividad_id FROM cor1440_gen_actividad_actorsocial
        WHERE actorsocial_id = ?)", aid)
    }

    scope :filtro_creadopor, lambda { |uid|
      where(creadopor_id: uid)
    }

    scope :filtro_departamento, lambda { |did|
      where(departamento_id: did)
    }

    scope :filtro_grupo, lambda { |gid|
      joins(:actividad_grupo).where('actividad_grupo.grupo_id = ?', gid)
    }

    scope :filtro_municipio, lambda { |idm|
      where(municipio_id: idm)
    }

    scope :filtro_publicacion, lambda { |pid|
      where("id IN (SELECT actividad_id FROM actividad_publicacion
        WHERE publicacion_id = ?)", pid)
    }


  end
end
