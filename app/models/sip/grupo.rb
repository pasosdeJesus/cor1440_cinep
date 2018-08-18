# encoding: UTF-8

require 'jn316_gen/concerns/models/grupo'

module Sip
  class Grupo < ActiveRecord::Base
    include Jn316Gen::Concerns::Models::Grupo

    belongs_to :procesogh, class_name: '::Procesogh',
      foreign_key: "procesogh_id", validate: true

    scope :investigacion, -> () {
      where("cn LIKE 'Linea%'").order(:nombre)
    }

    has_many :regiongrupo, foreign_key: "grupo_id", validate: true, 
      class_name: '::Regiongrupo'

    has_many :actividad_grupo, dependent: :delete_all,
      class_name: '::ActividadGrupo', foreign_key: 'grupo_id'
    has_many :actividad, through: :actividad_grupo,
      class_name: 'Cor1440Gen::Actividad'

    has_many :actor_grupo, dependent: :delete_all,
      class_name: '::ActorGrupo', foreign_key: 'sip_grupo_id'
    has_many :actor, through: :actor_grupo,
      class_name: 'Cor1440Gen::Actor'

    has_many :grupo_proyectofinanciero, dependent: :delete_all,
      class_name: '::GrupoProyectofinanciero', foreign_key: 'grupo_id'

    has_many :grupo_subgrupo, dependent: :delete_all,
      class_name: '::GrupoSubgrupo', foreign_key: 'grupo_id', 
      validate: true
    has_many :subgrupo, through: :grupo_subgrupo,
      class_name: 'Sip::Grupo'

    has_many :grupo_supergrupo_inmediato, dependent: :delete_all,
      class_name: '::GrupoSubgrupo', foreign_key: 'subgrupo_id'
#    has_many :supergrupo_inmediato, through: :grupo_supergrupo_inmediato,
#      class_name: 'Sip::Grupo'

    validate :subgrupos_sin_ciclos
    # Decide que los subgrupos de un grupo no tengan ciclos
    # Según https://managementmania.com/en/organigram si fuese un
    # arbol sería suficiente para organigramas de organizaciones con 
    # estructura lineal.
    # Sin embargo ausencia de ciclos no equivale a árbol, así que
    # es más expresivo lo que permitimos
    def subgrupos_sin_ciclos
      gp = rec_subgrupo_sin_ciclos(self, id)
      if gp != []
        errors.add(:subgrupo, "Ciclo en rama(s): #{gp.join('->')}")
      end
    end

    # Decide que el grupo con identificacion buscando no esté en descendientes
    # de grupo ni que la grupo.id esté entre los descendientes
    # Retorna lista con ciclo o vació si no hay
    def rec_subgrupo_sin_ciclos(grupo, buscando)
      sub = grupo.subgrupo
      if sub.count > 0
        sids = sub.map(&:id)
        if sids.include?(buscando)
          return [grupo.nombre, Sip::Grupo.find(buscando).nombre]
        end
        if sids.include?(grupo.id)
          return [grupo.nombre, grupo.nombre]
        end
        sub.each do |g|
          gp = rec_subgrupo_sin_ciclos(g, buscando)
          if  gp != []
            return [grupo.nombre] + gp
          end
          if grupo.id != buscando
            gp = rec_subgrupo_sin_ciclos(g, grupo.id)
            if  gp != []
              return [grupo.nombre] + gp
            end
          end
        end
      end
      return []
    end

  end
end
