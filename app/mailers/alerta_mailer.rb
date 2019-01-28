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
    @respgp = @pf.respgp
    puts "respgp=#{@respgp.id}"
    if @respgp && @respgp.email
      puts "respgp.email=#{@respgp.email}"
      puts "enviando con tema #{@tiene}"
      mail(to: @respgp.email, 
           subject: "[CRECER] Proximamente un proyecto #{@tiene}")
    end
    @respgp2 = @pf.respgp2
    if @respgp2 && @respgp2.email
      puts "respgp2.email=#{@respgp2.email}"
      puts "enviando con tema #{@tiene}"
      mail(to: @respgp2.email, 
           subject: "[CRECER] Proximamente un proyecto #{@tiene}")
    end
    if @pf.coordinador && @pf.coordinador.count > 0
      @pf.coordinador.each do |coord|
        puts "coord.email=#{coord.email}"
        puts "enviando con tema #{@tiene}"
        mail(to: coord.email, 
             subject: "[CRECER] Proximamente un proyecto #{@tiene}")
      end
    end
  end

end
