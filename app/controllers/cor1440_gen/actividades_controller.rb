# encoding: UTF-8
require_dependency "cor1440_gen/concerns/controllers/actividades_controller"

module Cor1440Gen
  class ActividadesController < Sip::ModelosController
    include Cor1440Gen::Concerns::Controllers::ActividadesController

    helper Cor1440Gen::GruposHelper

    def clase
      'Cor1440Gen::Actividad'
    end

    def new
      @registro = @actividad = Actividad.new
      @registro.current_usuario = current_usuario
      @registro.oficina_id = 1
      @registro.creadopor_id = current_usuario.id
      @registro.save!(validate: false)
      @apf = ActividadProyectofinanciero.new
      @apf.proyectofinanciero_id = 18  # Plan trienal 2018-2020
      @apf.actividad_id = @registro.id
      @apf.save!(validate: false)
      redirect_to cor1440_gen.edit_actividad_path(@registro)
    end

    def create
      @actividad = Actividad.new(actividad_params)
      @actividad.oficina_id = 1
      @actividad.current_usuario = current_usuario
      @actividad.creadopor_id = current_usuario.id
      create_gen
    end

    def update
      params[:actividad][:oficina_id] = 1
      update_gen
    end

    def self.filtramas(par, ac, current_usuario = nil)
      mg = Cor1440Gen::GruposHelper.mis_grupos_sinus(current_usuario).
        map(&:id).join(', ')
      if mg == ''
        ac = ac.where('TRUE=FALSE')
      else
        ac = ac.where("cor1440_gen_actividad.id in 
        (SELECT actividad_id FROM actividad_grupo WHERE grupo_id IN (#{mg}))")
      end
      @busresponsable = param_escapa(par, 'busresponsable')
      if @busresponsable != '' then
        ac = ac.where(responsable: @busresponsable)
      end

      @busdepartamento = param_escapa(par, 'busdepartamento')
      if @busdepartamento != '' then
        ac = ac.where(departamento_id: @busdepartamento)
      end

      @busresultado = param_escapa(par, 'busresultado')
      if @busresultado != '' then
        ac = ac.where("unaccent(resultado) ILIKE unaccent(?)", "%#{@busresultado}%")
      end

      @buscontexto = param_escapa(par, 'buscontexto')
      if @buscontexto != '' then
        ac = ac.where("unaccent(contexto) ILIKE unaccent(?)", "%#{@buscontexto}%")
      end

      return ac
    end


    def show
      authorize! :read, clase.constantize
      @registro = clase.constantize.find(params[:id])
      render 'sip/modelos/show', layout: 'application'
    end

    # Encabezado comun para HTML y PDF (primeras filas)
    def encabezado_comun
      atributos_presenta.map {|a| Cor1440Gen::Actividad.human_attribute_name(a)}
    end

    def atributos_show
      [ :id, :fecha, :creadopor, :duracion, :mduracion,
        :nombre, :departamento, :municipio,
        :grupo, :proyectosfinancieros, :actividadpf,
        :objetivopf, :actor, :publicacion,
        :mujeres, :hombres, :sexo_onr,
        :negros, :indigenas, :etnia_onr,
        :observaciones, :anexos
      ]
    end

    def atributos_form
      atributos_show - [:proyectosfinancieros] + [:proyectofinanciero] - [:id]
    end

    def atributos_index
      [ :id, 
        :fecha, 
        :responsable, 
        :nombre, 
        :departamento,
        :municipio,
        :grupo, 
        :proyectofinanciero, 
        :actividadpf,
        :actor,
        :publicacion,
        :mujeres,
        :hombres,
        :sexo_onr,
        :negros,
        :indigenas,
        :etnia_onr,
        :poblacion, 
        :anexos
      ]
    end


    def atributos_presenta
      [ :id, :fecha, :creadopor, :duracion, :mduracion,
        :nombre, :departamento, :municipio,
        :grupo, :proyectosfinancieros, :actividadpf,
        :objetivopf, :actor, :publicacion,
        :mujeres, :hombres, :sexo_onr,
        :negros, :indigenas, :etnia_onr
      ]
    end

    def fila_comun(actividad)
      return [actividad.id,
        actividad.fecha_localizada, 
        actividad.creadopor ? actividad.creadopor.nusuario : "",
        actividad.duracion ? actividad.duracion : "",
        actividad.mduracion ? actividad.mduracion : "",
        actividad.nombre ? actividad.nombre : "",
        actividad.departamento ? actividad.departamento.nombre : "",
        actividad.municipio ? actividad.municipio.nombre : "",
        actividad.presenta('grupo'),
        actividad.proyectofinanciero.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.referenciacinep
        },
        actividad.presenta('actividadpf'),
        actividad.objetivopf.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.numero
        },
        actividad.presenta('actor'),
        actividad.presenta('publicacion'),
        actividad.mujeres,
        actividad.hombres,
        actividad.sexo_onr,
        actividad.negros,
        actividad.indigenas,
        actividad.etnia_onr
      ]
    end

    def vector_a_registro(a, ac)
      {
        id: a[0],
        fecha: a[1],
        creadopor: a[2],
        duracion: a[3],
        mduracion: a[4],
        nombre: a[5],
        departamento: a[6],
        municipio: a[7],
        grupo: a[8],
        convenios_financieros: a[9],
        actividad_de_convenio: a[10],
        objetivo_de_convenio: a[11],
        actor: a[12],
        publicacion: a[13],
        mujeres: a[14],
        hombres: a[15],
        sexo_onr: a[16],
        negros: a[17],
        indigenas: a[18],
        etnia_onr: a[19],
        observaciones: ac.observaciones,
        creacion: ac.created_at,
        actualizacion: ac.updated_at
      }
    end

    # No confiar parametros a Internet, sólo permitir lista blanca
    def actividad_params
      params.require(:actividad).permit(
        :actividad, 
        :accionincidencia,
        :accioncgenero,
        :accioncetnia,
        :alcance,
        :convocante, 
        :contexto,
        :departamento_id,
        :desarrollo, 
        :duracion,
        :etnia_onr, 
        :fecha_localizada, 
        :grupo_id, 
        :hombres, 
        :indigenas, 
        :lugar, 
        :mduracion,
        :minutos, 
        :mujeres, 
        :municipio_id,
        :negros, 
        :nombre, 
        :nucleoconflicto_id,
        :oficina_id,
        :objetivo, 
        :observaciones,         
        :participantes, 
        :proyecto, 
        :redactor_id,
        :resultado,
        :sexo_onr, 
        :totorg, 
        :usuario_id,
        :valora,
        :actividadarea_ids => [],
        :actividadpf_ids => [],
        :actividad_rangoedadac_attributes => [
          :id, :rangoedadac_id, :fl, :fr, :ml, :mr, :_destroy
        ],
        :actividad_sip_anexo_attributes => [
          :id,
          :id_actividad, 
          :_destroy,
          :sip_anexo_attributes => [
            :id, :descripcion, :adjunto, :_destroy
          ]
        ],
        :actividadtipo_ids => [],
        :actor_ids => [],
        :contextoinv_attributes => [
          :id, :fechainicio, :fechafin, :usuario_id,
          :regiongrupo_id
        ],
        :grupo_ids => [],
        :objetivopf_ids => [],
        :otronucleoconflicto_ids => [],
        :proyecto_ids => [],
        :proyectofinanciero_ids => [],
        :publicacion_ids => [],
        :usuario_ids => [],
        :valorcampoact_attributes => [
          :id,
          :campoact_id,
          :valor
        ]
      )
    end
  end
end
