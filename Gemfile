source 'https://rubygems.org'

# Rails (internacionalización)
gem "rails", '~> 5.1' #2.0.rc1'
gem "rails-i18n"

# Postgresql
gem "pg"#, '~> 0.21'

gem 'puma'

# CSS
gem 'sass'

# Color en terminal
gem 'colorize'

# Generación de PDF
gem "prawn"
gem "prawnto_2",  :require => "prawnto"
gem "prawn-table"
# Plantilla ODT
gem "odf-report", git: 'https://github.com/vtamara/odf-report.git', branch: 'update-rubyzip'


gem 'rspreadsheet'
gem 'libxml-ruby'

# Cuadros de selección potenciados
gem 'chosen-rails'

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

gem 'redcarpet'


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

# Motor sal7711_gen
gem 'sal7711_gen', git: "https://github.com/pasosdeJesus/sal7711_gen.git"
#gem "sal7711_gen", path: '../sal7711_gen'

# Motor sal7711_web
gem 'sal7711_web', git: "https://github.com/pasosdeJesus/sal7711_web.git"
#gem "sal7711_web", path: '../sal7711_web'

# Publicaciones sobre motor Sal7711_ld
gem 'sal7711_ld', git: "https://github.com/pasosdeJesus/sal7711_ld.git"
#gem "sal7711_ld", path: '../sal7711_ld'


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
  gem 'simplecov'

  gem 'rails-controller-testing'

  # Acelera ejecutando en fondo.  https://github.com/jonleighton/spring
  gem "spring"
  gem 'connection_pool'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'poltergeist'
  gem 'minitest-rails-capybara'

  gem "spork"


  # Pruebas de regresión que no requieren javascript
  gem "capybara"
  
  # Para examinar errores, usar "rescue rspec" en lugar de "rspec"
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
end


group :production do
  # Para despliegue
  gem "unicorn"

  # Requerido por heroku para usar stdout como bitacora
  gem "rails_12factor"
end


