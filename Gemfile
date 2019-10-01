source 'https://rubygems.org'

# Rails (internacionalización)
gem "rails", '~> 6.0.0'

gem "rails-i18n"

gem 'bootsnap'

#gem 'trix-rails', require: 'trix'

# Postgresql
gem "pg"

gem 'puma'

# CSS
gem 'sass'
gem 'sass-rails'

gem 'webpacker', '~> 4.0'

# Color en terminal
gem 'colorize'

# Generación de PDF
gem "prawn"
gem "prawnto_2",  :require => "prawnto"
gem "prawn-table"

gem 'rubyzip', '>= 2.0'

# Genera ODT
gem 'odf-report', git: 'https://github.com/vtamara/odf-report.git', branch: 'rubyzip-1.3'

# Genera ODS
gem 'libxml-ruby'
gem 'rspreadsheet'

# Cuadros de selección potenciados
gem 'chosen-rails', git: "https://github.com/vtamara/chosen-rails.git", branch: 'several-fixes'

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
gem "turbolinks", '~> 5'

# Ambiente de CSS
gem "twitter-bootstrap-rails"
gem "font-awesome-rails"
gem "bootstrap-datepicker-rails"

# Facilita elegir colores en tema
gem 'pick-a-color-rails'
gem 'tiny-color-rails'

# Formularios simples 
gem "simple_form"

# Formularios anidados (algunos con ajax)
gem "cocoon", git: "https://github.com/vtamara/cocoon.git", 
  branch: 'new_id_with_ajax'


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

# Reconoce y transforma Markdown
gem 'redcarpet'


# Motor generico
gem 'sip', git: "https://github.com/pasosdeJesus/sip.git"
#gem 'sip', path: '../sip'

# Motor de nube y llenado de plantillas
gem 'heb412_gen', git: "https://github.com/pasosdeJesus/heb412_gen.git"
#gem 'heb412_gen', path: '../heb412_gen'

# Motor de gestion de formularios y encuestas
gem 'mr519_gen', git: "https://github.com/pasosdeJesus/mr519_gen.git"
#gem 'mr519_gen', path: '../mr519_gen'

# Motor para autenticacion LDAP
gem 'jn316_gen', git: "https://github.com/pasosdeJesus/jn316_gen.git"
#gem "jn316_gen", path: '../jn316_gen'

# Motor de proyectos con marco lógico y actividades 
gem 'cor1440_gen', git: "https://github.com/pasosdeJesus/cor1440_gen.git"
#gem "cor1440_gen", path: '../cor1440_gen'

# Motor para archivo de prensa
gem 'sal7711_gen', git: "https://github.com/pasosdeJesus/sal7711_gen.git"
#gem "sal7711_gen", path: '../sal7711_gen'

# Motor para archivo de prensa web
gem 'sal7711_web', git: "https://github.com/pasosdeJesus/sal7711_web.git"
#gem "sal7711_web", path: '../sal7711_web'

# Publicaciones sobre motor Sal7711_ld
gem 'sal7711_ld', git: "https://github.com/pasosdeJesus/sal7711_ld.git"
#gem "sal7711_ld", path: '../sal7711_ld'


# Los siguientes son para desarrollo o para pruebas con generadores
group :development do
  # Consola irb en páginas con excepciones o usando <%= console %> en vistas
  gem 'web-console'

  gem 'erd'
end

group :test, :development, :ensayo do
  #Depurar
  #gem 'byebug'
end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do
  gem 'capybara'

  gem 'rails-controller-testing'

  gem 'simplecov'

  gem 'spring'

  gem 'selenium-webdriver', '>=3.0', git: "https://github.com/vtamara/selenium.git", branch: 'patch-2'
end


group :production do
  # Para despliegue
  gem 'unicorn'
end


