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
        :respuestafor,
      ]
      r << :anexo
      return r
    end

    # GET /encuestaspersona/new
    def new
      authorize! :manage, Mr519Gen::Encuestapersona
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

    def antes_editar
      edit_mr519_gen
      if @registro.adurl.nil? || @registro.adurl == ''
        @registro.regenerate_adurl
        @registro.save
      end
    end

    def edit
      antes_editar
      render layout: 'application'
    end

    def correoinv
      authorize! :manage, Mr519Gen::Encuestapersona
      puts "Enviado correo para encuesta aplicada #{params[:id]}"
      @registro = ep = Mr519Gen::Encuestapersona.find(params[:id].to_i)
      antes_editar
      ap = Sip::ActorsocialPersona.where(
        actorsocial_id: params[:actorsocial_id].to_i,
        persona_id: @registro.persona_id).take

      para = [ap.correo]

      # Copia a coordinadores de grupos relacionados con actor social
      cc = []
      ag = ::ActorsocialGrupo.where(
        actorsocial_id: params[:actorsocial_id].to_i)
      ag.each do |agi|

        ng = ::Ability::GRUPO_COORDINADOR + ' ' + 
          agi.grupo.nombre.sub(::Ability::GRUPO_LINEA + ' ', '')
        puts "Buscando ng=#{ng}"
        gc = Sip::Grupo.habilitados.where(nombre: ng)
        if gc.count == 1
          ncu = gc.take.usuario.where(fechadeshabilitacion: nil).map(&:email)
          cc += ncu
          puts "Encontrado agregando #{ncu} a cc"
        end
      end

      # Seguimiento
      cc << 'mfvargas@cinep.org.co'
      bcc = ['vtamara@cinep.org.co', 'vtamara@nocheyniebla.org']


      # Depuración
      puts "para=" + para.to_s
      puts "cc=" + cc.to_s
      puts "bcc=" + bcc.to_s
      #para = ['vtamara@cinep.org.co']
      cc = []
      #bcc = []
      u = encuestaexterna_url(@registro.adurl)
      prep = PlantillacorreoMailer.with(
        tema: 'Invitación a responder encuesta del CINEP/PPP',
        para: para,
        cc: cc,
        bcc: bcc,
        idplantilla: @registro.planencuesta.plantillacorreoinv_id,
        
        actorsocial_nombre: ap.actorsocial.presenta_nombre,
        persona_nombre: ap.persona.presenta_nombre,
        actorsocialpersona_cargo: ap.cargo,
        planencuesta_fechafin: @registro.planencuesta.fechafin,
        encuestapersona_url: u
      ).prepara_correo
      @resenvio = prep.deliver_now
      @registro.evidenciacorreoinv = @resenvio.message_id
      @registro.fechainv = Date.today
      @registro.destcorreoinv = "#{para.to_s} CC: #{cc.to_s} BCC: #{bcc.to_s}"
      @registro.save
      respond_to do |format|
        format.html { 
          render layout: 'application' 
        }
      end
    end

    def lista_params
      l = lista_params_mr519_gen 
      l += [ sip_anexo_attributes: [
        :adjunto, 
        :descripcion, 
        :id, 
        :_destroy
      ]]
      return l
    end

  end
end
