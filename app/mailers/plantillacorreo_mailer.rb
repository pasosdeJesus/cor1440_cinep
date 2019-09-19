
class PlantillacorreoMailer < ApplicationMailer
  
  def prepara_correo
    if !ENV['SMTP_MAQ']
      puts "No esta definida variable de ambiente SMTP_MAQ"
      exit 1
    end
    puts "OJO plantillacorreo"
    @tema = params[:tema]
    @para = params[:para]
    @idplantilla = params[:idplantilla].to_i

    @actorsocial_nombre = params[:actorsocial_nombre]
    @persona_nombre = params[:persona_nombre]
    @actorsocialpersona_cargo = params[:actorsocialpersona_cargo]
    @planencuesta_fechafin = params[:planencuesta_fechafin]
    @encuestapersona_url = params[:encuestapersona_url]

    puts "enviando con tema '#{@tema}' y plantilla '#{@idplantilla} #{@para.count} receptores"
    if @para == []
      @para = ['vtamara@cinep.org.co']
    end
    mail(to: @para, 
         bcc: ['vtamara@cinep.org.co, blanca@pasosdeJesus.org'],
         subject: @tema)
  end

  def get_binding
    binding
  end

end
