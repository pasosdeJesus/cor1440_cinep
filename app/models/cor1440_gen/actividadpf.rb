# encoding: UTF-8

require 'cor1440_gen/concerns/models/actividadpf'

module Cor1440Gen
  class Actividadpf < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Actividadpf

    has_and_belongs_to_many :grupoexclusivo,
    class_name: 'Sip::Grupo',
      foreign_key: 'actividadpf_id',
      association_foreign_key: 'grupo_id',
      join_table: 'cor1440_gen_actividadpf_grupoexclusivo'

    has_many :productopf,
      class_name: '::Productopf',
      foreign_key: 'actividadpf_id'

  end
end
