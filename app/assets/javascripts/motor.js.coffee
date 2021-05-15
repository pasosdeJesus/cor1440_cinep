# You can use CoffeeScript in this file: http://coffeescript.org/

#//= require sip/motor
#//= require heb412_gen/motor
#//= require cocoon


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
  tf = sip_reconocer_decimal_locale_es_CO(tfl)
  sum = 0
  sump = 0
  $.each [['monto', 'montopesos'], ['aportecinep', 'aportecinepp'],
          ['aotrosfin', 'aporteotrosp'], ['saldo', 'saldop']], (i, c) ->
    vl = $('#proyectofinanciero_' + c[0] + '_localizado').val()
    v = sip_reconocer_decimal_locale_es_CO(vl)
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
  te = sip_reconocer_decimal_locale_es_CO(tel)
  sum = 0
  sump = 0
  $.each [['montoej', 'montoejp'], ['aportecinepej', 'aportecinepejp'],
          ['aporteotrosej', 'aporteotrosejp'], ['saldoej', 'saldoejp']], (i, c) ->
    vl = $('#proyectofinanciero_' + c[0] + '_localizado').val()
    v = sip_reconocer_decimal_locale_es_CO(vl)
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


#@cor1440_gen_llena_medicion = (root, res) ->
#  hid = res.hmindicadorpf_id
#  $('[id$=_' + hid + '_fecha_localizada]').val(res.fechaloc)
#  $('[id$=_' + hid + '_dmed1]').val(res.dmed1)
#  $('[id$=_' + hid + '_urlev1]').val(res.urlev1)
#  $('[id$=_' + hid + '_dmed2]').val(res.dmed2)
#  $('[id$=_' + hid + '_urlev2]').val(res.urlev2)
#  $('[id$=_' + hid + '_dmed3]').val(res.dmed3)
#  $('[id$=_' + hid + '_urlev3]').val(res.urlev3)
#  $('[id$=_' + hid + '_rind]').val(res.rind)
#  $('[id$=_' + hid + '_urlevrind]').val(res.urlevrind)
#  meta = +$('[id$=_' + hid + '_meta]').val()
#  if ( meta > 0)
#    $('[id$=_' + hid + '_porcump]').val(res.rind*100/meta)


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


@cor1440_cinep_actividad_actualiza_camposdinamicos = (root) ->
  ruta = document.location.pathname
  if ruta.length == 0
    return
  if ruta[0] == '/'
    ruta = ruta.substr(1)
  datos = {
    actividadpf_ids: $('#actividad_actividadpf_ids').val()
  }
  sip_envia_ajax_datos_ruta_y_pinta(ruta, datos,
    '#camposdinamicos', '#camposdinamicos')

 
@cor1440_cinep_actividad_actualiza_actividadpf =  (root) ->
  params = {
    pfl: $('#actividad_proyectofinanciero_ids').val(),
  }
  sip_llena_select_con_AJAX2('actividadespf', params, 
    'actividad_actividadpf_ids', 'con Actividades de compromiso', root,
    'id', 'nombre', cor1440_gen_actividad_actualiza_camposdinamicos2)


@cor1440_cinep_actividad_actualiza_objetivopf =  (root) ->
  params = {
    pfl: $('#actividad_proyectofinanciero_ids').val(),
  }
  sip_llena_select_con_AJAX2('objetivospf', params,
    'actividad_objetivopf_ids', 'con Objetivos de compromiso', root,
    'id', 'nombre', cor1440_cinep_actividad_actualiza_actividadpf)


@cor1440_cinep_actividad_actualiza_actoressociales = (root) ->
  params = {
    fecha: $('#actividad_fecha_localizada').val(),
    grupo_ids: $('#actividad_grupo_ids').val(),
    presenta_nombre: '1'
  }
  sip_llena_select_con_AJAX2('actoressociales', params, 
    'actividad_actorsocial_ids', 'con Actores', 
    root, 'id', 'presenta_nombre', 
    cor1440_gen_actividad_actualiza_camposdinamicos2)


