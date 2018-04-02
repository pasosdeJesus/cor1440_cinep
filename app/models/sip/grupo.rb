# encoding: UTF-8

require 'jn316_gen/concerns/models/grupo'

module Sip
  class Grupo < ActiveRecord::Base
    include Jn316Gen::Concerns::Models::Grupo

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

  end
end
