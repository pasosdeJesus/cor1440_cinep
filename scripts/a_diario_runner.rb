# encoding: utf-8

DIAS=20
def envia(pid, tiene, cuando, fecha, maslineas=[])
    puts "Enviando por #{pid}, #{tiene}, #{cuando}, #{fecha}"
    AlertaMailer.with(
      proyectofinanciero_id: pid,
      tiene: tiene,
      cuando: "#{cuando} (#{fecha})",
      complemento: maslineas
    ).
    alerta_proyectofinanciero.deliver_now
end

def alertas
  puts "Inicio de verificacion alertas proyectofinanciero"

  hoy = Date.today
  hoymasveinte = hoy + DIAS
  puts "Verifica cierre el #{hoymasveinte}"
  Cor1440Gen::Proyectofinanciero.
    where("estado NOT IN ('R', 'O')").
    where(fechacierre: hoymasveinte).each do |p|
    envia(p.id, 'cierra', "en #{DIAS} días", p.fechacierre_localizada)
  end
  puts "Verifica liquidacion"
  Cor1440Gen::Proyectofinanciero.
    where("estado NOT IN ('R', 'O')").
    where(fechaliquidacion: hoymasveinte).each do |p|
    envia(p.id, 'se liquida', "en #{DIAS} días", p.fechaliquidacion_localizada)
  end
  puts "Verifica desembolsos"
  ::Desembolso.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene un desembolso', 
          "en #{DIAS} días", d.fechaplaneada_localizada, 
          [ "Concepto: #{d.detalle}",
            "Valor planeado: #{d.valorplaneado_localizado}"])
  end
  puts "Verifica informes narrativos"
  ::Informenarrativo.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene un informe narrativo', 
          "en #{DIAS} días", d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica informes financiero"
  ::Informefinanciero.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene un informe financiero', 
          "en #{DIAS} días", d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica evaluciones"
  ::Informeevaluacion.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    puts "El proyecto #{d.proyectofinanciero_id} tiene una evaluación planeada en #{DIAS} días, el #{d.fechaplaneada}"
    envia(d.proyectofinanciero_id, 'tiene una evaluación', 
          "en #{DIAS} días", d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica auditorias"
  ::Informeauditoria.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene una auditoria', 
          "en #{DIAS} días", d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}",
            "Presupuesto donante: #{d.presupuestodonante}",
            "Presupuesto CINEP/PPP: #{d.presupuestodonante}",
          ])
  end
  puts "Verifica productos"
  ::Productopf.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
      envia(d.proyectofinanciero_id, 'tiene un producto', 
            "en #{DIAS} días", d.fechaplaneada_localizada,
            [ "Tipo: #{d.tipoproductopf.nombre if d.tipoproductopf_id}",
              "Costo previsto: #{d.costoprevisto}",
              "Detalle: #{d.detalle}" ])
   end
   puts "Verifica inicio de producción de productos"
  ::Productopf.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechainiprod: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'inicia producción de un producto', 
          "en #{DIAS} días", d.fechainiprod,
          [ "Tipo: #{d.tipoproductopf.nombre if d.tipoproductopf_id}",
            "Costo previsto: #{d.costoprevisto}",
            "Detalle: #{d.detalle}"
          ]
         )
  end
    puts "Verifica fin de producción de productos"
  ::Productopf.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechafinprod: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'termina producción de un producto', 
          "en #{DIAS} días", d.fechafinprod,
          [ "Tipo: #{d.tipoproductopf.nombre if d.tipoproductopf_id}",
            "Costo previsto: #{d.costoprevisto}",
            "Detalle: #{d.detalle}"
          ])
 
  end

end

def elimina_generados
    puts "Eliminando public/heb412/generados"
    orden = "ls -l public/heb412/generados/"
    res = `#{orden}`
    puts res
    orden = "rm public/heb412/generados/*ods"
    res = `#{orden}`
    puts res
end

def run
  if !ENV['SMTP_MAQ']
    puts "No esta definida variable de ambiente SMTP_MAQ"
    exit 1
  end
  alertas
  elimina_generados
end

run
