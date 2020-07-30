class VerificalsJob < ApplicationJob
  queue_as :default

  # Llena CSV con problemas de verificación de CSV de Luchas Sociales.
  # Opcionalmente importa si importar es verdadero
  def perform(importar, narchent, errarch, advarch, extension, ulteditor_id)
    puts "Inicio de generación de CSV, verificando de #{narchent} escribiendo errores en #{errarch} y advertencias #{advarch} con extensión #{extension} ulteditor_id es #{ulteditor_id}"
    ultp = 0
    ns = ::LssController.escribe_csv_verificacsv(narchent, ulteditor_id, importar) do |t, i|
      p = 0
      if t>0
        p = 100*i/t
      end
      if p != ultp
        FileUtils.mv("#{errarch}#{extension}-#{ultp}", 
                     "#{errarch}#{extension}-#{p}")
        FileUtils.mv("#{advarch}#{extension}-#{ultp}", 
                     "#{advarch}#{extension}-#{p}")
        ultp = p
      end
    end
    if !ns.nil? && ns.length == 2
      FileUtils.rm("#{errarch}#{extension}-#{ultp}")
      FileUtils.rm("#{advarch}#{extension}-#{ultp}")
      FileUtils.mv(ns[0], "#{errarch}#{extension}")
      FileUtils.mv(ns[1], "#{advarch}#{extension}")
    end
  end

end

