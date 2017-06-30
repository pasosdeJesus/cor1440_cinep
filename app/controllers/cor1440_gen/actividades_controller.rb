# encoding: UTF-8
require_dependency "cor1440_gen/concerns/controllers/actividades_controller"

module Cor1440Gen
  class ActividadesController < ApplicationController
    include Cor1440Gen::Concerns::Controllers::ActividadesController


    def self.filtramas(par, ac, current_usuario = nil)
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
      #puts current_usuario.oficina

      return ac
    end

    # Encabezado comun para HTML y PDF (primeras filas)
    def encabezado_comun
      return [ Cor1440Gen::Actividad.human_attribute_name(:id), 
        @actividades.human_attribute_name(:fecha),
        @actividades.human_attribute_name(:responsable),
        @actividades.human_attribute_name(:nombre),
        @actividades.human_attribute_name(:departamento),
        @actividades.human_attribute_name(:actividadtipo),
        @actividades.human_attribute_name(:objetivo),
        @actividades.human_attribute_name(:proyectos),
        @actividades.human_attribute_name(:proyectosfinancieros),
        @actividades.human_attribute_name(:resultado),
        @actividades.human_attribute_name(:contexto),
        @actividades.human_attribute_name(:mujeres),
        @actividades.human_attribute_name(:hombres),
        @actividades.human_attribute_name(:blancos),
        @actividades.human_attribute_name(:mestizos),
        @actividades.human_attribute_name(:indigenas),
        @actividades.human_attribute_name(:negros)
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

    # No confiar parametros a Internet, sólo permitir lista blanca
    def actividad_params
      params.require(:actividad).permit(
        :oficina_id, :minutos, :nombre, 
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
