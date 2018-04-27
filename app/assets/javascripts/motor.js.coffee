# You can use CoffeeScript in this file: http://coffeescript.org/

#//= require sip/motor
#//= require heb412_gen/motor
#//= require jquery-ui/widgets/autocomplete
#//= require cocoon


@reconocer_decimal_locale_es_CO = (n) ->
  if n == ""
    return 0
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

@establece_duracion = (root, obdur) ->
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

@cor1440_cinep_recalcula_montospesos_localizado = (root) ->
  tfl = $('#proyectofinanciero_tasa_localizado').val()
  tf = reconocer_decimal_locale_es_CO(tfl)
  sum = 0
  sump = 0
  $.each [['monto', 'montopesos'], ['aportecinep', 'aportecinepp'],
          ['aotrosfin', 'aporteotrosp'], ['saldo', 'saldop']], (i, c) ->
    vl = $('#proyectofinanciero_' + c[0] + '_localizado').val()
    v = reconocer_decimal_locale_es_CO(vl)
    sum += v
    vp = v * tf 
    vpl = new Intl.NumberFormat('es-CO').format(vp)
    $('#proyectofinanciero_' + c[1] + '_localizado').val(vpl)
    sump += vp

  suml = new Intl.NumberFormat('es-CO').format(sum)
  sumpl = new Intl.NumberFormat('es-CO').format(sump)
  $('#proyectofinanciero_presupuestototal_localizado').val(suml)
  $('#proyectofinanciero_presupuestototalp_localizado').val(sumpl)

  # Repetimos para datos en ejecucion
  tel = $('#proyectofinanciero_tasaej_localizado').val()
  te = reconocer_decimal_locale_es_CO(tel)
  sum = 0
  sump = 0
  $.each [['montoej', 'montoejp'], ['aportecinepej', 'aportecinepejp'],
          ['aporteotrosej', 'aporteotrosejp'], ['saldoej', 'saldoejp']], (i, c) ->
    vl = $('#proyectofinanciero_' + c[0] + '_localizado').val()
    v = reconocer_decimal_locale_es_CO(vl)
    sum += v
    vp = v * te
    vpl = new Intl.NumberFormat('es-CO').format(vp)
    $('#proyectofinanciero_' + c[1] + '_localizado').val(vpl)
    sump += vp

  suml = new Intl.NumberFormat('es-CO').format(sum)
  sumpl = new Intl.NumberFormat('es-CO').format(sump)
  $('#proyectofinanciero_presupuestototalej_localizado').val(suml)
  $('#proyectofinanciero_presupuestototalejp_localizado').val(sumpl)


  return


@cor1440_gen_llena_medicion = (root, res) ->
  hid = res.hmindicadorpf_id
  $('[id$=_' + hid + '_fecha_localizada]').val(res.fechaloc)
  $('[id$=_' + hid + '_dmed1]').val(res.dmed1)
  $('[id$=_' + hid + '_dmed2]').val(res.dmed2)
  $('[id$=_' + hid + '_dmed3]').val(res.dmed3)
  $('[id$=_' + hid + '_rind]').val(res.rind)
  meta = +$('[id$=_' + hid + '_meta]').val()
  if ( meta > 0)
    $('[id$=_' + hid + '_porcump]').val(res.rind*100/meta)


@cor1440_gen_calcula_pmindicador = (elem, event) ->
  event.stopPropagation() 
  event.preventDefault() 
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

@cor1440_cinep_cambia_tipomoneda = (root, res) ->
  if res.length > 0
    t = res[0]['presenta_nombre'].split(' ')[1]
  else 
    t = 0
  $('#proyectofinanciero_tasa_localizado').val(t)
  if $('#proyectofinanciero_tasaej_localizado').val() == ''
    $('#proyectofinanciero_tasaej_localizado').val(t)
  cor1440_cinep_recalcula_montospesos_localizado(root)

