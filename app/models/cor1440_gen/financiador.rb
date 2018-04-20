# encoding: UTF-8

require 'cor1440_gen/concerns/models/financiador'

module Cor1440Gen
  class Financiador < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Financiador

    belongs_to :pais, class_name: 'Sip::Pais', foreign_key: 'pais_id'

    validates :domicilio, allow_blank: true, length: { maximum: 511}
    validates :nit, allow_blank: true, length: { maximum: 31}
    validates :razonsocial, allow_blank: true, length: { maximum: 511}
    validates :replegal, allow_blank: true, length: { maximum: 511}
    validates :web, allow_blank: true, length: { maximum: 511}
  end
end
