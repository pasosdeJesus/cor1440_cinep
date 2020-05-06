#require 'byebug'

class AlertaMailer < ApplicationMailer
  
  def alerta_proyectofinanciero
    #byebug
    if !ENV['SMTP_MAQ']
      puts "No esta definida variable de ambiente SMTP_MAQ"
      exit 1
    end
    puts "OJO alerta_proyectofinanciero"
    pf_id = params[:proyectofinanciero_id]
    puts "OJO alerta_proyectofinanciero pf_id=#{pf_id}"
    @tiene = params[:tiene]
    puts "OJO alerta_proyectofinanciero tiene=#{@tiene}"
    @cuando = params[:cuando]
    puts "OJO alerta_proyectofinanciero cuando=#{@cuando}"
    @complemento = params[:complemento]
    puts "OJO alerta_proyectofinanciero cuando=#{@cuando}"
    @pf = Cor1440Gen::Proyectofinanciero.find(pf_id)
    return if !@pf
    puts "pf.id=#{@pf.id}"
    puts "pf.referenciacinep=#{@pf.referenciacinep}"
    @para = []
    @respgp = @pf.respgp
    puts "respgp=#{@respgp}"
    if @respgp && @respgp.email
      @para << @respgp.email
      puts "para respgp.email=#{@respgp.email}"
    end
    @respgp2 = @pf.respgp2
    if @respgp2 && @respgp2.email
      @para << @respgp2.email
      puts "para respgp2.email=#{@respgp2.email}"
    end
    #if @pf.coordinador && @pf.coordinador.count > 0
    #  @pf.coordinador.each do |coord|
    #    @para << coord.email
    #    puts "para coord.email=#{coord.email}"
    #  end
    #end
    puts "enviando con tema #{@tiene} a #{@para.count} receptores"
    #@para = ['vtamara@cinep.org.co'] # quitar
    if @para == []
      @para = ['vtamara@cinep.org.co']
    end
    mail(to: @para, 
         bcc: ['vtamara@cinep.org.co'],
         subject: "[CRECER] Proximamente un proyecto #{@tiene}")
  end

  def alerta_usuario_des
    #byebug
    if !ENV['SMTP_MAQ']
      puts "No esta definida variable de ambiente SMTP_MAQ"
      exit 1
    end
    puts "OJO alerta_usuario_des"
    @nusuario = params[:nusuario]
    puts "OJO nusuario=#{@nusuario}"
    @nombres = params[:nombres]
    puts "OJO nombres=#{@nombres}"
    @apellidos = params[:apellidos]
    puts "OJO apellidos=#{@apellidos}"
    @fechafin = params[:fechafin]
    puts "OJO fechafin=#{@fechafin}"
    @complemento = params[:complemento]
    puts "OJO complemento=#{@complemento}"
    @para = ['administrativa@cinep.org.co']
    Sip::GrupoUsuario.joins(:sip_grupo).
      where("sip_grupo.nombre ='Gestión Humana'").each do |gu|
      @para << gu.usuario.email
    end
    puts "enviando con tema #{@tiene} a #{@para.count} receptores"
    #@para = ['vtamara@cinep.org.co'] # quitar
    if @para == []
      @para = ['vtamara@cinep.org.co']
    end
    mail(to: @para, 
         bcc: ['vtamara@cinep.org.co'],
         subject: "[CRECER] Operación automática con usuario #{@nusuario}")

  end

end
