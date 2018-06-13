# encoding: UTF-8
module Admin
  class ActoresController < Sip::Admin::BasicasController
    before_action :set_actor, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Actor

    def clase 
      "::Actor"
    end

    def set_actor
      @basica = Actor.find(params[:id])
    end

    def atributos_index
      [
        "id", 
        "nombre",
        "nivelrelacion_id",
        ] +
        [ :sectoractor_ids =>  [] ] +
        [ :regiongrupo_ids =>  [] ] +
        [ :grupo_ids =>  [] ] +
        [ "personacontacto",
        "cargo",
        "correo",
        "telefono",
        "fax",
        "celular",
        "direccion",
        "observaciones", 
        "fechacreacion_localizada", 
        "fechadeshabilitacion_localizada"
      ]
    end

    def atributos_show
      [
        "id", 
        "nombre"
        ] +
        [ :sectoractor_ids =>  [] ] +
        ["pais_id"] +
        [ :regiongrupo_ids =>  [] ] +
        [ :grupo_ids =>  [] ] +
        [ "personacontacto",
        "cargo",
        "correo",
        "telefono",
        "fax",
        "celular",
        "direccion",
        "observaciones", 
        "fechacreacion_localizada", 
        "fechadeshabilitacion_localizada"
      ]
    end

    def self.filtra_grupos_fecha(c, grupo_ids, fecha)
      gid_dir = Sip::Grupo.where(nombre: 'Dirección').take
      gid_dir = gid_dir ? gid_dir.id : -1
      if grupo_ids && grupo_ids.length > 0 && !grupo_ids.include?(gid_dir)
        c = c.where("actor.id IN 
                     (SELECT actor_id 
                      FROM actor_grupo WHERE
                      sip_grupo_id IN (#{grupo_ids.join(',')}))")
      end
      if fecha
        c = c.where(
          '(? <= fechadeshabilitacion OR fechadeshabilitacion IS NULL) ', fecha)
      end

      return c
    end

    def index(c = nil)
      authorize! :index, ::Actor
      if c == nil
        c = ::Actor.all
      end
      grupo_ids = nil
      if params[:grupo_ids] && params[:grupo_ids] != ''
        grupo_ids = params[:grupo_ids].map {|x| x.to_i}
      end
      fecha = nil
      if params[:fecha] && params[:fecha] != ''
        fecha = Sip::FormatoFechaHelper.fecha_local_estandar params[:fecha]
      end
      c = ::Admin::ActoresController::filtra_grupos_fecha(
        c, grupo_ids, fecha)
      super(c)
    end   

    def genclase
      'M'
    end

    def actor_params
      params.require(:actor).permit(*atributos_form)
    end

  end
end
