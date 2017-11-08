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
        "nombre"
        ] +
        [ :sectoractor_ids =>  [] ] +
        [ :regiongrupo_ids =>  [] ] +
        [ :grupo_ids =>  [] ] +
        [ "personacontacto",
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
        "ciudad",
        "observaciones", 
        "fechacreacion_localizada", 
        "fechadeshabilitacion_localizada"
      ]
    end

    def genclase
      'M'
    end

    def actor_params
      params.require(:actor).permit(*atributos_form)
    end

  end
end
