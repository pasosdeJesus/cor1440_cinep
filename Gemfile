source 'https://rubygems.org'


gem "bcrypt"

gem 'bootsnap'

gem "bootstrap-datepicker-rails"

gem "cancancan" # Roles

gem 'chosen-rails', # Cuadros de selección potenciados
  git: "https://github.com/vtamara/chosen-rails.git", branch: 'several-fixes'

gem "cocoon", # Formularios anidados (algunos con ajax)
  git: "https://github.com/vtamara/cocoon.git", 
  branch: 'new_id_with_ajax'

gem "coffee-rails" # CoffeeScript para recuersos .js.coffee y vistas

gem 'colorize' # Color en terminal

gem 'cor1440_gen',  # Motor de proyectos con marco lógico y actividades 
  git: "https://github.com/pasosdeJesus/cor1440_gen.git"
#gem "cor1440_gen", path: '../cor1440_gen'
#
gem "devise" # Autenticación 

gem "devise-i18n"

gem "font-awesome-rails"

gem 'heb412_gen',  # Motor de nube y llenado de plantillas
  git: "https://github.com/pasosdeJesus/heb412_gen.git"
#gem 'heb412_gen', path: '../heb412_gen'

gem "jbuilder" # API JSON facil. Ver: https://github.com/rails/jbuilder

gem "jquery-rails" # jquery como librería JavaScript

gem "jquery-ui-rails"

gem 'jn316_gen', 
  git: "https://github.com/pasosdeJesus/jn316_gen.git" # LDAP
#gem "jn316_gen", path: '../jn316_gen'

gem 'libxml-ruby'

gem 'mr519_gen', # Motor de gestion de formularios y encuestas
  git: "https://github.com/pasosdeJesus/mr519_gen.git"
#gem 'mr519_gen', path: '../mr519_gen'

gem 'odf-report',  # Genera ODT
  git: 'https://github.com/vtamara/odf-report.git', branch: 'rubyzip-1.3'

gem "paperclip" # Maneja adjuntos

gem "pg" # Postgresql

gem 'pick-a-color-rails' # Facilita elegir colores en tema

gem "prawn" # Generación de PDF

gem "prawnto_2",  :require => "prawnto"

gem "prawn-table"

gem 'puma'

gem "rails", '~> 6.0.0'

gem "rails-i18n"

gem 'redcarpet' # Reconoce y transforma Markdown

gem 'rubyzip', '>= 2.0'

gem 'sass' # CSS

gem 'sass-rails'

gem 'sal7711_gen', # Motor para archivo de prensa
  git: "https://github.com/pasosdeJesus/sal7711_gen.git"
#gem "sal7711_gen", path: '../sal7711_gen'

gem 'sal7711_ld', # Publicaciones sobre motor Sal7711_ld
  git: "https://github.com/pasosdeJesus/sal7711_ld.git"
#gem "sal7711_ld", path: '../sal7711_ld'

gem 'sal7711_web', # Motor para archivo de prensa web
  git: "https://github.com/pasosdeJesus/sal7711_web.git"
#gem "sal7711_web", path: '../sal7711_web'

gem "simple_form" # Formularios simples 

gem 'sip', # Motor generico
  git: "https://github.com/pasosdeJesus/sip.git"
#gem 'sip', path: '../sip'

gem 'tiny-color-rails'

gem "turbolinks", '>= 5' # Seguir enlaces más rápido. Ver: https://github.com/rails/turbolinks

gem "twitter-bootstrap-rails" # Ambiente de CSS

gem 'twitter_cldr' # ICU con CLDR

gem "tzinfo" # Zonas horarias

gem "uglifier" # Uglifier comprime recursos Javascript

gem 'webpacker', '~> 4.0'

gem "will_paginate" # Listados en páginas


group :development do

  gem 'erd'

  gem 'web-console'

end


group :test, :development, :ensayo do

  #gem 'byebug' #Depurar

end


group :test do

  gem 'capybara'

  gem 'rails-controller-testing'

  gem 'selenium-webdriver', '>=3.0'#, git: "https://github.com/vtamara/selenium.git", branch: 'patch-2'

  gem 'simplecov'

  gem 'spring'

end


group :production do

  gem 'unicorn' # Para despliegue

end


