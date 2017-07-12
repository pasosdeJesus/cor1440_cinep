source 'https://rubygems.org'

# Rails (internacionalización)
gem "rails", '~> 5.1.0'
gem "rails-i18n"

#gem 'net-ldap'

# Color en terminal
gem 'colorize'

gem 'puma'

# CSS
gem 'sass'

# Cuadros de selección potenciados
gem 'chosen-rails'

gem 'rspreadsheet'
gem 'libxml-ruby'

# Generación de PDF
gem "prawn"
gem "prawnto_2",  :require => "prawnto"
gem "prawn-table"

# Plantilla ODT
gem "odf-report"

# Postgresql
gem "pg"

# API JSON facil. Ver: https://github.com/rails/jbuilder
gem "jbuilder"

# Uglifier comprime recursos Javascript
gem "uglifier"

# CoffeeScript para recuersos .js.coffee y vistas
gem "coffee-rails"

# jquery como librería JavaScript
gem "jquery-rails"

gem "jquery-ui-rails"

# Seguir enlaces más rápido. Ver: https://github.com/rails/turbolinks
gem "turbolinks"

# Ambiente de CSS
gem "twitter-bootstrap-rails"
gem "font-awesome-rails"
gem "bootstrap-datepicker-rails"

# Formularios simples 
gem "simple_form"

# Formularios anidados (algunos con ajax)
gem "cocoon", git: "https://github.com/vtamara/cocoon.git"

# Autenticación y roles
gem "devise"
gem "devise-i18n"
gem "cancancan"
gem "bcrypt"

# Listados en páginas
gem "will_paginate"

# ICU con CLDR
gem 'twitter_cldr'

# Maneja adjuntos
gem "paperclip"

# Zonas horarias
gem "tzinfo"
gem "tzinfo-data"

# Motor generico
gem 'sip', git: "https://github.com/pasosdeJesus/sip.git"
#gem 'sip', path: '../sip'

# Motor heb412_gen
gem 'heb412_gen', git: "https://github.com/pasosdeJesus/heb412_gen.git"
#gem 'heb412_gen', path: '../heb412_gen'

# Motor Cor1440_gen
gem 'cor1440_gen', git: "https://github.com/pasosdeJesus/cor1440_gen.git"
#gem "cor1440_gen", path: '../cor1440_gen'


# Motor Jn316_gen
gem 'jn316_gen', git: "https://github.com/pasosdeJesus/jn316_gen.git"
#gem "jn316_gen", path: '../jn316_gen'

# Los siguientes son para desarrollo o para pruebas con generadores
group :development do
  # Consola irb en páginas con excepciones o usando <%= console %> en vistas
  gem 'web-console'

end

group :test, :development, :ensayo do
  # Depurar
  #gem 'byebug'
end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do
  # Acelera ejecutando en fondo.  https://github.com/jonleighton/spring
  gem "spring"
  
  gem "spork"

  gem 'minitest'
  gem 'minitest-rails'
  gem 'turn', :require => false

  # https://www.relishapp.com/womply/rails-style-guide/docs/developing-rails-applications/bundler
  # Lanza programas para examinar resultados
  gem "launchy"

  gem 'rails-controller-testing'

  # Pruebas de regresión que no requieren javascript
  gem "capybara"
  
  gem 'simplecov'

  # Para examinar errores, usar "rescue rspec" en lugar de "rspec"
  gem 'pry-rails'
  gem 'pry-byebug'
end


group :production do
  # Para despliegue
  gem "unicorn"

  # Requerido por heroku para usar stdout como bitacora
  gem "rails_12factor"
end


