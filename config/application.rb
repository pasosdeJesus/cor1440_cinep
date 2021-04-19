require_relative 'boot'

require 'rails/all'

# Requiere gemas listas en el Gemfile, incluyendo las
# limitadas a :test, :development, o :production.
Bundler.require(*Rails.groups)

module Cor1440Cinep
  class Application < Rails::Application

    # config.load_defaults 6.0

    # Las configuraciones en config/environments/* tiene precedencia sobre
    # las especificadas aquí.
    # La configuración de la aplicación puede ir en archivos en
    # config/initializers
    # -- todos los archivos .rb en ese directorio se cargan automáticamente
    # tras cargar el entorno y cualquier gema en su aplicación.

    # Establece Time.zone por defecto en la zona especificada y hace que
    # Active Record auto-convierta a esta zona.
    # Ejecute "rake -D time" para ver una lista de tareas para encontrar
    # nombres de zonas. Por omisión es UTC.
    config.time_zone = 'America/Bogota'

    # El locale predeterminado es :en y todas las traducciones de
    # config/locales/*.rb,yml se cargan automaticamente
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    #config.railties_order = [:main_app, Sip::Engine, :all]

    config.colorize_logging = true

    config.active_record.schema_format = :sql

    config.hosts << ENV.fetch('CONFIG_HOSTS', '127.0.0.1')

    config.relative_url_root = ENV.fetch('RUTA_RELATIVA', '/')

    # sip
    config.x.formato_fecha = ENV.fetch('SIP_FORMATO_FECHA', 'dd/M/yyyy')
    # En el momento soporta 3 formatos: yyyy-mm-dd, dd-mm-yyyy y dd/M/yyyy

    # heb412
    config.x.heb412_ruta = Pathname(ENV.fetch(
      'HEB412_RUTA', Rails.root.join('public', 'heb412').to_s))

    # cor1440
    config.x.cor1440_permisos_por_oficina = 
      (ENV['COR1440_PERMISOS_POR_OFICINA'] && 
       ENV['COR1440_PERMISOS_POR_OFICINA'] != '')

    config.x.jn316_basegente = ENV.fetch('JN316_BASEGENTE', 
                                         'ou=gente,dc=cinep,dc=org,dc=co')
    config.x.jn316_basegrupos = ENV.fetch('JN316_BASEGRUPOS', 
                                          'ou=grupos,dc=cinep,dc=org,dc=co')
    config.x.jn316_admin = ENV.fetch('JN316_ADMIN', 
                                     'cn=admin,dc=cinep,dc=org,dc=co')
    config.x.jn316_servidor = ENV.fetch('JN316_SERVIDOR', 'apbd2.cinep.org.co')
    config.x.jn316_gidgenerico = ENV.fetch('JN316_GIDGENERICO', 500)
    config.x.jn316_puerto = ENV.fetch('JN316_PUERTO', 636)
    if ENV.fetch('JN316_TLS', 0) == 1
      config.x.jn316_opcon = {
        encryption: {
          method: :simple_tls,
          tls_options: OpenSSL::SSL::SSLContext::DEFAULT_PARAMS
        }
      }
    end

    if !ENV['CONSOLE_WHITELISTED_IPS'].nil?
      config.console.whitelisted_ips = ENV['CONSOLE_WHITELISTED_IPS']
    end
  end
end
