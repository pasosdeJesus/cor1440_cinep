# encoding: UTF-8

require 'mr519_gen/concerns/models/encuestapersona'

module Mr519Gen
  class Encuestapersona < ActiveRecord::Base
    include Mr519Gen::Concerns::Models::Encuestapersona

    belongs_to :planencuesta, class_name: '::Planencuesta',
      foreign_key: :planencuesta_id

  end
end
