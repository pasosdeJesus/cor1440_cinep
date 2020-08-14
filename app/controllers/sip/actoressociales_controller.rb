# encoding: UTF-8
require_dependency "heb412_gen/concerns/controllers/actoressociales_controller"

module Sip
  class ActoressocialesController < Heb412Gen::ModelosController
    include Heb412Gen::Concerns::Controllers::ActoressocialesController

    Sip::Municipio.conf_presenta_nombre_con_origen = true
    Sip::Departamento.conf_presenta_nombre_con_origen = true

    def atributos_index
      r = [ :id, :grupoper_id ]
      if can?(:read, ::Nivelrelacion)
        r +=  [ :nivelrelacion_id ]
      end
      r += [ :sectoractor_ids =>  [] ] +
      [ :regiongrupo_ids =>  [] ] +
      [ :grupo_ids =>  [] ] 
      if can?(:read, ::Csivinivelgeo)
        r += [:csivinivelgeo_id, :csivitema_id, :csivinivelresp_id]
      end
      r +=  [ :actorsocial_persona =>  [] ] 
      if can?(:read, ::Nivelrelacion)
        r += [ :lineabase20182020 ]
      end
      r += [ :habilitado, :created_at_localizada ]
      return r
    end

    def atributos_show
      [ :id, :grupoper_id] + (
        can?(:read, ::Nivelrelacion) ?  [:nivelrelacion_id] : [] ) +
      [ :sectoractor_ids =>  [] ] +
      [:pais_id] +
      [ :regiongrupo_ids =>  [] ] +
      [ :departamentotrab_ids =>  [] ] +
      [ :municipiotrab_ids =>  [] ] +
      [ :grupo_ids =>  [] ] + (
        can?(:read, ::Csivinivelgeo) ?
        [:csivinivelgeo_id,
         :csivitema_id,
         :csivinivelresp_id] : []
      ) +
      [ :actorsocial_persona =>  [] ] + (
        can?(:read, ::Nivelrelacion) ?  [:lineabase20182020] : [] ) +
      [ 
        :web,
        :direccion,
        :telefono,
        :fax,
        :celular,
        :created_at,
        :fechadeshabilitacion_localizada
      ]
    end

    def atributos_form
      a = atributos_show - ['id', :id, :created_at, :updated_at]
      if cannot? :manage, :lineabase20182020
        a = a - ["lineabase20182020", :lineabase20182020]
      end
      a[a.index(:grupoper_id)] = :grupoper
      return a
    end

    def index_reordenar(registros)
      return registros.joins(:grupoper).reorder('sip_grupoper.nombre')
        #'JOIN sip_grupoper ON sip_grupoper.id=sip_actorsocial.grupoper_id')
        #reorder('sip_grupoper.nombre')
    end

    def self.filtra_grupos_fecha(c, grupo_ids, fecha)
      gid_dir = Sip::Grupo.where(nombre: 'Dirección').take
      gid_dir = gid_dir ? gid_dir.id : -1
      if grupo_ids && grupo_ids.length > 0 && !grupo_ids.include?(gid_dir)
        c = c.where("sip_actorsocial.id IN 
                     (SELECT actorsocial_id 
                      FROM actorsocial_grupo WHERE
                      grupo_id IN (#{grupo_ids.join(',')}))")
      end
      if fecha
        c = c.where(
          '(? <= fechadeshabilitacion OR fechadeshabilitacion IS NULL) ', fecha)
      end

      return c
    end

    def validaciones(registro)
      if registro.actorsocial_persona
        registro.actorsocial_persona.each do |ap|
          if ap.persona && ap.persona.sexo.nil?
            ap.persona.sexo = 'S'
          end
        end
      end
    end

    def index(c = nil)
      authorize! :index, Sip::Actorsocial
      if c == nil
        c = Sip::Actorsocial.all
      end
      grupo_ids = nil
      if params[:grupo_ids] && params[:grupo_ids] != ''
        grupo_ids = params[:grupo_ids].map {|x| x.to_i}
      end
      fecha = nil
      if params[:fecha] && params[:fecha] != ''
        fecha = Sip::FormatoFechaHelper.fecha_local_estandar params[:fecha]
      end
      c = Sip::ActoressocialesController::filtra_grupos_fecha(c, grupo_ids, fecha)
      super(c)
    end   


    def actorsocial_params
      params.require(:actorsocial).permit(
        atributos_form - [:grupoper] +
        [ :pais_id,
          :presenta_nombre,
          :grupoper_attributes => [
            :id,
            :nombre,
            :anotaciones ],
          :actorsocial_persona_attributes => [
            :id,
            :cargo,
            :correo,
            :perfilactorsocial_id,
            :_destroy,
            :persona_attributes => [
              :id,
              :nombres,
              :apellidos
            ]
         ]
      ]) 
    end

  end
end
