# encoding: UTF-8

require 'cor1440_gen/concerns/models/validarpf'

module Cor1440Gen
  class Validarpf
    include Cor1440Gen::Concerns::Models::Validarpf

    attr_accessor :respgp_id

  end
end
