# encoding: utf-8

require 'cor1440_gen/concerns/models/pmindicadorpf'

module Cor1440Gen
  class Pmindicadorpf < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Pmindicadorpf

    validates :urlev1, length: {maximum: 1024}
    validates :urlev2, length: {maximum: 1024}
    validates :urlev3, length: {maximum: 1024}
    #validates :urlevrind, length: {maximum: 1024}

  end
end
