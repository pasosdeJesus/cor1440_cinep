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

@recalcula_aemergente_pesos_localizado = (campo, tasa) ->
  vc = $('#' + campo).val()
  if typeof vc != 'undefined' && vc != '' && typeof tasa != 'undefined' && tasa > 0
      vcp = reconocer_decimal_locale_es_CO(vc)*tasa
      vcpl = new Intl.NumberFormat('es-CO').format(vcp)
      $('#' + campo).attr('title', '$ ' + vcpl).tooltip('fixTitle').tooltip('show')

@establece_duracion = (obdur) ->
  $('#proyectofinanciero_duracion').val(obdur.duracion)

@recalcula_duracion = (root) ->
  datos = {
    fechainicio_localizada: $('#proyectofinanciero_fechainicio_localizada').val(),
    fechacierre_localizada: $('#proyectofinanciero_fechacierre_localizada').val()
  }
  if datos.fechainicio_localizada != '' && datos.fechacierre_localizada != ''
    sip_ajax_recibe_json(root, 'api/cor1440cinep/duracion',
      datos, establece_duracion)
  else
    $('#proyectofinanciero_duracion').val('')

@recalcula_montospesos_localizado = (root) ->
  tm = $('#proyectofinanciero_tipomoneda_id').val()
  ml = $('#proyectofinanciero_monto_localizado').val()
  if tm == "1"  # PESO
    $('#proyectofinanciero_montopesos_localizado').val(ml)
    $('#proyectofinanciero_presupuestototal_localizado').attr('data-original-title', $('#proyectofinanciero_presupuestototal_localizado').val())
  else if typeof ml != 'undefined' && typeof tm != 'undefined'
    tf2 = $('#proyectofinanciero_tasaformulacion_id option:selected').text().split(' ')
    if tf2.length != 2
      return
    tf = reconocer_decimal_locale_es_CO(tf2[1])
    m = reconocer_decimal_locale_es_CO(ml)
    mp = tf*m
    mpl = new Intl.NumberFormat('es-CO').format(mp)
    $('#proyectofinanciero_montopesos_localizado').val(mpl)

    recalcula_aemergente_pesos_localizado('proyectofinanciero_presupuestototal_localizado', tf)
    recalcula_aemergente_pesos_localizado('proyectofinanciero_aportecinep_localizado', tf)
    recalcula_aemergente_pesos_localizado('proyectofinanciero_aotrosfin_localizado', tf)
    
  return


@cor1440_gen_llena_medicion = (res) ->
  hid = res.hmindicadorpf_id
  $('[id$=_' + hid + '_dmed1]').val(res.dmed1)
  $('[id$=_' + hid + '_dmed2]').val(res.dmed2)
  $('[id$=_' + hid + '_dmed3]').val(res.dmed3)
  $('[id$=_' + hid + '_rind]').val(res.rind)
  meta = +$('[id$=_' + hid + '_meta]').val()
  if ( meta > 0)
    $('[id$=_' + hid + '_porcump]').val(res.rind*100/meta)


@cor1440_gen_calcula_pmindicador = (elem) ->
  root =  window
  r = $(elem).closest('tr')
  efinicio = r.find('[id$=finicio_localizada]')
  hid = efinicio.attr('id').replace(/.*_attributes_([0-9]*)_finicio_localizada/, '$1');
  datos = {
    finicio_localizada: efinicio.val()
    ffin_localizada: r.find('[id$=ffin_localizada]').val()
    indicadorpf_id: $(document).find('#mindicadorpf_indicadorpf_id').val()
    hmindicadorpf_id: hid
  }
  sip_ajax_recibe_json(root, 'api/cor1440cinep/mideindicador', 
    datos, cor1440_gen_llena_medicion)  
  return

@cor1440_cinep_prepara_eventos_unicos = (root) ->
  sip_arregla_puntomontaje(root)
  $('#proyectofinanciero_tipomoneda_id').chosen().change( (e) ->
    sip_llena_select_con_AJAX($(this), 'proyectofinanciero_tasaformulacion_id', 'tasascambio', 'bustipomoneda_id', 'con Tasa de cambio', root, true, 'id', 'presenta_nombre', recalcula_montospesos_localizado)
  )
  $('#proyectofinanciero_monto_localizado').change( (e) ->
    recalcula_montospesos_localizado(root)
  )
  $('#proyectofinanciero_presupuestototal_localizado').change( (e) ->
    recalcula_montospesos_localizado(root)
  )
  $('#proyectofinanciero_tasaformulacion_id').chosen().change( (e) ->
    recalcula_montospesos_localizado(root)
  )

  $('#proyectofinanciero_mesformulacion').change( (e) ->
    s = 2
    if $('#proyectofinanciero_mesformulacion').val() <= 6
      s = 1
    $('#proyectofinanciero_semestreformulacion').val(s)
  )

  $('#proyectofinanciero_fechainicio_localizada').change( (e) ->
    recalcula_duracion(root)
  )
  $('#proyectofinanciero_fechacierre_localizada').change( (e) ->
    recalcula_duracion(root)
  )
  $('#proyectofinanciero_tipomoneda_id').chosen().change( (e) ->
    sip_llena_select_con_AJAX($(this), 'proyectofinanciero_tasaformulacion_id', 'tasascambio', 'bustipomoneda_id', 'con Tasa de cambio', root, true, 'id', 'presenta_nombre', recalcula_montospesos_localizado)
  )

  $('#proyectofinanciero_estado').chosen().change( (e) ->
    if $(this).val() == 'E'
      $('.editable-entramite').removeAttr('readonly')
      $('.editable-entramite.chosen-select').off()
      $('.editable-entramite.chosen-select').on('chosen:updated', () ->
        $(this).removeAttr('disabled');
        $(this).removeAttr('readonly');
        $(this).data('chosen').search_field_disabled();
      );
      $('.editable-entramite.chosen-select').trigger('chosen:updated')
    else
      $('.editable-entramite').attr('readonly', 'readonly')
      $('.editable-entramite.chosen-select').off()
      $('.editable-entramite.chosen-select').on('chosen:updated', () ->
        $(this).attr('disabled', 'disabled');
        $(this).attr('readonly', 'readonly');
        $(this).data('chosen').search_field_disabled();
      );
      $('.editable-entramite.chosen-select').trigger('chosen:updated')

      #$('.editable-entramite').removeClass('chosen-select')
      #$('.editable-entramite').attr('readonly', 'readonly')
  )
  $('#proyectofinanciero_estado').trigger('change')

  # Si se agrega con cocoon un campo de seleccion que se espera con
  # chosen, usa chosen
  $(document).on('cocoon:after-insert', '', (e,inserted) ->
    inserted.find('select[class*=chosen-select]').chosen()
  )

  return

