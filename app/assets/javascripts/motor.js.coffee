# You can use CoffeeScript in this file: http://coffeescript.org/

#//= require sip/motor
#//= require heb412_gen/motor
#//= require jquery-ui/widgets/autocomplete
#//= require cocoon

@reconocer_decimal_locale_es_CO = (n) ->
  i = 0
  r = ""
  while i<n.length
    if n[i] == ','
      r = r + '.'
    if n[i] >= '0' && n[i] <='9'
      r = r + n[i]
    i++
  return parseFloat(r)
    
@recalcula_montopesos_localizado = (root) ->
  tm = $('#proyectofinanciero_tipomoneda_id').val()
  ml = $('#proyectofinanciero_monto_localizado').val()
  if tm == "1"  # PESO
    $('#proyectofinanciero_montopesos_localizado').val(ml)
  else if typeof ml != 'undefined' && typeof tm != 'undefined'
    tf = $('#proyectofinanciero_tasaformulacion_id option:selected').text() 
    m = reconocer_decimal_locale_es_CO(ml)
    debugger
    
  return


@cor1440_cinep_prepara_eventos_unicos = (root) ->
  sip_arregla_puntomontaje(root)
  $('#proyectofinanciero_tipomoneda_id').chosen().change( (e) ->
    sip_llena_select_con_AJAX($(this), 'proyectofinanciero_tasaformulacion_id', 'tasascambio', 'bustipomoneda_id', 'con Tasa de cambio', root, true, 'id', 'presenta_nombre')
  )
  $('#proyectofinanciero_monto_localizado').change( (e) ->
    recalcula_montopesos_localizado(root)
  )


  return

