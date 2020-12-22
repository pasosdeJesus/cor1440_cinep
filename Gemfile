source 'https://rubygems.org'


gem 'actiontext'

gem 'bcrypt'

gem 'bootsnap'

gem 'cancancan' # Roles

gem 'cocoon', # Formularios anidados (algunos con ajax)
  git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax'

gem 'coffee-rails' # CoffeeScript para recuersos .js.coffee y vistas

gem 'csv'

gem 'devise' # Autenticación 

gem 'devise-i18n'

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'libxml-ruby'

gem 'odf-report'  # Genera ODT

gem 'paperclip' # Maneja adjuntos

gem 'pg' # Postgresql

gem 'prawn' # Generación de PDF

gem 'prawnto_2',  :require => 'prawnto'

gem 'prawn-table'

gem 'puma', '>= 4.3.2'

gem 'rails', '~> 6.1.0'

gem 'rails-i18n'

gem 'react-rails'

gem 'redcarpet' # Reconoce y transforma Markdown

gem 'rspreadsheet'

gem 'rubyzip', '>= 2.0'

gem 'sassc-rails'

gem 'simple_form' # Formularios simples 

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'webpacker'

gem 'will_paginate' # Listados en páginas


#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores) para que sobrecarguen
# bien vistas

gem 'sip', # Motor generico
  git: 'https://github.com/pasosdeJesus/sip.git'
  #path: '../sip'

gem 'jn316_gen', # LDAP
  git: 'https://github.com/pasosdeJesus/jn316_gen.git'
  #path: '../jn316_gen'

gem 'mr519_gen', # Motor de gestion de formularios y encuestas
  git: 'https://github.com/pasosdeJesus/mr519_gen.git'
  #path: '../mr519_gen'

gem 'heb412_gen',  # Motor de nube y llenado de plantillas
  git: 'https://github.com/pasosdeJesus/heb412_gen.git'
  #path: '../heb412_gen'

gem 'sal7711_gen', # Motor para archivo de prensa
  git: 'https://github.com/pasosdeJesus/sal7711_gen.git'
  #path: '../sal7711_gen'

gem 'sal7711_ld', # Publicaciones sobre motor Sal7711_ld
  git: 'https://github.com/pasosdeJesus/sal7711_ld.git'
  #path: '../sal7711_ld'

gem 'sal7711_web', # Motor para archivo de prensa web
  git: 'https://github.com/pasosdeJesus/sal7711_web.git'
  #path: '../sal7711_web'

gem 'cor1440_gen',  # Motor de actividades y proyectos con marco lógico
  git: 'https://github.com/pasosdeJesus/cor1440_gen.git'
  #path: '../cor1440_gen'

group :development do

  gem 'erd'

  gem 'web-console'

end


group :test, :development, :ensayo do

  #gem 'byebug' #Depurar

  gem 'colorize' # Color en terminal

end


group :test do

  gem 'capybara'

  gem 'rails-controller-testing'

  gem 'selenium-webdriver', '>=3.0'#, git: 'https://github.com/vtamara/selenium.git', branch: 'patch-2'

  gem 'simplecov', '<0.18' # Debido a https://github.com/codeclimate/test-reporter/issues/418

  gem 'spring'

end


group :production do

  gem 'unicorn' # Para despliegue

end


