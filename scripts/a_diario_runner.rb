# encoding: utf-8
# Ejecutar con bin/cron_diario

#require 'byebug'

if !ENV['CRECER_DIAS'] 
  DIAS=20
else
  DIAS=ENV['CRECER_DIAS'].to_i
end
def envia_alertapf(pid, tiene, cuando, fecha, maslineas=[])
    puts "Enviando alerta pf por #{pid}, #{tiene}, #{cuando}, #{fecha}"
    AlertaMailer.with(
      proyectofinanciero_id: pid,
      tiene: tiene,
      cuando: "#{cuando} (#{fecha})",
      complemento: maslineas
    ).
    alerta_proyectofinanciero.deliver_now
end

def envia_alerta_usuario_des(nusuario, nombres, apellidos, fechafin, maslineas=[])
    puts "Enviando altera usuario por #{nusuario}, #{nombres}, #{apellidos}, #{fechafin}"
    AlertaMailer.with(
      nusuario: nusuario,
      nombres: nombres,
      apellidos: apellidos,
      fechafin: fechafin,
      complemento: maslineas
    ).
    alerta_usuario_des.deliver_now
end


def alertas
  puts "Inicio de verificacion alertas proyectofinanciero"

  hoy = Date.today
  hoymasveinte = hoy + DIAS
  #byebug
  puts "Verifica cierre el #{hoymasveinte}"
  Cor1440Gen::Proyectofinanciero.
    where("estado NOT IN ('R', 'O')").
    where(fechacierre: hoymasveinte).each do |p|
    envia_alertapf(p.id, 'cierra', "en #{DIAS} días", p.fechacierre_localizada)
  end
  puts "Verifica liquidacion"
  Cor1440Gen::Proyectofinanciero.
    where("estado NOT IN ('R', 'O')").
    where(fechaliquidacion: hoymasveinte).each do |p|
    envia_alertapf(p.id, 'se liquida', "en #{DIAS} días", p.fechaliquidacion_localizada)
  end
  puts "Verifica desembolsos"
  ::Desembolso.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    envia_alertapf(d.proyectofinanciero_id, 'tiene un desembolso', 
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
    envia_alertapf(d.proyectofinanciero_id, 'tiene un informe narrativo', 
          "en #{DIAS} días", d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica informes financiero"
  ::Informefinanciero.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    envia_alertapf(d.proyectofinanciero_id, 'tiene un informe financiero', 
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
    envia_alertapf(d.proyectofinanciero_id, 'tiene una evaluación', 
          "en #{DIAS} días", d.fechaplaneada_localizada,
          [ "Detalle: #{d.detalle}"])
  end
  puts "Verifica auditorias"
  ::Informeauditoria.
    where("proyectofinanciero_id IN 
          (SELECT id FROM cor1440_gen_proyectofinanciero WHERE 
          estado NOT IN ('R', 'O'))").
    where(fechaplaneada: hoymasveinte).each do |d|
    envia_alertapf(d.proyectofinanciero_id, 'tiene una auditoria', 
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
      envia_alertapf(d.proyectofinanciero_id, 'tiene un producto', 
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
    envia_alertapf(d.proyectofinanciero_id, 'inicia producción de un producto', 
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
    envia_alertapf(d.proyectofinanciero_id, 'termina producción de un producto', 
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
    orden = "rm public/heb412/generados/*xlsx"
    res = `#{orden}`
    puts res
    orden = "rm public/heb412/generados/*pdf"
    res = `#{orden}`
    puts res
end

def deshabilita_usuarios

  mensaje = "".html_safe
  ::Usuario.where(fechadeshabilitacion: nil).joins(:contrato).
    where('contrato.fechafin <= ?',Date.today).each do |u|
    #byebug
    u.fechadeshabilitacion = Date.today
    u.clave_ldap = ''
    u.update(fechadeshabilitacion: u.fechadeshabilitacion,
            encrypted_password: '')
    if !u.valid?
      mensaje = "No se pudo deshabilitar".html_safe
    else
      mensaje = "Fue deshabilitado en CRECER y en directorio LDAP".html_safe
    end
    puts "#{u.nusuario} #{mensaje}"
    envia_alerta_usuario_des(u.nusuario, u.nombres, u.apellidos, 
                             u.contrato.fechafin_localizada, [mensaje])
  end

end


def elimina_actividades_en_blanco
  ::Usuario.connection.execute <<-SQL
  DELETE FROM cor1440_gen_actividad_proyectofinanciero where 
    actividad_id in (select id from cor1440_gen_actividad where fecha is null
    OR nombre IS NULL);

  DELETE FROM cor1440_gen_actividad_actividadpf where 
    actividad_id in (select id from cor1440_gen_actividad where fecha is null
    OR nombre IS NULL);

  update cor1440_gen_actividad set precedidapor=null where 
    precedidapor in (select id from cor1440_gen_actividad where fecha is null
    OR nombre IS NULL);

  DELETE FROM actividad_grupo where 
    actividad_id in (select id from cor1440_gen_actividad where 
      fecha is null OR nombre IS NULL);

  DELETE FROM cor1440_gen_actividad_actorsocial where 
    actividad_id in (select id from cor1440_gen_actividad where fecha is null
    OR nombre IS NULL);

  DELETE FROM cor1440_gen_actividad_objetivopf where 
    actividad_id in (select id from cor1440_gen_actividad where fecha is null
    OR nombre IS NULL);

  DELETE FROM cor1440_gen_actividad where fecha is null OR nombre IS NULL;

  SQL
  
end

def run
  if !ENV['SMTP_MAQ']
    puts "No esta definida variable de ambiente SMTP_MAQ"
    exit 1
  end
  if !ENV['CRECERSINDES']
    deshabilita_usuarios
  end
  if !ENV['CRECERSINALERTAS'] 
    alertas
  end
  if !ENV['CRECERSINELIMGEN'] 
    elimina_generados
  end
  elimina_actividades_en_blanco
end

run
