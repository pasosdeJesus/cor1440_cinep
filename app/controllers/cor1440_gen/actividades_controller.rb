# encoding: UTF-8
require_dependency "cor1440_gen/concerns/controllers/actividades_controller"

module Cor1440Gen
  class ActividadesController < ApplicationController
    include Cor1440Gen::Concerns::Controllers::ActividadesController

    helper Cor1440Gen::GruposHelper


    def create
      @actividad = Actividad.new(actividad_params)
      @actividad.oficina_id = 1
      @actividad.current_usuario = current_usuario
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

    # Encabezado comun para HTML y PDF (primeras filas)
    def encabezado_comun
      atributos_presenta.map {|a| Cor1440Gen::Actividad.human_attribute_name(a)}
#      return [ 
#        @actividades.human_attribute_name(:fecha),
#        @actividades.human_attribute_name(:responsable),
#        @actividades.human_attribute_name(:nombre),
#        @actividades.human_attribute_name(:departamento),
#        @actividades.human_attribute_name(:actividadtipo),
#        @actividades.human_attribute_name(:objetivo),
#        @actividades.human_attribute_name(:proyectos),
#        @actividades.human_attribute_name(:proyectosfinancieros),
#        @actividades.human_attribute_name(:resultado),
#        @actividades.human_attribute_name(:contexto),
#        @actividades.human_attribute_name(:mujeres),
#        @actividades.human_attribute_name(:hombres),
#        @actividades.human_attribute_name(:blancos),
#        @actividades.human_attribute_name(:mestizos),
#        @actividades.human_attribute_name(:indigenas),
#        @actividades.human_attribute_name(:negros)
#      ]
    end

    def atributos_presenta
      [ :id, :fecha, :responsable, :nombre, :departamento,
        :actividadtipos, :objetivo, :proyectos, :proyectosfinancieros, 
        :resultado, :contexto, :mujeres, :hombres, :blancos,
        :mestizos, :indigenas, :negros
      ]
    end

    def fila_comun(actividad)
      return [actividad.id,
        actividad.fecha_localizada, 
        actividad.responsable ? actividad.responsable.nusuario : "",
        actividad.nombre ? actividad.nombre : "",
        actividad.departamento ? actividad.departamento.nombre : "",
        actividad.actividadtipo.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.nombre 
        },
        actividad.objetivo , 
        actividad.proyecto.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.nombre 
        },
        actividad.proyectofinanciero.inject("") { |memo, i| 
          (memo == "" ? "" : memo + "; ") + i.referenciacinep
        },
        actividad.resultado,
        actividad.contexto,
        actividad.mujeres,
        actividad.hombres,
        actividad.blancos,
        actividad.mestizos,
        actividad.indigenas,
        actividad.negros
      ]
    end

    def vector_a_registro(a, ac)
      {
        id: a[0],
        fecha: a[1],
        responsable: a[2],
        nombre: a[3],
        departamento: a[4],
        tipos_de_actividad: a[5],
        objetivo: a[6],
        proyecto: a[7],
        convenios_financieros: a[8],
        resultado: a[9],
        contexto: a[10],
        mujeres: a[11],
        hombres: a[12],
        blancos: a[13],
        mestizos: a[14],
        indigenas: a[15],
        negros: a[16],
        observaciones: ac.observaciones,
        creacion: ac.created_at,
        actualizacion: ac.updated_at,
        corresponsables: ac.usuario.inject("") { |memo, i| 
                (memo == "" ? "" : memo + "; ") + i.nusuario },
            }
    end

    # No confiar parametros a Internet, sólo permitir lista blanca
    def actividad_params
      params.require(:actividad).permit(
        :grupo_id, :minutos, :nombre, 
        :objetivo, :proyecto, :resultado,
        :fecha_localizada, :actividad, :observaciones, 
        :usuario_id,
        :departamento_id,
        :municipio_id,
        :lugar, 
        :convocante, 
        :participantes, 
        :totorg, 
        :mujeres, 
        :hombres, 
        :negros, 
        :indigenas, 
        :mestizos, 
        :blancos, 
        :desarrollo, 
        :valora,
        :contexto,
        :duracion,
        :mduracion,
        :alcance,
        :accionincidencia,
        :accioncgenero,
        :accioncetnia,
        :nucleoconflicto_id,
        :redactor_id,
        :oficina_id,
        :actividadarea_ids => [],
        :actividadtipo_ids => [],
        :actor_ids => [],
        :grupo_ids => [],
        :otronucleoconflicto_ids => [],
        :publicacion_ids => [],
        :proyecto_ids => [],
        :proyectofinanciero_ids => [],
        :usuario_ids => [],
        :actividad_rangoedadac_attributes => [
          :id, :rangoedadac_id, :fl, :fr, :ml, :mr, :_destroy
        ],
        :contextoinv_attributes => [
          :id, :fechainicio, :fechafin, :usuario_id,
          :regiongrupo_id
        ],
        :actividad_sip_anexo_attributes => [
          :id,
          :id_actividad, 
          :_destroy,
          :sip_anexo_attributes => [
            :id, :descripcion, :adjunto, :_destroy
      ]
      ]
      )
    end
  end
end
