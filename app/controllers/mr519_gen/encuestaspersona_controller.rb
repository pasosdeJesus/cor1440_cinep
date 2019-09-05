# encoding: UTF-8
require_dependency "mr519_gen/concerns/controllers/encuestaspersona_controller"

module Mr519Gen
  class EncuestaspersonaController < Sip::ModelosController
    include Mr519Gen::Concerns::Controllers::EncuestaspersonaController

    def atributos_index
      r = [ :id ]
      if can?(:manage, Mr519Gen::Encuestapersona)
        r << :persona
        r << :planencuesta_id
        r << :fechacambio_localizada
        r << :adurl
      end
      r += [
        :respuestafor
      ]
    end

    # GET /encuestaspersona/new
    def new
      @registro = @encuestapersona = Encuestapersona.new
      @registro.respuestafor = Respuestafor.new
      @registro.respuestafor.fechaini = Date.today
      @registro.respuestafor.fechacambio = Date.today
      @registro.persona = Sip::Persona.all.take
      #@registro.regenerate_adurl
      @registro.fecha = Date.today
      @registro.save!(validate: false)
      redirect_to mr519_gen.edit_encuestapersona_path(@registro)
    end

    def correoinv
      puts "Enviado correo para encuesta aplicada #{params[:id]}"
      ep = Mr519Gen::Encuestapersona.find(params[:id].to_i)
      ap = Sip::ActorsocialPersona.where(
        actorsocial_id: params[:actorsocial_id].to_i,
        persona_id: ep.persona_id).take
      cor = [ap.correo]
      # Depurando
      cor = ['vtamara@nocheyniebla.org']
      u = encuestaexterna_url(ep.adurl)
      byebug
      @resenvio = PlantillacorreoMailer.with(
        tema: 'Invitación a responder encuesta del CINEP/PPP',
        para: cor,
        idplantilla: ep.planencuesta.plantillacorreoinv_id,
        
        actorsocial_nombre: ap.actorsocial.presenta_nombre,
        persona_nombre: ap.persona.presenta_nombre,
        actorsocialpersona_cargo: ap.cargo,
        planencuesta_fechafin: ep.planencuesta.fechafin,
        encuestapersona_url: u
      ).
      prepara_correo.deliver_now
      respond_to do |format|
        format.html { 
          render layout: 'application' 
        }
      end
    end

  end
end
