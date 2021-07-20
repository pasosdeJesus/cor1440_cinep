require_dependency "heb412_gen/concerns/controllers/orgsociales_controller"

module Sip
  class OrgsocialesController < Heb412Gen::ModelosController
    include Heb412Gen::Concerns::Controllers::OrgsocialesController

    Sip::Municipio.conf_presenta_nombre_con_origen = true
    Sip::Departamento.conf_presenta_nombre_con_origen = true

    def atributos_index
      r = [ :id, :grupoper_id ]
      if can?(:read, ::Nivelrelacion)
        r +=  [ :nivelrelacion_id ]
      end
      r += [ :sectororgsocial_ids =>  [] ] +
      [ :regiongrupo_ids =>  [] ] +
      [ :grupo_ids =>  [] ] 
      if can?(:read, ::Csivinivelgeo)
        r += [:csivinivelgeo_id, :csivitema, :csivinivelresp_id]
      end
      r +=  [ :orgsocial_persona =>  [] ] 
      if can?(:read, ::Nivelrelacion)
        r += [ :lineabase_ids]
      end
      r += [ :habilitado, :created_at_localizada ]
      return r
    end

    def atributos_show
      [ :id, :grupoper_id] + (
        can?(:read, ::Nivelrelacion) ?  [:nivelrelacion_id] : [] ) +
      [ :sectororgsocial_ids =>  [] ] +
      [:pais_id] +
      [ :regiongrupo_ids =>  [] ] +
      [ :departamentotrab_ids =>  [] ] +
      [ :municipiotrab_ids =>  [] ] +
      [ :grupo_ids =>  [] ] + (
        can?(:read, ::Csivinivelgeo) ?
        [:csivinivelgeo_id] +
        [:csivitema_ids =>  [] ] +
        [:csivinivelresp_id] : []
      ) +
      [ :orgsocial_persona =>  [] ] + (
        can?(:read, ::Nivelrelacion) ?  [:lineabase_ids => []] : [] 
      ) + [ 
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
      if cannot? :manage, :lineabase
      #  a = a - ["lineabase_ids", :lineabase_ids]
      end
      a[a.index(:grupoper_id)] = :grupoper
      return a
    end

    def index_reordenar(registros)
      return registros.joins(:grupoper).reorder('sip_grupoper.nombre')
        #'JOIN sip_grupoper ON sip_grupoper.id=sip_orgsocial.grupoper_id')
        #reorder('sip_grupoper.nombre')
    end

    def self.filtra_grupos_fecha(c, grupo_ids, fecha)
      gid_dir = Sip::Grupo.where(nombre: 'Dirección').take
      gid_dir = gid_dir ? gid_dir.id : -1
      if grupo_ids && grupo_ids.length > 0 && !grupo_ids.include?(gid_dir)
        c = c.where("sip_orgsocial.id IN 
                     (SELECT orgsocial_id 
                      FROM grupo_orgsocial WHERE
                      grupo_id IN (#{grupo_ids.join(',')}))")
      end
      if fecha
        c = c.where(
          '(? <= fechadeshabilitacion OR fechadeshabilitacion IS NULL) ', fecha)
      end

      return c
    end
    def nueva_orgsocial_modal
      nueva_orgsocial = Sip::Orgsocial.create!(params[:orgsocial])
      if !nueva_orgsocial.save
        respond_to do |format|
          format.html { render inline: 'Actor social no pudo ser creado' }
        end
        return
      else
        nueva_orgsocial.save!
      end
      params[:id_nuevaorgsocial] = nueva_orgsocial.id
      @params = params
      respond_to do |format|
        format.js { render 'refrescarorg' }
      end 
    end
    def filtra_contenido_params
      # Si el usuario es del grupo STCIV marcar el contacto
      # con stciv para que no pueda ser visto por CINEP
      # (Y los contactos de CINEP no pueden ser vistos por STCIV).
      if can? :stciv, Sip::OrgsocialPersona && 
          params[:orgsocial][:orgsocial_persona_attributes] 
        params[:orgsocial][:orgsocial_persona_attributes].each do |at|
          at[1][:stciv] = true
        end
      end
    end

    def validaciones(registro)
      if registro.orgsocial_persona
        registro.orgsocial_persona.each do |ap|
          if ap.persona && ap.persona.sexo.nil?
            ap.persona.sexo = 'S'
          end
        end
      end
    end

    def index(c = nil)
      authorize! :index, Sip::Orgsocial
      if c == nil
        c = Sip::Orgsocial.all
      end
      grupo_ids = nil
      if params[:grupo_ids] && params[:grupo_ids] != ''
        grupo_ids = params[:grupo_ids].map {|x| x.to_i}
      end
      fecha = nil
      if params[:fecha] && params[:fecha] != ''
        fecha = Sip::FormatoFechaHelper.fecha_local_estandar params[:fecha]
      end
      c = Sip::OrgsocialesController::filtra_grupos_fecha(c, grupo_ids, fecha)
      super(c)
    end   


    def orgsocial_params
      params.require(:orgsocial).permit(
        atributos_form - [:grupoper] +
        [ :pais_id,
          :presenta_nombre,
          :grupoper_attributes => [
            :id,
            :nombre,
            :anotaciones ],
          :orgsocial_persona_attributes => [
            :id,
            :stciv,
            :cargo,
            :correo,
            :perfilorgsocial_id,
            :_destroy,
            :persona_attributes => [
              :id,
              :nombres,
              :apellidos,
              :sexo
            ]
         ]
      ]) 
    end
    helper_method :clase, :atributos_index, :atributos_form, 
            :atributos_show
  end
end
