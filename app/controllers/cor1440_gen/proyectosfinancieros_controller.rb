# encoding: UTF-8


module Cor1440Gen
  class ProyectosfinancierosController < ::ApplicationController

    include ApplicationHelper

     before_action :set_proyectofinanciero, 
       only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Cor1440Gen::Proyectofinanciero

    include Sip::ConsultasHelper

    def index
      @proyectosfinancieros = Cor1440Gen::Proyectofinanciero.all
      @proyectosfinancieros = @proyectosfinancieros.paginate(
        :page => params[:pagina], per_page: 20
      )
      @numproyectosfinancieros = @proyectosfinancieros.count();
      @incluir = ['id', 'nombre', 'fechainicio', 'fechacierre', 'responsable_id', 'compromisos', 'monto' ]
      respond_to do |format|
        format.html {  }
        format.json { head :no_content }
      end
    end

    def fichaimp
      @proyectosfinancieros = Proyectofinanciero.where(
        id: @proyectofinanciero.id)

      # Ejemplo de https://github.com/sandrods/odf-report
      report = ODFReport::Report.new("#{Rails.root}/app/reportes/Plantilla-RE-FG-07.odt") do |r|

        r.add_field(:nombre,         @proyectofinanciero.nombre)
        r.add_field(:referencia,         @proyectofinanciero.referencia)
        r.add_field(:referenciacinep,         @proyectofinanciero.referenciacinep)
#        r.add_field(:financiador, @proyectofinanciero.financiador.nombre)
        r.add_field(:fechainicio, @proyectofinanciero.fechainicio)
        r.add_field(:fechacierre,    @proyectofinanciero.fechacierre)
        r.add_field(:duracion,    @proyectofinanciero.fechacierre - @proyectofinanciero.fechainicio)
        r.add_field(:respagencia,      @proyectofinanciero.respagencia)
        r.add_field(:emailrespagencia,      @proyectofinanciero.emailrespagencia)
        r.add_field(:telrespagencia,      @proyectofinanciero.telrespagencia)
        r.add_field(:fuentefinanciacion,      @proyectofinanciero.fuentefinanciacion)
        r.add_field(:observaciones,      @proyectofinanciero.observaciones)
      end

      send_data report.generate, type: 'application/vnd.oasis.opendocument.text',
        disposition: 'attachment',
        filename: 'RE-FG-07.odt'
    end

    def show
      @proyectosfinancieros = Proyectofinanciero.where(
        id: @proyectofinanciero.id)

      render layout: "application"
    end


    def new
      @proyectofinanciero = Proyectofinanciero.new
      #@proyectofinanciero.current_usuario = current_usuario
      #@proyectofinanciero.oficina_id = 1
      #render layout: "application"
    end

    def edit
    end


    def create
      @proyectofinanciero = Proyectofinanciero.new(proyectofinanciero_params)
      @proyectofinanciero.fechacreacion =  DateTime.now.strftime('%Y-%m-%d') 
      #@proyectofinanciero.current_usuario = current_usuario
      #
      
      if @proyectofinanciero.save
        redirect_to proyectofinanciero_ruta(@proyectofinanciero), 
          notice: 'Proyecto creado.'
      else
        render :new
      end
    end


    def update
      if @proyectofinanciero.update(proyectofinanciero_params)
        redirect_to proyectofinanciero_ruta(@proyectofinanciero), 
              notice: 'Proyecto actualizado.' 
      else
        render :edit
      end
    end

    def destroy
      @proyectofinanciero.destroy
      respond_to do |format|
        format.html { 
          redirect_to proyectosfinancieros_ruta, notice: 'Proyecto eliminado' }
        format.json { head :no_content }
      end
    end

    private

    def set_proyectofinanciero
      @proyectofinanciero = Proyectofinanciero.find(
        Proyectofinanciero.connection.quote_string(params[:id]).to_i
      )
      #@proyectofinanciero.current_usuario = current_usuario
    end

    # No confiar parametros a Internet, sólo permitir lista blanca
    def proyectofinanciero_params
      params.require(:proyectofinanciero).permit(
        :nombre, 
        :referencia, 
        :referenciacinep, 
        :financiador,
        :fuentefinanciacion, 
        :respagencia, 
        :emailrespagencia, 
        :telrespagencia, 
        :fechainicio,
        :fechacierre,
        :fechaliquidacion,
        :responsable_id,
        :compromisos,
        :monto,
        :observaciones,
        :financiador_ids => []
      )
    end
  end
end
