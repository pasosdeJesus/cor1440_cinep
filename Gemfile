source 'https://rubygems.org'


gem 'actiontext', '>= 6.0.3.5'

gem 'apexcharts'

gem 'bcrypt'

gem 'bootsnap'

gem 'cancancan' # Roles

gem 'cocoon', # Formularios anidados (algunos con ajax)
  git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax'

gem 'coffee-rails' , '>= 5.0.0' # CoffeeScript para recuersos .js.coffee y vistas

gem 'csv'

gem 'devise' , '>= 4.7.3' # Autenticación 

gem 'devise-i18n', '>= 1.9.2'

gem 'execjs'

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'kt-paperclip',                 # Anexos
  git: 'https://github.com/kreeti/kt-paperclip.git'

gem 'libxml-ruby'

gem 'nokogiri', '>=1.11.1'

gem 'odf-report'  # Genera ODT

gem 'parslet'

gem 'pg' # Postgresql

gem 'prawn' # Generación de PDF

gem 'prawnto_2', '>= 0.3.1', :require => 'prawnto'

gem 'prawn-table'

gem 'rails', '~> 6.1'

gem 'rails-i18n', '>= 6.0.0'

gem 'react-rails', '>= 2.6.1'

gem 'redcarpet' # Reconoce y transforma Markdown

gem 'rspreadsheet'

gem 'rubyzip', '>= 2.0'

gem 'sassc-rails', '>= 2.1.2'

gem 'simple_form' , '>= 5.0.3' # Formularios simples 

gem 'twitter_cldr' # ICU con CLDR

gem 'tzinfo' # Zonas horarias

gem 'webpacker', '~> 6.0.0.rc.1'

gem 'will_paginate' # Listados en páginas


#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores) para que sobrecarguen
# bien vistas

gem 'sip', # Motor generico
  git: 'https://github.com/pasosdeJesus/sip.git', branch: :main
  #path: '../sip'

gem 'jn316_gen', # LDAP
  git: 'https://github.com/pasosdeJesus/jn316_gen.git', branch: :main
  #path: '../jn316_gen'

gem 'mr519_gen', # Motor de gestion de formularios y encuestas
  git: 'https://github.com/pasosdeJesus/mr519_gen.git', branch: :main
  #path: '../mr519_gen'

gem 'heb412_gen',  # Motor de nube y llenado de plantillas
  git: 'https://github.com/pasosdeJesus/heb412_gen.git', branch: :main
  #path: '../heb412_gen'

gem 'cor1440_gen',  # Motor de actividades y proyectos con marco lógico
  git: 'https://github.com/pasosdeJesus/cor1440_gen.git', branch: '296f4995f'
  #path: '../cor1440_gen'

group :development do
  gem 'erd'

  gem 'puma', '>= 4.3.2'

  gem 'web-console'
end


group :test, :development, :ensayo do
  #gem 'byebug' #Depurar

  gem 'dotenv-rails'

  gem 'colorize' # Color en terminal
end


group :test do

  gem 'capybara'

  gem 'rails-controller-testing', '>= 1.0.5'

  gem 'selenium-webdriver', '>=3.0'#, git: 'https://github.com/vtamara/selenium.git', branch: 'patch-2'

  gem 'simplecov', '<0.18' # Debido a https://github.com/codeclimate/test-reporter/issues/418

  gem 'spring'

end


group :production do

  gem 'pledge'

  gem 'unicorn' # Para despliegue

end