@cor1440_cinep_actividad_actualiza_pf2 =  (root, pfpend = null) ->
  # Si hay listado de proyectos vigentes, limitar a esos
  if pfpend != null
    pfpendid = pfpend.map((e) => (e.id))
    pfex = []
    $('#actividad_proyectofinanciero tr').not(':hidden').each(() -> 
      idex = $(this).find('select[id$=proyectofinanciero_id]').val()
      if !(pfpendid.includes(+idex))
        $(this).remove()
    )
  # Actualizar campos dinámicos
  cor1440_cinep_actividad_actualiza_actoressociales(root)


@cor1440_cinep_actividad_actualiza_pf = (root) ->
  params = {
    fecha: $('#actividad_fecha_localizada').val(),
    grupo_ids: $('#actividad_grupo_ids').val()
  }
  sip_funcion_tras_AJAX('proyectosfinancieros', params, 
    cor1440_cinep_actividad_actualiza_pf2, 'con Compromisos', 
    root)
#  sip_llena_select_con_AJAX2('proyectosfinancieros', params, 
#    'actividad_proyectofinanciero_ids', 'con Compromisos', 
#    root, 'id', 'referenciacinep', 
#    cor1440_cinep_actividad_actualiza_actoressociales)

@valent_id = (id) ->
  if $('#' + id).val() == ""
    0
  else
    parseInt($('#' + id).val()) 

@cor1440_cinep_actividad_etnia_onr = (root) ->
  tg = valent_id('actividad_hombres') + valent_id('actividad_mujeres') + valent_id('actividad_sexo_onr')
  pe = valent_id('actividad_negros') + valent_id('actividad_indigenas')+ valent_id('actividad_mestizos') 
  fe = 0
  if tg > pe
    fe = tg - pe
  $('#actividad_etnia_onr').val(fe)

@cor1440_cinep_actividad_sectorsocial_onr = (root) ->
  tg = valent_id('actividad_hombres') + valent_id('actividad_mujeres') + valent_id('actividad_sexo_onr')
  pe = valent_id('actividad_campesinos') 
  fe = 0
  if tg > pe
    fe = tg - pe
  $('#actividad_etnia_onr').val(fe)

@cor1440_cinep_actividad_rangoedad_onr = (root) ->
  tg = valent_id('actividad_hombres') + valent_id('actividad_mujeres') + valent_id('actividad_sexo_onr')
  pe = valent_id('actividad_jovenes') 
  fe = 0
  if tg > pe
    fe = tg - pe
  $('#actividad_rangoedad_onr').val(fe)
  
@cor1440_cinep_actividad_totales_part = (root) ->
  tg = valent_id('actividad_hombres') + valent_id('actividad_mujeres') + valent_id('actividad_sexo_onr')
  te = valent_id('actividad_negros') + valent_id('actividad_indigenas') + valent_id('actividad_mestizos') + valent_id('actividad_etnia_onr')
  ts = valent_id('actividad_campesinos') + valent_id('actividad_sectorsocial_onr')
  tr = valent_id('actividad_jovenes') +  valent_id('actividad_rangoedad_onr')
  $('#tot_genero').html(tg)
  $('#tot_etnia').html(te)
  $('#tot_sectorsocial').html(ts)
  $('#tot_rangoedad').html(tr)

@cor1440_cinep_prepara_eventos_unicos = (root) ->
  sip_arregla_puntomontaje(root)

  # Actividad
  $('#actividad_fecha_localizada').datepicker({
    format: root.formato_fecha,
    autoclose: true,
    todayHighlight: true,
    language: 'es'
  }).on('changeDate', (ev) ->
    cor1440_cinep_actividad_actualiza_pf(root)
  )

  $('#actividad_fecha_localizada').on('change', (ev) ->
    cor1440_cinep_actividad_actualiza_pf(root)
  )

  $('#actividad_grupo_ids').chosen().change( (e) ->
    cor1440_cinep_actividad_actualiza_pf(root)
  )

