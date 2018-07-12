# encoding: utf-8

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

def run
  if !ENV['SMTP_MAQ']
    puts "No esta definida variable de ambiente SMTP_MAQ"
    exit 1
  end
  puts "Inicio de verificacion alertas proyectofinanciero"

  hoy = Date.today
  hoymasveinte = hoy + 20
  puts "Verifica cierre el #{hoymasveinte}"
  Cor1440Gen::Proyectofinanciero.
    where(fechacierre: hoymasveinte).each do |p|
    envia(p.id, 'cierra', 'en 20 días', p.fechacierre_localizada)
  end
  puts "Verifica liquidacion"
  Cor1440Gen::Proyectofinanciero.
    where(fechaliquidacion: hoymasveinte).each do |p|
    envia(p.id, 'se liquida', 'en 20 días', p.fechaliquidacion_localizada)
  end
  puts "Verifica desembolsos"
  ::Desembolso.
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene un desembolso', 
          'en 20 días', d.fechaplaneada_localizada, 
          [ "Concepto: #{d.detalle}",
            "Valor planeado: #{d.valorplaneado_localizado}"])
  end
  puts "Verifica informes narrativos"
  ::Informenarrativo.
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene un informe narrativo', 
          'en 20 días', d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica informes financiero"
  ::Informefinanciero.
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene un informe financiero', 
          'en 20 días', d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica evaluciones"
  ::Informeevaluacion.
    where(fechaplaneada: hoymasveinte).each do |d|
    puts "El proyecto #{d.proyectofinanciero_id} tiene una evaluación planeada en 20 días, el #{d.fechaplaneada}"
    envia(d.proyectofinanciero_id, 'tiene una evaluación', 
          'en 20 días', d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica auditorias"
  ::Informeauditoria.
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene una auditoria', 
          'en 20 días', d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}",
            "Presupuesto donante: #{d.presupuestodonante}",
            "Presupuesto CINEP/PPP: #{d.presupuestodonante}",
          ])
  end
  puts "Verifica productos"
  ::Productopf.
    where(fechaplaneada: hoymasveinte).each do |d|
    envia(d.proyectofinanciero_id, 'tiene un producto', 
          'en 20 días', d.fechaplaneada_localizada,
          [ "Tipo: #{d.tipoproductopf.nombre if d.tipoproductopf_id}",
            "Detalle: #{d.detalle}"
          ])
 
  end
end

run
