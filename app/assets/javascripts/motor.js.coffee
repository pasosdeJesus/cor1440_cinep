# You can use CoffeeScript in this file: http://coffeescript.org/

#//= require sip/motor
#//= require heb412_gen/motor
#//= require jquery-ui/widgets/autocomplete
#//= require cocoon

@enviar_ficha =  ->
  f=$('form')
  a=f.attr('action')
  $.post(a, f.serialize())


@cor1440_cinep_prepara_eventos_unicos = (root) ->

  # Envia formulario al presionar enlaces con clase fichacambia 
  # con más de 5 segundos de diferencia entre un click y el siguiente
  $(document).on('click', 'a.fichacambia_proyectofinanciero[href^="#"]', (e) ->
    e.preventDefault()
    tn = Date.now()
    d = -1
    if (root.tfichacambiapf) 
      d = (tn - root.tfichacambiapf)/1000
    if (d == -1 || d>5) 
      enviar_ficha()
      root.tfichacambiapf = Date.now()

    return
  )

  return

