#!/usr/bin/env ruby
#Importador de archivo complementario de ACP
#Vladimir Támara Patiño. vtamara@pasosdeJesus.org. 2020.

require 'csv'
require 'byebug'

if ARGV[0].nil? || (ARGV[0] != "fuentes" && ARGV[0] != "lugares" && 
    ARGV[0] != "actores")
  puts "Falta primer parametro con lo que se convertirá fuentes lugares o actores"
  exit 1
end
que = ARGV[0]
puts "que=#{que}"

if ARGV[1].nil?
  puts "Falta segundo parametro con nombre de archivo CSV con datos de ACP"
  exit 1
end
nomarc = ARGV[1]
puts "nomarc=#{nomarc}"

if ARGV[2].nil?
  puts "Falta tercer parametro con nombre de archivo de errores por generar"
  exit 1
end
nomerr = ARGV[2]
puts "nomerr=#{nomerr}"


# Retorna verdadero si la operacion es exitosa
def importa_lugar(acp_id, fila, prob, adivcod, depalternos, munalternos)
  cod_depto = nil
  if !fila['COD_DPTO'] && fila['DPTO'] && fila['DPTO'] = 'NACIONAL'
    # Convención para luchas nacionales, no poner lugar
    return true
  end
  if !fila['COD_DPTO']
    prob << "Se esperaba valor en campo COD_DPTO. "
    return false
  end
  if !fila['DPTO']
    prob << "Se esperaba valor en campo DPTO. "
    return false
  end
  cod_depto = fila['COD_DPTO'].to_i
  if !adivcod[cod_depto][:departamento] 
    prob << "No se encontró departamento con código '#{cod_depto}'. "
    return false
  end
  dep = Sip::Departamento.where(id_pais: 170).
    where(id_deplocal: cod_depto).take
  adv = ''
  if !LssController::nombres_departamentos_equivalentes(cod_depto, 
      fila['DPTO'], adivcod, depalternos, adv)
    prob << "Se esperaba nombre como '#{dep.nombre}' en campo DPTO pero se encontró '#{fila['DPTO']}'. "
    return false
  end
  acplugar = nil
  if !fila['DANE'] && !fila['MUN']
    if ::Acplugar.where(acp_id: acp_id, departamento_id: dep.id, 
        municipio_id: nil).count > 0
      prob << "Ya hay un lugar con departamento #{cod_depto}"
      return false
    end
    acplugar = ::Acplugar.new(
      acp_id: acp_id,
      departamento_id: dep.id
    )
  elsif !fila['DANE']
    prob << "Se esperaba un valor en campo DANE. "
    return false
  else
    cod_mun = fila['DANE'].to_i
    if !adivcod[cod_depto][:mun][cod_mun]
      prob << "No se encontró municipio con código '#{cod_mun}'. "
      return false
    end
    munlocal = cod_mun % 1000 
    mun = Sip::Municipio.where(id_departamento: dep.id).
      where(id_munlocal: munlocal).take
    if !LssController.nombres_municipios_equivalentes(cod_depto,
        cod_mun, fila['MUN'], adivcod, munalternos, adv)
      prob << "Se esperaba nombre como '#{mun.nombre}' en campo MUN pero se encontró '#{fila['MUN']}'. "
      return false
    end
    if ::Acplugar.where(acp_id: acp_id, departamento_id: dep.id, 
        municipio_id: mun.id).count > 0
      prob << "Para ACP #{acp_id} ya hay un lugar con departamento #{cod_depto} y municipio #{cod_mun}"
      return false
    end
    acplugar = ::Acplugar.new(
      acp_id: acp_id,
      departamento_id: dep.id,
      municipio_id: mun.id
    )
  end
  if !acplugar.valid?
    prob << acplugar.errors.messages.values.join('. ')
    return false
  end
  acplugar.save!
  return true
end



#  Actor
def importa_actor(acp_id, fila, prob)
  if !fila['ACT_2']
    act2 = 'SIN INFORMACIÓN'
  else
    act2 = LssController::normaliza(fila['ACT_2'].strip)
  end
  if ::Acpactor2.where("unaccent(nombre) ILIKE unaccent(?)", act2).count != 1
    if act2 == 'no se especifica'
      act2 = 'SIN INFORMACIÓN'
    else
      prob << "No se encontró un actor de nivel 2 con nombre como #{act2}"
      return false
    end
  end
  bact2 = ::Acpactor2.where("unaccent(nombre) ILIKE unaccent(?)", act2).take
  if !fila['ACT_1']
    prob << "Falta valor en campo ACT_1"
    return false
  end
  act1 = LssController::normaliza(fila['ACT_1'].strip)
  if LssController::normaliza(bact2.actor1.nombre) != act1
    prob << "Se esperaba actor de nivel 1 de nombre #{bact2.actor1.nombre} " +
      "pero se encontró #{act1}"
    return false
  end
  cpapel = 1
  if fila['PAPEL']
    papel = LssController::normaliza(fila['PAPEL'].strip) 
    if ::Acppapel.where("unaccent(nombre) ILIKE unaccent(?)", papel).count != 1
      prob << "Se esperaba un papel en base con nombre como #{papel}"
      return false
    end
    cpapel = ::Acppapel.where("unaccent(nombre) ILIKE unaccent(?)", papel).
      take.id
  end
  cformap = 1
  if fila['FORMA_P']
    formap = LssController::normaliza(fila['FORMA_P'].strip) 
    if ::Acpformap.where("unaccent(nombre) ILIKE unaccent(?)", formap).
        count != 1
      prob << "Se esperaba un formap en base con nombre como #{formap}"
      return false
    end
    cformap = ::Acpformap.
      where("unaccent(nombre) ILIKE unaccent(?)", formap).take.id
  end
  nump = nil
  if fila['NUM_P'] 
    if fila['NUM_P'].to_i < 0
      prob << "Se esperaba un entero no negativo en NUM_P"
      return false
    else
      nump = fila['NUM_P'].to_i
    end
  end
  if ::Acpactor.where(
    acp_id: acp_id,
    actor3: fila['ACT_3'],
    actor2_id: bact2.id,
    papel_id: cpapel,
    formap_id: cformap,
    nump: nump).count > 0
    prob << "Ya hay un registro con los mismos datos para ACP #{acp_id}"
    return false
  end
  acpactor= ::Acpactor.new(
    acp_id: acp_id,
    actor3: fila['ACT_3'],
    actor2_id: bact2.id,
    papel_id: cpapel,
    formap_id: cformap,
    nump: nump
  )
  if !acpactor.valid?
    prob << acpactor.errors.messages.values.join('. ')
    return false
  end
  acpactor.save!
  return true
