# encoding: UTF-8

require 'jn316_gen/concerns/models/grupo'

module Sip
  class Grupo < ActiveRecord::Base
    include Jn316Gen::Concerns::Models::Grupo

    belongs_to :procesogh, class_name: '::Procesogh',
      foreign_key: "procesogh_id", validate: true

    scope :investigacion, -> () {
      where("cn LIKE 'Linea%' OR cn LIKE 'Area%'").order(:nombre)
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

    validate :subgrupos_son_arbol
    def subgrupos_son_arbol
      gp = rec_subgrupo_son_arbol(self, [id])
      if gp != []
        lc = gp.map { |lg| lg.join(" -> ") }
        errors.add(:subgrupo, "Problema(s) en rama(s): #{lc.join('; ')}")
      end
    end

    # Decide que las identificaciones de grupos en visitados no 
    # están en el subárbol que comienza en grupo.
    # Retorna lista de ciclos que encuentra o vació si no hay
    def rec_subgrupo_son_arbol(grupo, visitados)
      sub = grupo.subgrupo
      if sub.count > 0
        sids = sub.map(&:id)
        int = sids & visitados
        if (int != [])
          inom = int.map {|i| [Sip::Grupo.find(i).nombre]}
          return inom
        end
        sub.each do |g|
          gp = rec_subgrupo_son_arbol(g, visitados + sids)
          if  gp != []
            return gp.map { |sg| [grupo.nombre] + sg }
          end
        end
      end
      return []
    end

  end
end
