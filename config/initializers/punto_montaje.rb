Cor1440Cinep::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/')
Cor1440Cinep::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/') + 'assets'
