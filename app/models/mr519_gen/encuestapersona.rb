# encoding: UTF-8

require 'mr519_gen/concerns/models/encuestapersona'

module Mr519Gen
  class Encuestapersona < ActiveRecord::Base
    include Mr519Gen::Concerns::Models::Encuestapersona

    belongs_to :planencuesta, class_name: 'Mr519Gen::Planencuesta',
      foreign_key: :planencuesta_id

    belongs_to :sip_anexo, class_name: 'Sip::Anexo',
      foreign_key: :anexo_id, optional: true
    accepts_nested_attributes_for :sip_anexo,  reject_if: :all_blank
  end
end
