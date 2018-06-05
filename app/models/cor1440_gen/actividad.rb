# encoding: UTF-8

require 'cor1440_gen/concerns/models/actividad'

module Cor1440Gen
  class Actividad < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Actividad
    include Sip::Localizacion

    belongs_to :contextoinv, class_name: '::Contextoinv'
    accepts_nested_attributes_for :contextoinv
    
    belongs_to :departamento, class_name: 'Sip::Departamento'
    belongs_to :municipio, class_name: 'Sip::Municipio'
    belongs_to :redactor, class_name: '::Redactor'
    belongs_to :nucleoconflicto, class_name: '::Nucleoconflicto'
    
    belongs_to :creadopor, class_name: '::Usuario',
      foreign_key: 'creadopor_id'

    has_many :actividad_actor, dependent: :delete_all,
      class_name: '::ActividadActor', foreign_key: 'actividad_id'
    has_many :actor, through: :actividad_actor,
      class_name: '::Actor'
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


    validates :desarrollo, length: { maximum: 5000 }
    validates :resultado, length: { maximum: 5000 }
    validates :papel, length: { maximum: 5000 }
    validates :participantes, length: { maximum: 5000 }
    validates :lugar, length: { maximum: 5000 }
    validates :duracion, numericality: { only_integer: true, 
      greater_than: 0,
      allow_nil: true 
    }

    # Deshabilita validacion con oficina que proviene de
    # Cor1440Gen::Concerns::Models::Actividad
    def rol_usuario
    end

    def presenta(atr)
      case atr.to_s
      when 'grupo'
        self.grupo.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.nombre
        }
      when 'actividadpf'
        self.actividadpf.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.titulo
        }
      when 'objetivopf'
        self.objetivopf.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.objetivo
        }
      when 'actor'
        self.actor.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.nombre
        }
      when 'publicacion'
        self.publicacion.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.nombre
        }
      else
        presenta_gen(atr)
      end
    end

    scope :filtro_actividadpf, lambda { |aid|
      where("id IN (SELECT actividad_id FROM cor1440_gen_actividad_actividadpf
        WHERE actividadpf_id = ?)", aid)
    }

    scope :filtro_actor, lambda { |aid|
      where("id IN (SELECT actividad_id FROM actividad_actor 
        WHERE actor_id = ?)", aid)
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
