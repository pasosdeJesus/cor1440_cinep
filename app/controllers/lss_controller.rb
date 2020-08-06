# encoding: UTF-8

class LssController < Heb412Gen::ModelosController
  helper ::ApplicationHelper

  before_action :set_ls, 
    only: [:show, :edit, :update, :destroy], except: [:verificacsv]
  load_and_authorize_resource class: ::Ls

  #requiere 'csv'

  def clase
    "::Ls"
  end

  def atributos_index
    [ "id", 
      "fecha_localizada",
      "mes_inexacto",
      "cobertura_id",
      "convocante_id",
      "orgconvocante",
      "dirig1",
      "dirig2",
      "dirig3",
      "actor",
      "partici1",
      "partici2",
      "partici3",
      "tipo_lucha",
      #"accion",
      "motivopl",
      "motivopp",
      "motivo2",
      "motivo3",
      "motivo4",
      "motivo5",
      "adversario",
      "entidad1",
      "entidad2",
      "entidad3",
      "departamentos",
      "municipios",
      "fuentes",
      "ffuentes",
      "ffuens_1",
      "descripciones",
      "arch_imp",
      "filaini_imp",
      "filafin_imp"
    ] 
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, descripcion: :asc)
  end

  def new_modelo_path(o)
    return new_ls_path()
  end

  def genclase
    return 'F'
  end

  def verificacsv
    authorize! :update, ::Ls
    if params && params[:filtro] && params[:filtro][:archivo]
      nombre = Heb412Gen::ApplicationHelper.
        sanea_nombre(params[:filtro][:archivo].original_filename)

      rr1 = Rails.application.config.x.heb412_ruta.join("./generados/")
      rr2 = rr1.join(nombre)
      logger.debug "~ rr2=#{rr2.to_s}"
      io = params[:filtro][:archivo]
      File.open(rr2, 'wb') do |file|
        file.write(io.read)
      end

      errarch = File.join(
        '/generados/', File.basename(nombre, '.csv').to_s + 
        "-err-" + DateTime.now.strftime('%Y%m%d%H%M%S')
      ).to_s
      nerr = File.join(Rails.application.config.x.heb412_ruta, errarch)
      puts "nerr=#{nerr}"
      advarch = File.join(
        '/generados/', File.basename(nombre, '.csv').to_s + 
        "-adv-" + DateTime.now.strftime('%Y%m%d%H%M%S')
      ).to_s
      nadv = File.join(Rails.application.config.x.heb412_ruta, advarch)
      puts "nadv=#{nadv}"

      extension = '.csv'
      FileUtils.touch(nerr + "#{extension}-0")
      FileUtils.touch(nadv + "#{extension}-0")
      flash[:notice] = 
        "Se programó la generación del archivo con problemas de 
         verificación #{errarch}#{extension} y del archivo con advertencias 
          #{advarch}#{extension}, por favor refresque hasta verlo generado, 
        después examine los errores, solucionelos y repita verificación."
      rutaurl = File.join(heb412_gen.sisini_path, 
                          '/generados').to_s

      ::VerificalsJob.perform_later(
        params[:filtro][:importar].to_i == 1 ? true : false, 
        rr2.to_s, nerr, nadv, extension, 
        current_usuario.id)
      redirect_to rutaurl, format: 'html'
      return
    end
    render 'verificacsv', layout: 'application'
  end


  def self.normaliza(texto)
    r = texto.downcase.gsub('á', 'a')
    r.gsub!('Á', 'a')
    r.gsub!('é', 'e')
    r.gsub!('É', 'e')
    r.gsub!('í', 'i')
    r.gsub!('Í', 'i')
    r.gsub!('ó', 'o')
    r.gsub!('Ó', 'o')
    r.gsub!('ú', 'u')
    r.gsub!('Ú', 'u')
    r.gsub!('ü', 'u')
    r.gsub!('Ü', 'u')
    r.strip!
    r
  end

  # Versión iterativa de distancia Levenshtein por Set Schroeder
  # https://stackoverflow.com/questions/8619785/what-is-an-efficient-way-to-measure-similarity-between-two-strings-levenshtein
  def self.levenshtein(s1, s2)
    d = {}
    (0..s1.size).each do |row|
      d[[row, 0]] = row
    end
    (0..s2.size).each do |col|
      d[[0, col]] = col
    end
    (1..s1.size).each do |i|
      (1..s2.size).each do |j|
        cost = 0
        if (s1[i-1] != s2[j-1])
          cost = 1
        end
        d[[i, j]] = [d[[i - 1, j]] + 1,
                     d[[i, j - 1]] + 1,
                     d[[i - 1, j - 1]] + cost
        ].min
      end
    end
    return d[[s1.size, s2.size]]
  end


  def self.nombres_departamentos_equivalentes(cod_depto, nom, adivcod, depalternos, adv)
    nome  = adivcod[cod_depto][:departamento] 
    nomnor = normaliza(nom)
    if nome == nomnor
      return true
    end

    alterno = false
    if depalternos[cod_depto]
      depalternos[cod_depto].each do |an|
        if normaliza(nom) == normaliza(an)
          alterno = true
          adv << "Suponiendo departamento #{adivcod[cod_depto][:departamento].upcase}. "
        end
      end
    end
    if !alterno && levenshtein(nome, nomnor) < 3
      return true
    end

    return alterno
  end

  #  Verifica longitud y retorna valor o nil si no  cumple
  def self.ver_long(csv, cfila, campo, long, prob)
    if csv[cfila][campo] 
      if csv[cfila][campo].length > long
        prob << "Valor en campo #{campo} de más de #{long} caracteres. "
      else
        return csv[cfila][campo].strip
      end
    end
    return nil
  end


  def self.nombres_municipios_equivalentes(cod_depto, cod_muni, nom, adivcod, munalternos, adv)
    nofi = adivcod[cod_depto][:mun][cod_muni][:municipio]
    nomn = normaliza(nom)
    return true if nofi == nomn
    if nofi.include?("(")
      # e.g BOLIVAR (CIUDAD BOLIVAR)
      nalt1 = nofi.split(/\(|\)/)[0].strip
      return true if nalt1 == nomn
      nalt2 = nofi.split(/\(|\)/)[1].strip
      return true if nalt2 == nomn
    end
    # e.g TUMACO y SAN ANDRÉS DE TUMACO
    return true if nom.length >= 4 && nofi.include?(nomn)
    return true if nofi.length >= 4 && nomn.include?(nofi)
    return true if 'la ' + nomn == nofi
    return true if 'la ' + nofi == nomn
    return true if nomn.gsub(/\s+/, "") == nofi.gsub(/\s+/, "")
    # e.g SAN ANDRES SOTAVENTA y SAN ANDRES DE SOTAVENTO
    return true if nomn.gsub(/ de /, " ") == nofi.gsub(/ de /, " ")
    # e.g LOPEZ (MICAY) y LOPEZ DE MICAY
    return true if nomn.gsub(/\(|\)/, "").gsub(/ de /, " ") == 
      nofi.gsub(/\(|\)/, "").gsub(/ de /, " ")

    if munalternos[cod_muni]
      munalternos[cod_muni].each do |an|
        if nomn == normaliza(an)
          adv << "Suponiendo municipio #{adivcod[cod_depto][:mun][cod_muni][:municipio].upcase}. "
          return true
        end
      end
    end


    if levenshtein(nomn, nofi) < 3
      return true
    end
    return false
  end

  def self.salva_prob(probact, filasact, csverr, narchentbase)
    # Error. No puede guardarse registro de filasact
    # emitirlo a archivo de errores con problemas encontrados
    filasact.each do |l,c|
      lincsv = c.to_h.values
      if probact[l]
        lincsv += ["#{narchentbase}:#{l+1}:Fila #{l+2}: #{probact[l]}"]
      else
        lincsv += ["Fila #{l+2}: Rechazada por problema en lucha social de varias filas"]
      end
      csverr << lincsv
    end
  end


  # Salvar anterior o reportar problemas en anterior
  # Retorna verdadero si no tiene problema
  def self.salva_prob_o_registro(ls, probact, filasact, depls, csverr, importar, narchentbase)
    if probact.size > 0
      # Error. No puede guardarse registro de filasact
      # emitirlo a archivo de errores con problemas encontrados
      salva_prob(probact, filasact, csverr, narchentbase)
      return false
    elsif importar
      # No hay error, puede salvarse siempre y cuando se haya elegido
      # y asociarse a la información por departamento
      ls.arch_imp = narchentbase
      ls.filaini_imp = filasact.keys.first+2
      ls.filafin_imp = filasact.keys.last+2
      if !ls.valid?
        probact[filasact.keys.first] = ls.errors.messages.values.join('. ')
        salva_prob(probact, filasact, csverr, narchentbase)
        return false
      end
      ls.save!
      if depls.count > 0 && !depls[0][:cod_depto].nil?
        depls.each do |infd|
          if infd[:cod_depto].nil?
            # Nacional ?
            did = nil
          else
            sipdep = Sip::Departamento.where(id_pais: 170).
              where(id_deplocal: infd[:cod_depto]).take
            did = sipdep.id
          end
          depbd = ::Lsdep.new(
            ls_id: ls.id,
            departamento_id: did,
            orden: infd[:registro],
            fuente: infd[:fuente],
            ffuente: infd[:ffuente],
            ffuen_1: infd[:ffuen_1],
            descripcion: infd[:memo])
          if !depbd.valid?
            ls.destroy
            probact[filasact.keys.first] = depbd.errors.messages.values.join('. ')
            salva_prob(probact, filasact, csverr, narchentbase)
            return false
          end
          depbd.save!
          if did
            orden = 1
            infd[:mun].each do |cod_municipio|
              # Descartar departamento DIVIPOLA
              munlocal = cod_municipio % 1000 
              sipmun = Sip::Municipio.where(id_departamento: sipdep.id).
                where(id_munlocal: munlocal).take
              munbd = ::Lsmun.new(lsdep_id: depbd.id,
                                  orden: orden,
                                  municipio_id: sipmun.id)
              if !munbd.valid?
                ls.destroy
                probact[filasact.keys.first] = munbd.errors.messages.values.join('. ')
                salva_prob(probact, filasact, csverr, narchentbase)
                return false
              end
              munbd.save!
              orden += 1
            end
          end
        end
      end # if tiene departamento que no es nacional
    end
    return true

  end


  def self.escribe_csv_verificacsv(narchent, ulteditor_id, importar)
    puts "ulteditor_id=#{ulteditor_id}"
    rutaerr = File.join(Rails.application.config.x.heb412_ruta, 
                        'err_ls.csv').to_s
    rutaadv = File.join(Rails.application.config.x.heb412_ruta, 
                        'adv_ls.csv').to_s
    puts "rutaerr=#{rutaerr}"
    puts "rutaadv=#{rutaadv}"


    # Organiza estructuras para búsqueda más rápida en RAM
    adiv = {}  # Arbol solo con nombres
    adivcod = {} # Arbol con todo con llaves por código
    bdep = {} # Departamento con llave por nombre
    bmun = {} # Municipios con llave por código de departamento y nombre
    Sip::Departamento.where(id_pais: 170).each do |d|
      dn = normaliza(d.nombre)
      if dn != 'exterior'
        coddep = d.id_deplocal
        bdep[dn] = coddep
        adiv[dn] = {}
        bmun[coddep] = {}
        adivcod[coddep] = { departamento: dn, mun: {} }
        d.municipio.each do |m|
          mn = normaliza(m.nombre)
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


    coberturas = ['S', 'N', 'M', 'SR', 'I', 'D', 'R']

    convocantes = [100, 120, 130, 140, 170, 180,
                   200, 210, 250, 280, 290,
                   310, 320, 350, 360, 380, 390,
                   400, 450, 480, 
                   500, 570, 580, 585, 590,
                   600,
                   700, 750,
                   800, 805, 810, 815, 820, 830, 840, 850, 860, 870, 875, 880, 885, 890,
                   900, 940, 950, 980
    ]

    actores = [100, 110, 120, 130, 140, 150, 160, 161, 162,
               200, 
               300, 310, 320, 330, 350,
               400, 410, 420,
               500, 510, 520, 530,
               600,
               700,
               750,
               800,
               900
    ]

    tipos_lucha = {
      'P' => 1,
      'PC' => 1,
      'PA' => 1,
      'PE' => 1,
      'PT' => 1,
      'B' => 2,
      'M' => 3,
      'I' => 4,
      'D' => 5,
      'T' => 6,
      'RC' => 7,
      'HH' => 8
    }

    motivos = [
      110, 111, 112, 113, 114, 115, 120, 130, 140,
      1000, 1500,
      2100, 2200, 2400, 2500,
      3000, 3100, 3200, 3300, 3400, 3500, 3600, 3700, 3800, 3810, 3820, 3830, 3840, 3850, 3860, 3870,
      4000, 4100, 4200, 4300, 4400, 4500, 4600, 4700,
      5000, 5100, 5200, 5300, 5500,
      6000, 6100, 6200, 6300, 6400, 6500, 6600, 6900,
      7000, 7100, 7105, 7200, 7205, 7300, 7305, 7400, 7405, 7500, 7505, 7900,
      8000, 8100, 8110, 8120, 8130, 8135, 8140, 8150, 8160, 8170, 8180, 8190,
      8200, 8300, 8310, 8350, 8360, 8400, 8500, 8600, 8900,
      9000, 9500,
    ]

    adversarios = [
      1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900,
      2000, 2100, 2200, 2300,
      3000, 3100, 3200, 3300, 3400, 3500, 3600, 3700,
      4000, 4100, 4200, 4300,
      5000, 5100,
      6000, 6100, 6200, 6300, 6500,
      7000, 7100, 7200, 7300, 7400, 7500,
      8000, 8100, 8500, 8600,
      9000, 9100, 9200, 9300,
      130, 140, 150
    ]

    csv = CSV.read(narchent, headers: true, encoding: 'utf-8', 
                   unconverted_fields: true)
    narchentbase = File.basename(narchent)
    puts "Leyendo #{csv.count} filas del archivo #{narchent}"
    procesa = true
    enc_obligatorios = 
      { fecha: ['FECHA'],
        anio: ['AÑO'],
        cobertura: ['COBERTURA-AMBITO', 'C'],
        registro: ['REGISTRO'],
        depto: ['DEPTO'],
        cod_depto: ['COD DEPTO', 'DEPTO1'],
        nmuni: ['NMUNI'],
        codigo_convocantes: ['CODIGO CONVOCANTES', 'CONVOCAN'],
        dirig1: ['DIRIG1'],
        dirig2: ['DIRIG2', nil],
        dirig3: ['DIRIG3'],
        actor: ['ACTOR'],
        partici1: ['PARTICI1', 'PARTICIP'],
        partici2: ['PARTICI2'],
        partici3: ['PARTICI3'],
        partici4: ['PARTICI4'],
        tipo_lucha: ['TIPO LUCHA','TL'],
        accion: ['ACCION'],
        motivopl: ['MOTIVOPL'],
        motivopp: ['MOTIVOPP'],
        motivo2: ['MOTIVO2'],
        motivo3: ['MOTIVO3'],
        motivo4: ['MOTIVO4'],
        motivo5: ['MOTIVO5'],
        adversario: ['ADVERSARIO', 'ADVERSA'],
        entidad1: ['ENTIDAD1', '. '],
        entidad2: ['ENTIDAD2'],
        entidad3: ['ENTIDAD3'],
        fuente: ['FUENTE'],
        ffuente: ['FFUENTE', ', '],
        ffuen_1: ['FFUEN_1'],
        memo: ['MEMO']
    }


    (1..32).each do |nm|
      muni="muni#{nm}".to_s
      mpio="mpio#{nm}".to_s
      enc_obligatorios[muni.to_sym]=["MUNI#{nm}"]
      enc_obligatorios[mpio.to_sym]=["MPIO#{nm}"]
    end


    enc = {}
    open(rutaerr, 'w') do |f|
      enc_obligatorios.each do |l, p|
        encontro = false
        ip = 0
        while !encontro && ip<p.length
          if csv.headers.include?(p[ip])
            encontro = true
            enc[l] = p[ip]
          end
          ip += 1
        end
        if !encontro
          f << "Falta columna indispensable con uno de estos nombres:  '#{p}'\n"
          procesa = false
        end
      end
    end
    if !procesa
      puts "No se procesa por errores"
      exit 1
    end
    if csv.headers.include?('ORGANIZACIONES CONVOCANTES')
      enc[:orgconvocan]='ORGANIZACIONES CONVOCANTES'
    end

    csal = 0
    numls = 0
    numls_sinp = 0
    sinprob = 0
    ultregistro = 0 # 0 Indica que no hay anterior
    ultfecha = nil
    ultanio = nil

    filasact = {} # Ultimas filas del csv que componen la actual lucha social, indexada por número de línea. Se acumulan tras análisis
    probact = {}  # Problemas acumulados en filasact indexadas por número de línea. Se acumulan tras análisis
    ls = nil   # Lucha social que construye en filasact
    depls = []   # Departamentos que lleva la lucha de filasact


    CSV.open(rutaerr, "wb") do |csverr|
      csverr << (csv.headers + ['PROBLEMAS'])
      CSV.open(rutaadv, "wb") do |csvadv|
        csvadv << (csv.headers + ['ADVERTENCIAS'])
        (0..csv.count-1).each do |cfila|

          prob = ''  # Problemas en la línea (por acumular probact al final de análisis de la línea)
          adv = '' # Advertencias en esta línea 

          if !csv[cfila][enc[:registro]]
            prob << "Se esperaba valor para REGISTRO. "
            if cfila > 0 
              tprob = "Registro de fila #{cfila+2} pierde secuencia"
              if probact[cfila -1]
                probact[cfila-1] << tprob
              else
                probact[cfila-1] = tprob
              end
            end
            registro = 1 # Imaginar que fuera uno nuevo
          else
            registro = csv[cfila][enc[:registro]].to_i
          end

          if cfila == 0 && registro != 1
            prob << "Primera fila debía tener REGISTRO en 1. "
            registro = 1 # Imaginar que fuera uno
          elsif cfila > 0 && registro != 1 
            if ultregistro + 1 != registro
              if cfila > 0
                tprob = "Registro de fila #{cfila+2} pierde secuencia"
                if probact[cfila-1]
                  probact[cfila-1] << tprob
                else
                  probact[cfila-1] = tprob
                end
              end
              registro = 1 # Imaginar que fuera uno nuevo
            end
          end

          if registro == 1 && filasact.size > 0
            numls += 1
            # Salvar o reportar problema porque se inicia nueva lucha
            if salva_prob_o_registro(ls, probact, filasact, depls, csverr, importar, narchentbase)
              numls_sinp += 1
            end
            filasact = {}
            probact = {}
            ls = nil   # Lucha social que construye en filasact
            depls = []   # Departamentos que lleva la lucha de filasact
          end


          
          mes_inexacto = false
          anio = csv[cfila][enc[:anio]].to_i
          if anio <= 1900 || (ultanio != nil && anio != ultanio && 
              anio != ultanio + 1)
            prob << "Año #{anio} no válido. "
          end

          if csv[cfila][enc[:fecha]].nil? || csv[cfila][enc[:fecha]].strip.empty?
            if anio <= 1900
              prob << 'Falta FECHA. '
            else
              # Autocompleta fecha conn 15/Jun del año y mes_inexacto es verdadero
              fecha = Date.new(anio, 6, 15)
              mes_inexacto = true
              adv << "Suponiendo que la fecha es 15/Jun/#{anio} con mes inexacto"
            end
          else
            me = ''
            fecha = Sip::FormatoFechaHelper.reconoce_adivinando_locale(csv[cfila][enc[:fecha]], me)
            if me != ''
              prob << me + " #{csv[cfila][enc[:fecha]]}"
            end
            if fecha && anio != fecha.year
              if fecha.year - 100 == anio
                # Cambiar de siglo
                fecha = Date.new(anio, fecha.month, fecha.day)
              else
                prob << "Campo año (#{anio}) no corresponde al " +
                  " año del campo fecha (#{fecha.year}). "
              end
            end
          end

          # Podria usarse ls para comparar con anterior en caso que registro>1
          if registro == 1
            if !csv[cfila][enc[:cobertura]]  || csv[cfila][enc[:cobertura]].strip.empty?
              prob << "Se esperaba algún valor en #{enc[:cobertura]}. "
            elsif !coberturas.include?(csv[cfila][enc[:cobertura]].strip.upcase)
              prob << "#{enc[:cobertura]} desconocido: #{csv[cfila][enc[:cobertura]]}. "
            else
              cobertura = csv[cfila][enc[:cobertura]].strip.upcase
            end
          elsif csv[cfila][enc[:cobertura]]  && !csv[cfila][enc[:cobertura]].strip.empty?
            adv << "#{enc[:cobertura]} se esperaba vacío. "
          end

          # Código de departamento y departamento
          cod_depto = nil
          if !csv[cfila][enc[:cod_depto]]
            if csv[cfila][enc[:depto]] != 'NACIONAL'
              if !csv[cfila][enc[:depto]]
                prob << "Se esperaba valor en campo #{enc[:depto]}. "
              else
                adv << "Se esperaba valor en campo #{enc[:depto]}. "
                depton = normaliza(csv[cfila][enc[:depto]])
                cod_depto = bdep[depton]
                if cod_depto && cod_depto.to_i > 0
                  adv << "Empleando #{cod_depto} en campo vacío #{enc[:cod_depto]}. "
                else
                  adivcod.each do |cd, r|
                    if nombres_departamentos_equivalentes(cd, csv[cfila][enc[:depto]], adivcod, depalternos, adv)
                      cod_depto = cd
                      break
                    end
                  end
                  if cod_depto && cod_depto >0
                    adv << "Empleando #{cod_depto} en campo vacío #{enc[:cod_depto]}. "
                  else
                    prob << "No logra reconocerse departamento #{csv[cfila][enc[:depto]]}"
                  end
                end
              end
            end
          elsif csv[cfila][enc[:depto]] == 'NACIONAL'
            # Ignorar cod_depto y nmuni
            cod_depto = nil
            depls += [{cod_depto: nil, registro: registro}]
          else
            cod_depto = csv[cfila][enc[:cod_depto]].to_i
            if !adivcod[cod_depto]
              prob << "DIVIPOLA no tiene código de departamento #{cod_depto}. "
            else
              if !csv[cfila][enc[:depto]]
                prob << "Se esperaba valor en campo #{enc[:depto]}. "
              else
                if !nombres_departamentos_equivalentes(cod_depto, csv[cfila][enc[:depto]], adivcod, depalternos, adv)
                  prob << "En campo '#{enc[:depto]}' se esperaba algo como #{adivcod[cod_depto][:departamento].upcase} pero se encontró #{csv[cfila][enc[:depto]]}. "
                end
              end
            end
          end

          if cod_depto && cod_depto > 1
            # Analizar municipios que sean del departamento
            depls += [{cod_depto: cod_depto, registro: registro}]
            mllenos = 0
            depls.last[:mun] = []
            (1..32).each do |nm|
              muni="muni#{nm}".to_s
              mpio="mpio#{nm}".to_s
              #enc[muni.to_sym]
              #enc[mpio.to_sym]
              if (csv[cfila][enc[muni.to_sym]].nil? || 
                  csv[cfila][enc[muni.to_sym]].strip.empty?) &&
                !csv[cfila][enc[mpio.to_sym]].nil? &&
                !csv[cfila][enc[mpio.to_sym]].strip.empty? 
                mllenos += 1
                cod_muni = bmun[cod_depto][normaliza(csv[cfila][enc[mpio.to_sym]].strip)]
                if cod_muni
                  cod_muni = cod_muni.to_i
                  adv << "Usando #{cod_muni} en campo vacío #{enc[muni.to_sym]}. "
                else
                  cod_muni = nil
                  adivcod[cod_depto][:mun].each do |cm, r|
                    if nombres_municipios_equivalentes(cod_depto, cm, 
                        csv[cfila][enc[mpio.to_sym]], adivcod, munalternos, adv)
                      cod_muni = cm
                      break
                    end
                  end
                  if cod_muni
                    adv <<  "Campo vacío #{enc[muni.to_sym]}, suponiendo que se trata del municipio #{adivcod[cod_depto][:mun][cod_muni][:municipio]} con código #{cod_muni}. "
                  else
                    prob << "Campo vacío #{enc[muni.to_sym]} y no puede identificarse municipio #{csv[cfila][enc[mpio.to_sym]]} en departamento con código #{cod_depto}. "
                  end
                end
              elsif !csv[cfila][enc[muni.to_sym]].nil? &&
                !csv[cfila][enc[muni.to_sym]].strip.empty? &&
                (csv[cfila][enc[mpio.to_sym]].nil? || csv[cfila][enc[mpio.to_sym]].strip.empty?)
                if csv[cfila][enc[muni.to_sym]].to_i > 0 && 
                    adivcod[cod_depto][:mun][csv[cfila][enc[muni.to_sym]].to_i]
                  cod_muni = csv[cfila][enc[muni.to_sym]].to_i
                  adv << "Suponiendo que campo vació #{enc[mpio.to_sym]} es '#{adivcod[cod_depto][:mun][cod_muni][:municipio].upcase}'. "
                else
                  cod_muni = nil
                  adivcod[cod_depto][:mun].each do |cm, r|
                    if nombres_municipios_equivalentes(cod_depto, cm, 
                        csv[cfila][enc[muni.to_sym]], adivcod, munalternos, adv)
                      cod_muni = cm
                      break
                    end
                  end
                  if cod_muni
                    adv <<  "Campo vacío #{enc[mpio.to_sym]}, suponiendo que es #{cod_muni}. "
                  else
                    prob << "Campo vacío #{enc[mpio.to_sym]} y no pudo identificarse municipio del campo #{enc[muni.to_sym]}. "
                  end
                end
                mllenos += 1
              elsif (!csv[cfila][enc[muni.to_sym]].nil? &&
                     !csv[cfila][enc[mpio.to_sym]].nil?) 
                mllenos += 1
                # Que concuerden código y nombre
                cod_muni = csv[cfila][enc[muni.to_sym]].to_i
                if cod_muni >= 0 && cod_depto > 0 && 
                    !adivcod[cod_depto][:mun][cod_muni]
                  prob << "DIVIPOLA no tiene código de municipio #{cod_muni}. "
                elsif !nombres_municipios_equivalentes(cod_depto, cod_muni, csv[cfila][enc[mpio.to_sym]], adivcod, munalternos, adv)
                  prob << "En campo #{enc[mpio.to_sym]} se esperaba algo como '#{adivcod[cod_depto][:mun][cod_muni][:municipio].upcase}' pero se encontró '#{csv[cfila][enc[mpio.to_sym]]}'. "
                else
                  # Bien este municipio
                  if normaliza(csv[cfila][enc[mpio.to_sym]]) != adivcod[cod_depto][:mun][cod_muni][:municipio]
                    adv << "Suponiendo que el municipio es #{adivcod[cod_depto][:mun][cod_muni][:municipio].upcase}"
                  end
                end
              end
              if cod_muni
                depls.last[:mun] << cod_muni
              end
            end

            nmuni = csv[cfila][enc[:nmuni]].to_i # Ignorarlo
            if mllenos != nmuni
              adv << "Se esperaba que NMUNI fuera #{mllenos} pero es #{nmuni}. "
            end
          end


          # Convocantes
          if registro == 1
            if csv[cfila][enc[:codigo_convocantes]].nil?
              prob << "Falta valor en campo #{enc[:codigo_convocantes]} en registro 1. "
            elsif !convocantes.include?(csv[cfila][enc[:codigo_convocantes]].to_i)
              prob << "Valor #{csv[cfila][enc[:codigo_convocantes]].to_i} no es valido en campo #{enc[:codigo_convocantes]}. "
            else
              codigo_convocantes = csv[cfila][enc[:codigo_convocantes]].to_i
            end
          end

          orgconvocan = ver_long(csv, cfila, enc[:orgconvocan], 512, prob)
          dirig1 = ver_long(csv, cfila, enc[:dirig1], 512, prob)
          dirig2 = ver_long(csv, cfila, enc[:dirig2], 512, prob)
          dirig3 = ver_long(csv, cfila, enc[:dirig3], 512, prob)

          # Actor
          actor = nil
          if registro == 1
            if csv[cfila][enc[:actor]].nil?
              prob << "Falta valor en campo #{enc[:actor]} en registro 1. "
            elsif !actores.include?(csv[cfila][enc[:actor]].to_i)
              prob << "Valor #{csv[cfila][enc[:actor]].to_i} no es valido en campo #{enc[:actor]}. "
            else
              actor = csv[cfila][enc[:actor]].to_i
            end
          end

          partici1 = ver_long(csv, cfila, enc[:partici1], 512, prob)
          partici2 = ver_long(csv, cfila, enc[:partici2], 512, prob)
          partici3 = ver_long(csv, cfila, enc[:partici3], 512, prob)
          partici4 = ver_long(csv, cfila, enc[:partici4], 512, prob)

          # Tipo de Lucha
          tipo_lucha = nil
          if registro == 1
            if csv[cfila][enc[:tipo_lucha]].nil?
              prob << "Falta valor en campo #{enc[:tipo_lucha]} en registro 1. "
            elsif !tipos_lucha.keys.include?(csv[cfila][enc[:tipo_lucha]])
              prob << "Valor #{csv[cfila][enc[:tipo_lucha]]} no es valido en campo #{enc[:tipo_lucha]}. "
            else
              tipo_lucha = csv[cfila][enc[:tipo_lucha]]
            end
          end

          # Acción
          accion = nil
          if registro == 1
            if csv[cfila][enc[:accion]].nil?
              prob << "Falta valor en campo #{enc[:accion]} en registro 1. "
            elsif !tipos_lucha.values.uniq.include?(csv[cfila][enc[:accion]].to_i)
              prob << "Valor #{csv[cfila][enc[:accion]]} no es valido en campo #{enc[:accion]}. "
            elsif tipo_lucha && tipos_lucha[tipo_lucha] != csv[cfila][enc[:accion]].to_i
              prob << "En campo #{enc[:accion]} se esperaba el valor #{tipos_lucha[tipo_lucha]}, pero aparece #{csv[cfila][enc[:accion]].to_i}. "
            else
              accion = csv[cfila][enc[:accion]].to_i
            end
          end

          # Motivo PL
          motivopl = nil
          if registro == 1
            if csv[cfila][enc[:motivopl]].nil?
              prob << "Falta valor en campo #{enc[:motivopl]} en registro 1. "
            elsif !motivos.include?(csv[cfila][enc[:motivopl]].to_i)
              prob << "Valor #{csv[cfila][enc[:motivopl]].to_i} no es valido en campo #{enc[:motivopl]}. "
            else
              motivopl = csv[cfila][enc[:motivopl]].to_i
            end
          end

          motivopp= ver_long(csv, cfila, enc[:motivopp], 512, prob)
          motivo2= ver_long(csv, cfila, enc[:motivo2], 512, prob)
          motivo3= ver_long(csv, cfila, enc[:motivo3], 512, prob)
          motivo4= ver_long(csv, cfila, enc[:motivo4], 512, prob)
          motivo5= ver_long(csv, cfila, enc[:motivo5], 512, prob)

          # Adversario
          adversario = nil
          if registro == 1
            if csv[cfila][enc[:adversario]].nil?
              prob << "Falta valor en campo #{enc[:adversario]} en registro 1. "
            elsif !adversarios.include?(csv[cfila][enc[:adversario]].to_i)
              prob << "Valor #{csv[cfila][enc[:adversario]].to_i} no es valido en campo #{enc[:adversario]}. "
            else
              adversario = csv[cfila][enc[:adversario]].to_i
            end
          end

          entidad1 = ver_long(csv, cfila, enc[:entidad1], 512, prob)
          entidad2 = ver_long(csv, cfila, enc[:entidad2], 512, prob)
          entidad3 = ver_long(csv, cfila, enc[:entidad3], 512, prob)

          # Fuente
          if registro == 1 && (!csv[cfila][enc[:fuente]] || csv[cfila][enc[:fecha]].strip.empty?)
            prob << "Falta #{enc[:fuente]}. "
          elsif csv[cfila][enc[:fuente]] && csv[cfila][enc[:fuente]].length > 512
            prob << "Valor en campo #{enc[:fuente]} de más de 512 caracteres. "
          end

          fuente = nil
          if csv[cfila][enc[:fuente]] && !csv[cfila][enc[:fuente]].strip.empty?
            fuente = csv[cfila][enc[:fuente]].strip
          end

          # Fecha fuente
          if registro == 1 && (!csv[cfila][enc[:ffuente]] || csv[cfila][enc[:ffuente]].strip.empty?)
            prob << "Falta #{enc[:ffuente]}. "
          end
          if csv[cfila][enc[:ffuente]] && !csv[cfila][enc[:ffuente]].strip.empty?
            me = ''
            ffuente = Sip::FormatoFechaHelper.reconoce_adivinando_locale(csv[cfila][enc[:ffuente]], me)
            if me != ''
              prob << "#{enc[:ffuente]}: #{csv[cfila][enc[:ffuente]]}: #{me}. "
            else
              if ffuente && anio != ffuente.year
                if ffuente.year - 100 == anio
                  # Cambiar de siglo
                  ffuente= Date.new(anio, ffuente.month, ffuente.day)
                end
              end
              if ffuente < fecha
                adv << "#{enc[:ffuente]} (#{csv[cfila][enc[:ffuente]]}) es " +
                  "anterior a #{enc[:fecha]} (#{csv[cfila][enc[:fecha]]}). "
              end
            end
          end

          if fuente && !ffuente
            prob << "Hay  #{enc[:fuente]} pero no #{enc[:ffuente]}. "
          elsif !fuente && ffuente
            prob << "Hay  #{enc[:ffuente]} pero no #{enc[:fuente]}. "
          elsif fuente && ffuente && depls.size > 0
            depls.last[:fuente] = fuente
            depls.last[:ffuente] = ffuente
          end


          if csv[cfila][enc[:ffuen_1]] && !csv[cfila][enc[:ffuen_1]].strip.empty?
            me = ''
            ffuen_1 = Sip::FormatoFechaHelper.reconoce_adivinando_locale(csv[cfila][enc[:ffuen_1]], me)
            if me != ''
              prob << "#{enc[:ffuen_1]}: #{csv[cfila][enc[:ffuen_1]]}: #{me}. "
            else
              if ffuen_1 && anio != ffuen_1.year
                if ffuen_1.year - 100 == anio
                  # Cambiar de siglo
                  ffuen_1= Date.new(anio, ffuen_1.month, ffuen_1.day)
                end
              end
              if ffuen_1 < fecha
                adv << "#{enc[:ffuen_1]} (#{csv[cfila][enc[:ffuen_1]]}) es " +
                  "anterior a #{enc[:fecha]} (#{csv[cfila][enc[:fecha]]}). "
              end
            end
          end

          if !fuente && ffuen_1
            prob << "Hay  #{enc[:ffuen_1]} pero no #{enc[:fuente]}. "
          elsif fuente && ffuen_1 && depls.size > 0
            depls.last[:ffuen_1] = ffuen_1
          end



          if registro == 1 && (csv[cfila][enc[:memo]].nil?  || 
              csv[cfila][enc[:memo]].strip.empty?)
            prob << 'Falta MEMO en registro 1. '
          end
          memo = ver_long(csv, cfila, enc[:memo], 6000, prob)
          if !csv[cfila][enc[:memo]].nil? && depls.size > 0
            depls.last[:memo] = memo
          end


          ultregistro = registro

          if adv != ''
            csvadv << csv[cfila].to_h.values + 
              ["#{narchentbase}:#{cfila+1}:Fila #{cfila+2} #{adv}"]
          end

          filasact[cfila] = csv[cfila]
          if prob != ''
            probact[cfila] = prob
            puts "* #{cfila+2}:  #{prob}"
          else
            if registro == 1
              ls = ::Ls.new(
                fecha: fecha,
                mes_inexacto: mes_inexacto,
                cobertura_id: ::Lscobertura.where(codigo: cobertura).take.id,
                convocante_id: codigo_convocantes,
                orgconvocante: orgconvocan,
                dirig1: dirig1,
                dirig2: dirig2,
                dirig3: dirig3,
                actor: actor,
                partici1: partici1,
                partici2: partici2,
                partici3: partici3,
                tipo_lucha: tipo_lucha,
                #accion: accion,
                motivopl: motivopl,
                motivopp: motivopp,
                motivo2: motivo2,
                motivo3: motivo3,
                motivo4: motivo4,
                motivo5: motivo5,
                adversario: adversario,
                entidad1: entidad1,
                entidad2: entidad2,
                entidad3: entidad3,
                fuente: fuente,
                ffuente: ffuente,
                ffuen_1: ffuen_1,
                descripcion: memo)
              if !ls.valid?
                prob << "Habría problemas para incluir en base: " +
                  ls.errors.messages.values.join('. ')
              else
                sinprob += 1
              end
            else
              sinprob += 1
            end
          end


          yield(csv.count, cfila) if block_given?
        end
        if filasact.size > 0
          if salva_prob_o_registro(ls, probact, filasact, depls, csverr, importar, narchentbase)
            numls_sinp += 1
          end
        end
      

      end #csvadv
    end #csverr

    
    p1 = csv.count > 0 ? (csv.count-sinprob)*1000/csv.count : 0
    p2 = csv.count > 0 ? (sinprob)*1000/csv.count : 0
    s = numls > 0 ? (numls_sinp)*1000/numls : 0
    puts "De los #{csv.count} registros, tienen problema #{csv.count-sinprob} (#{p1.round/10.0}%) y no tienen problema #{sinprob} (#{p2.round/10.0}%)"
    puts "De las #{numls} luchas sociales, no tienen problema #{numls_sinp} (#{s.round/10.0}%)"

    n=File.join('/tmp', 'err-ls.csv')

    return [rutaerr, rutaadv]

  end

  def vistas_manejadas
    ['Ls']
  end

  private

  def set_ls
    @registro = @basica = @ls = ::Ls.find(
      Ls.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def ls_params
    params.require(:ls).permit(atributos_form)
  end
end
