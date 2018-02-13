# encoding: UTF-8

require 'cor1440_gen/concerns/models/indicadorpf'

module Cor1440Gen
  class Indicadorpf < ActiveRecord::Base
        include Cor1440Gen::Concerns::Models::Indicadorpf

        belongs_to :objetivopf, class_name: 'Cor1440Gen::Objetivopf', 
          foreign_key: 'objetivopf_id'
  end
end