end


#  Fuente
def importa_fuente(acp_id, fila, prob)

  if !fila['FUENTE'] || fila['FUENTE'].strip.empty?
    prob << "Falta FUENTE"
    return false
  end
  fuente = fila['FUENTE'].strip
  pagina = fila['PAG'] ? fila['PAG'].strip : nil
  # Fecha fuente
  if !fila['F_FUENTE'] || fila['F_FUENTE'].strip.empty?
    prob << "Falta F_FUENTE. "
    return false
  end

  me = ''
  ffuente = Sip::FormatoFechaHelper.
    reconoce_adivinando_locale(fila['F_FUENTE'], me)
  if me != ''
    prob << "F_FUENTE: #{fila['F_FUENTE']}: #{me}. "
    return false
  end
  if ::Acpfuente.where(
    acp_id: acp_id,
    fuente: fuente,
    pagina: pagina,
    ffuente: ffuente).count > 0
    prob << "Ya hay un registro con los mismos datos para ACP #{acp_id}"
    return false
  end
  acpfuente= ::Acpfuente.new(
    acp_id: acp_id,
    fuente: fuente,
    pagina: pagina,
    ffuente: ffuente
  )
  if !acpfuente.valid?
    prob << acpfuente.errors.messages.values.join('. ')
    return false
  end
  acpfuente.save!
  return true
end

# Organiza estructuras para búsqueda más rápida en RAM
adiv = {}  # Arbol solo con nombres
adivcod = {} # Arbol con todo con llaves por código
bdep = {} # Departamento con llave por nombre
bmun = {} # Municipios con llave por código de departamento y nombre
Sip::Departamento.where(id_pais: 170).each do |d|
  dn = LssController::normaliza(d.nombre)
  if dn != 'exterior'
    coddep = d.id_deplocal
    bdep[dn] = coddep
    adiv[dn] = {}
    bmun[coddep] = {}
    adivcod[coddep] = { departamento: dn, mun: {} }
    d.municipio.each do |m|
      mn = LssController::normaliza(m.nombre)
      codmun = d.id_deplocal*1000 + m.id_munlocal
      bmun[d.id_deplocal][mn] = codmun
      adiv[dn][mn] = {}
      adivcod[d.id_deplocal][:mun][codmun] = { municipio: mn, cp: {}}
    end
  end
end

depalternos={
  11 => ['BOGOTÁ'],
  76 => ['VALLE'],
  88 => ['SAN ANDRÉS'],
}
munalternos={
  13468 => ['Mompós'],
}

csv = CSV.read(nomarc, headers: true, encoding: 'utf-8', 
               unconverted_fields: true)
puts "Leyendo #{csv.count} filas del archivo #{nomarc}"

encpos = {
  'fuentes': ['ID', 'FUENTE', 'PAG', 'F_FUENTE'],
  'lugares': ['ID', 'DPTO', 'COD_DPTO', 'MUN', 'DANE'],
  'actores': ['ID', 'ACT_3', 'ACT_2', 'ACT_1', 'PAPEL', 'FORMA_P', 'NUM_P']
}

porac = 0
ultporac = -1
numbien = 0
open(nomerr, 'w') do |ferr|

  encpos[que.to_sym].each do |c|
    if !csv.headers.include?(c)
      ferr<< "Falta columna indispensable #{c}\n"
      return false
    end
  end
end

CSV.open(nomerr, "wb") do |csverr|
  csverr << (csv.headers + ['PROBLEMAS'])
  (0..csv.count-1).each do |cfila|

    prob = ''  # Problemas en la línea 

    if !csv[cfila]['ID']
      prob << "Se esperaba valor para ID. "
    else
      csvid = csv[cfila]['ID'].to_i
      if ::Acp.where(id: csvid).count == 0
        prob << "No se encontro ACP con id #{csvid}"
      else
        if (que == 'lugares')
          numbien += importa_lugar(csvid, csv[cfila], prob, adivcod,
                                   depalternos, munalternos) ? 1 : 0
        elsif (que == 'fuentes')
          numbien += importa_fuente(csvid, csv[cfila], prob) ? 1 : 0
        elsif (que == 'actores')
          numbien += importa_actor(csvid, csv[cfila], prob ) ? 1 : 0
        end
      end
    end

    if prob != ''
      csverr << csv[cfila].to_h.values + ["Fila #{cfila+2}: #{prob}"]
    end
    porac = cfila*100/csv.count
    if porac > ultporac
      puts "#{porac}%"
      ultporac = porac
    end
  end
end

bp = csv.count > 0 ? numbien*1000/csv.count: 0
puts "Número de registros: #{csv.count}, Sin problemas: #{numbien} (#{bp.round/10.0}%)"

