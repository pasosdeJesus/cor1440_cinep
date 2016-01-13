
require 'cor1440_cinep/version'

Sip.setup do |config|
      config.ruta_anexos = "/var/www/resbase/cor1440_cinep/"
      config.ruta_volcados = "/var/www/resbase/cor1440_cinep/"
      # En heroku los anexos son super-temporales
      if ENV["HEROKU_POSTGRESQL_MAUVE_URL"]
        config.ruta_anexos = "#{Rails.root}/tmp/"
      end
      config.titulo = "Cor1440 CINEP " + Cor1440Cinep::VERSION
end
