class HomologaRecursoeconomicosTc < ActiveRecord::Migration[5.1]
  def up
    Cor1440Gen::Proyectofinanciero.all.each do |p|
      comentacambio = ''
      
      if p.tasaformulacion
        p.tasa = p.tasaformulacion.enpesos
      elsif p.tipomoneda_id == 1
        p.tasa = 1
      elsif p.montopesos && p.monto && p.monto > 0
        p.tasa = p.montopesos / p.monto
        comentacambio += "No había tasa de formulación se estima del monto en pesos en #{p.tasa_localizado}. "
      elsif !p.montopesos || p.montopesos == 0
        comentacambio += "No había tasa de formulación y faltó monto en pesos se deja en 0. "
        p.tasa = 0
      else 
        comentacambio += "No había tasa de formulación, se cambio montó en pesos que era #{p.montopesos_localizado} y se dejó en 0. "
        p.tasa = 0
      end
      if !p.monto
        p.monto = 0
      end
      p.montopesos = p.monto * p.tasa
      p.tasaej = p.tasa
      p.montoej = p.monto
      if !p.aportecinep
        p.aportecinep = 0
      end
      p.aportecinepej = p.aportecinep
      if !p.aotrosfin
        p.aotrosfin = 0
      end
      p.aporteotrosej = p.aotrosfin
      if !p.saldo
        p.saldo = 0
      end
      p.saldoej = p.saldo
      npresupuestototal = p.monto + p.aportecinep + p.aotrosfin + p.saldo
      if  p.presupuestototal != npresupuestototal 
        comentacambio += "Cambió el presupuesto total que " +
          "antes era #{p.presupuestototal_localizado} y después "
        p.presupuestototal = npresupuestototal 
        comentacambio += "#{p.presupuestototal_localizado}. "
      end

      if p.otrosaportescinep && p.otrosaportescinep.length > 0
        comentacambio += "El campo Anotaciones presupuesto desapareció su valor era '#{p.otrosaportescinep}. "
      end

      p.save!
      if comentacambio != ''
        c = Cor1440Gen::Cambiosproyectofinanciero.new
        c.cuando = Time.now
        c.ip = '127.0.0.1'
        c.usuario = Usuario.where(nusuario: 'vtamara').take
        c.comentarios = "Tras cambiar pestaña Recursos Económicos en " +
          "Mar.2018 y homologar: " + comentacambio
        c.proyectofinanciero_id = p.id
        puts "Comentario en proyecto #{p.id}"
        c.save!
      end

    end
  end
end