@cor1440_cinep_prepara_eventos_unicos = (root) ->
  sip_arregla_puntomontaje(root)
  $('#proyectofinanciero_tipomoneda_id').change( (e) ->
      val = $(this).val()
      if val == "1"  # PESO
        $('#proyectofinanciero_tasa_localizado').val(1)
        $('#proyectofinanciero_tasaej_localizado').val(1)
        cor1440_cinep_recalcula_montospesos_localizado(root)
      else
        param = {}
        param['bustipomoneda_id'] = val
        param['presenta_nombre'] = 1
        param['aniomax'] = $('#proyectofinanciero_fechaformulacion_anio').val()
        param['mesmax'] = $('#proyectofinanciero_fechaformulacion_mes').val()
        param = {filtro: param}
        sip_ajax_recibe_json(root, 'tasascambio', param, 
          cor1440_cinep_cambia_tipomoneda)
  )
  $('#proyectofinanciero_tasa_localizado').change( (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )
  $('#proyectofinanciero_tasaej_localizado').change( (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )

  $.each ['monto', 'aportecinep', 'aotrosfin', 'saldo', 'saldop',
    'montoej', 'aportecinepej', 'aporteotrosej', 'saldoej'], (i, c) ->
    $('#proyectofinanciero_' + c + '_localizado').change( (e) ->
      cor1440_cinep_recalcula_montospesos_localizado(root)
    )

  $('#proyectofinanciero_monto_localizado').change( (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )
  $('#proyectofinanciero_presupuestototal_localizado').change( (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )
  $('#proyectofinanciero_tasaformulacion_id').chosen().change( (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )

  $('#proyectofinanciero_fechaformulacion_mes').change( (e) ->
    s = 2
    if $('#proyectofinanciero_fechaformulacion_mes').val() <= 6
      s = 1
    $('#proyectofinanciero_semestreformulacion').val(s)
  )

  $('#proyectofinanciero_fechainicio_localizada').change( (e) ->
    recalcula_duracion(root)
  )
  $('#proyectofinanciero_fechacierre_localizada').change( (e) ->
    recalcula_duracion(root)
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
    if $(this).val() == 'J'
      $('.editable-enejecucion').removeAttr('readonly')
      $('.editable-enejecucion.chosen-select').off()
      $('.editable-enejecucion.chosen-select').on('chosen:updated', () ->
        $(this).removeAttr('disabled');
        $(this).removeAttr('readonly');
        $(this).data('chosen').search_field_disabled();
      );
      $('.editable-enejecucion.chosen-select').trigger('chosen:updated')
    else
      $('.editable-enejecucion').attr('readonly', 'readonly')
      $('.editable-enejecucion.chosen-select').off()
      $('.editable-enejecucion.chosen-select').on('chosen:updated', () ->
        $(this).attr('disabled', 'disabled');
        $(this).attr('readonly', 'readonly');
        $(this).data('chosen').search_field_disabled();
      );
      $('.editable-enejecucion.chosen-select').trigger('chosen:updated')
  )

  $('#proyectofinanciero_estado').trigger('change')

  $('#actividad_actividadpf_ids').chosen().change( (e) ->
    ruta = document.location.pathname
    if ruta.length == 0
      return
    if ruta[0] == '/'
      ruta = ruta.substr(1)
    datos = {
      actividadpf_ids: $(this).val()
    }
    sip_envia_ajax_datos_ruta_y_pinta(ruta, datos,
      '#camposdinamicos', '#camposdinamicos')
  )

  $(document).on('change', '#efecto_indicadorpf_id', (e) ->
    ruta = document.location.pathname
    if ruta.length == 0
      return
    if ruta[0] == '/'
      ruta = ruta.substr(1)
    datos = {
      indicadorpf_id: $(this).val()
    }
    sip_envia_ajax_datos_ruta_y_pinta(ruta, datos,
      '#camposdinamicos', '#camposdinamicos')

  )

  $('#proyectofinanciero_grupo_ids').chosen().change( (e) ->
    sip_arregla_puntomontaje(root)
    t = Date.now()
    d = -1
    if (root.change_proyectofinanciero_grupo_ids_t)
      d = (t - root.change_proyectofinanciero_grupo_ids_t)/1000
    root.change_proyectofinanciero_grupo_ids_t = t
    # NO se permite mas de un envio en 2 segundos 
    if (d > 0 && d <= 2)
      return
  
    l = $(this).val()
    param = {filtro: {
      ids: l
    }}
    x = $.getJSON(root.puntomontaje + 'admin/grupos/coordinadores.json', param)
    x.done((data) ->
      if data.length > 0
        data.forEach( (c) ->
           
        )
    )
    x.error((m1, m2, m3) -> 
      alert(
        'Problema al buscar coordinadores. ' + param + ' ' + m1 + ' ' + m2 + ' ' + m3)
      )

    # Obtener coordinador de la línea y si falta agregarlo como
    # coordinador 

  )

  # Cambio a persona en tabla cargos
  $(document).on('change', '[id^=proyectofinanciero_proyectofinanciero_usuario_attributes][id$=usuario_id]', (e, inserted) ->
    return
    id=$(this).attr('id')
    elige_perfilprofesional = () ->
      if vp == '' || vp == '1'
        sip_elige_opcion_select_con_AJAX($(this),  'usuarios',
          aid_perfilprofesional, 'perfilprofesional_id', 'Perfil profesional',
          elige_perfilprofesional)
     
    aid_tipocontrato= id.replace('usuario_id', 'tipocontrato_id')
    aid_perfilprofesional = id.replace('usuario_id', 'perfilprofesional_id')
   
    lid = [] 
    lcampo = [] 
    vp = $('#' + aid_perfilprofesional).val() 
    if vp == '' || vp == '1'
      lid.push([aid_perfilprofesional, 'perfilprofesional_id'])
    vtn = $('#' + aid_tipocontrato).val() 
    if vtn == '' || vtn == '1'
      lid.push([aid_tipocontrato, 'tipocontrato_id'])
    if lid.length > 0
      sip_elige_opcion_select_con_AJAX($(this),  'usuarios', 
        lid, 'Datos de usuario')
  )

  # Si se agrega con cocoon un campo de seleccion que se espera con
  # chosen, usa chosen
  $(document).on('cocoon:after-insert', '', (e,inserted) ->
    inserted.find('select[class*=chosen-select]').chosen()
  )

  return