#  $("#actividad_proyectofinanciero_ids").chosen().change( (e) ->
#    cor1440_cinep_actividad_actualiza_objetivopf(root)
#  )

  $('#actividad_actividadpf_ids').chosen().change( (e) ->
    cor1440_gen_actividad_actualiza_camposdinamicos2(root)
  )

  $('#actividad_mujeres').change( (e) ->
    cor1440_cinep_actividad_etnia_onr (root)
    cor1440_cinep_actividad_sectorsocial_onr (root)
    cor1440_cinep_actividad_rangoedad_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_hombres').change( (e) ->
    cor1440_cinep_actividad_etnia_onr (root)
    cor1440_cinep_actividad_sectorsocial_onr (root)
    cor1440_cinep_actividad_rangoedad_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_sexo_onr').change( (e) ->
    cor1440_cinep_actividad_etnia_onr (root)
    cor1440_cinep_actividad_sectorsocial_onr (root)
    cor1440_cinep_actividad_rangoedad_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_negros').change( (e) ->
    cor1440_cinep_actividad_etnia_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_indigenas').change( (e) ->
    cor1440_cinep_actividad_etnia_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_mestizos').change( (e) ->
    cor1440_cinep_actividad_etnia_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_etnia_onr').change( (e) ->
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_campesinos').change( (e) ->
    cor1440_cinep_actividad_sectorsocial_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_sectorsocial_onr').change( (e) ->
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_jovenes').change( (e) ->
    cor1440_cinep_actividad_rangoedad_onr (root)
    cor1440_cinep_actividad_totales_part (root)
  )
  $('#actividad_rangoedad_onr').change( (e) ->
    cor1440_cinep_actividad_totales_part (root)
  )
  # Efecto
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
  $(document).on('input', '#efecto_porcentajeprog', (e) ->
    porc = +$('#efecto_porcentajeprog').val();
    pv = {}
    i = 0
    $('#efecto_porcentajeprogop option').each((o) ->
      t = $(this).text()
      if t != ''
        t = +t.substr(0, t.indexOf('%'))
      pv[i] = [$(this).val(), t]
      i++
    )
    i = 0
    for llave, valor of pv
      if pv[llave][1] != '' && pv[llave][1] <= porc
        i = +llave
    if i >= 0
      $("#efecto_porcentajeprogop").val(pv[i][0]);
    else
      $("#efecto_porcentajeprogop").val('');
  )

  $(document).on('change', '#efecto_porcentajeprogop', (e) ->
    op = $(this).val()
    t = 0
    if op != ''
      t = $(this).find('[value=' + op + ']').text()
      if t != ''
        t = +t.substr(0, t.indexOf('%'))
    $('#efecto_porcentajeprog').val(t)
  )
 

  # Proyecto financiero - Compromiso Institucional
  #

  #$(document).on('click', 'a.enviarautomatico_y_repintapf[href^="#"]', (e) ->
  #  tabact = $('li.active[role=presentation] a').attr('href').substr(1)
  #  ltabf = $('li[role=presentation] a')
  #  ltab = []
  #  ltab.push(ltabf[i].hash.substr(1)) for i in [0 .. (ltabf.length-1)]
  #  d = ltab.filter (l) -> l != tabact

  #  sip_enviarautomatico_formulario_y_repinta($('form').attr('id'), 
  #    d, 'POST', false)
  #  return
  #)

  # En pestañas:
 
  # antes de mostrar una pestaña repintarla
  $('a.enviarautomatico_formulario_y_repintapf[data-toggle="tab"]').on('hide.bs.tab', (e) ->
    # e.target.hash.substr(1) # pestaña anterior
    idp = e.relatedTarget.hash.substr(1) # nueva pestaña
    sip_enviarautomatico_formulario_y_repinta($('form').attr('id'), 
      [idp], 'POST', false)
  ) 

  # Después de mostrar una pestaña repintar las demás que quedan escondidas 
  $('a.enviarautomatico_y_repintapf[data-toggle="tab"]').on('hidden.bs.tab', (e) ->
    # e.target.hash.substr(1) # pestaña anterior
    idn = e.relatedTarget.hash.substr(1) # nueva pestaña
    ltabf = $('li[role=presentation] a')
    ltab = []
    ltab.push(ltabf[i].hash.substr(1)) for i in [0 .. (ltabf.length-1)]
    d = ltab.filter (l) -> l != idn

    sip_enviarautomatico_formulario_y_repinta($('form').attr('id'), 
      d, 'POST', false)
  ) 
 
  $(document).on('change', '#proyectofinanciero_tipomoneda_id', (e) ->
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
  $(document).on('change', '#proyectofinanciero_tasa_localizado', (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )
  $(document).on('change', '#proyectofinanciero_tasaej_localizado', (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )

  $.each ['monto', 'aportecinep', 'aotrosfin', 'saldo', 'saldop',
    'montoej', 'aportecinepej', 'aporteotrosej', 'saldoej'], (i, c) ->
    $(document).on('change', '#proyectofinanciero_' + c + '_localizado', (e) ->
      cor1440_cinep_recalcula_montospesos_localizado(root)
    )

  $(document).on('change', '#proyectofinanciero_presupuestototal_localizado', (e) ->
  
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )
  $(document).on('change', '#proyectofinanciero_tasaformulacion_id', (e) ->
    cor1440_cinep_recalcula_montospesos_localizado(root)
  )

  $(document).on('change', '#proyectofinanciero_fechaformulacion_mes', (e) ->
    s = 2
    if $('#proyectofinanciero_fechaformulacion_mes').val() <= 6
      s = 1
    $('#proyectofinanciero_semestreformulacion').val(s)
  )

  $(document).on('change', '#proyectofinanciero_fechainicio_localizada', (e) ->
    recalcula_duracion(root)
  )
  $(document).on('change', '#proyectofinanciero_fechacierre_localizada', (e) ->
    recalcula_duracion(root)
  )

  $(document).on('change', '#proyectofinanciero_estado', (e) ->
    sip_enviarautomatico_formulario_y_repinta($('form').attr('id'), 
      ['recursoseconomicos'], 'POST', false)
  )

  $(document).on('change', '[id^=proyectofinanciero_proyectofinanciero_usuario_attributes][id$=usuario_id]', (e, inserted) ->
    id=$(this).attr('id')
     
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

  $(document).on('change', '#proyectofinanciero_grupo_ids', (e) ->
#  $('#proyectofinanciero_grupo_ids').chosen().change( (e) ->
    return
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


  # Usuario
 
  $(document).on('change', '#usuario_sip_grupo_ids', (e) ->
#  $('#usuario_sip_grupo_ids').chosen().change( (e) ->
    #usuario_gruposysupragrupos
    ids=$(this).val()
    if !Array.isArray(ids)
      ids = [ids]
    params = { ids: ids }
    actualiza_procesogh = (root) ->
      sip_cambia_cuadrotexto_AJAX('admin/grupos/procesosgh', params,
        'usuario_contrato_attributes_procesogh', 'Procesogh')
    sip_cambia_cuadrotexto_AJAX('admin/grupos/supragrupos', params,
        'usuario_gruposysupragrupos', 'Supragrupos', actualiza_procesogh)
      
  )

  $(document).on('change', '#usuario_profesion_id', (e) ->
#  $('#usuario_profesion_id').change( (e) ->
    idp=$(this).val()
    params = { id: idp }
    sip_cambia_cuadrotexto_AJAX('admin/profesiones/' + idp + '/areaestudios', 
      params, 'usuario_areaestudios', 'Area de estudios')
      
  )

  $(document).on('change', '#usuario_contrato_attributes_tipocontrato_id', (e) ->
#  $('#usuario_contrato_attributes_tipocontrato_id').change ( (e) ->
    idt=$(this).val()
    params = { id: idt }
    sip_cambia_cuadrotexto_AJAX('admin/tiposcontratos/' + idt + '/tiponomina', 
      params, 'usuario_contrato_attributes_tiponomina', 'Tipo de nomina')
  )


  # Si se agrega con cocoon un campo de seleccion que se espera con
  # chosen, usa chosen
  $(document).on('cocoon:after-insert', '', (e,inserted) ->
    inserted.find('select[class*=chosen-select]').chosen()
  )

  return

