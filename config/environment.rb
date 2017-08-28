# encoding: UTF-8

require_relative 'application'

ActiveRecord::Base.pluralize_table_names=false

Encoding.default_external = Encoding::UTF_8

Encoding.default_internal = Encoding::UTF_8

# Initialize the Rails application.
Rails.application.initialize!
