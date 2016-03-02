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
      @incluir = ['id', 'nombre', 'fechainicio', 'fechacierre', 
                  'responsable_id', 'compromisos', 'monto' ]
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
        cn = [:nombre, :referencia, :referenciacinep, :fechainicio,
              :fechacierre, 
              :respagencia, :emailrespagencia,
              :telrespagencia, :fuentefinanciador, :observaciones,
              :saldo, :presupuestototal, :otrosaportescinep,
              :fechaliquidacion, :empresaauditoria,
              :centrocosto, :cuentasbancarias, 
              :sucursal, :rendimientosfinancieros,
              :informesespecificos, 
              :informessolicitudpago, :anotacionescontab,
              :gestiones, :copiasdesoporte, :autenticarcompulsar,
              :formatosespecificos, :formatossolicitudpago ]
        cn.each do |s|
          r.add_field(s, @proyectofinanciero[s])
        end
        # Renombrados
        r.add_field(:anotaciones, @proyectofinanciero[:anotacionescontab])
        r.add_field(:aportefinanciador, @proyectofinanciero[:monto])
        r.add_field(:aportefinancierocinep, @proyectofinanciero[:aportecinep])
        r.add_field(:publicaciones, @proyectofinanciero[:compromisos])

        # Booleanos
        r.add_field(:acuse, @proyectofinanciero.acuse ? 'Si' : 'No')
        r.add_field(:copiasdesoporte, 
                    @proyectofinanciero.copiasdesoporte ?  'Si' : 'No')
        # Calculados
        r.add_field(:duracion, dif_meses_dias(@proyectofinanciero.fechainicio, 
                                @proyectofinanciero.fechacierre))

        # Referencian otra
        r.add_field(:responsable, @proyectofinanciero.responsable.nombre ?
          @proyectofinanciero.responsable.nombre : '')
        r.add_field(:tipomoneda, @proyectofinanciero.tipomoneda.nombre)
        r.add_field(:financiador, 
                    @proyectofinanciero.financiador.inject('') { |memo, i|
          (memo == '' ? '' : memo + ' - ') + i.nombre })
        r.add_field(:organigramacinep, 
                    @proyectofinanciero.oficina.inject('') { |memo, i|
          (memo == '' ? '' : memo + ' - ') + i.nombre })

        r.add_field(:coordinador, 
                   @proyectofinanciero.proyectofinanciero_usuario.where(cargo_id: 2).inject('') { |memo, i|
          (memo == '' ? '' : memo + ' - ') + i.usuario.nombre })
        r.add_field(:equipotrabajo, 
                    @proyectofinanciero.proyectofinanciero_usuario.inject('') { |memo, i|
          (memo == '' ? '' : memo + ' - ') + i.usuario.nombre + " / " + i.cargo.nombre})

        r.add_field(:desembolsos, 
                    @proyectofinanciero.desembolso.inject('') { |memo, i|
          (memo == '' ? '' : memo + '. ') + i.detalle + ", " + 
            i.fechaplaneada.to_s + ", " + i.valorplaneado.to_s })

        r.add_field(:informesnarrativos, 
                    @proyectofinanciero.informenarrativo.inject('') { |memo, i|
          (memo == '' ? '' : memo + ' -  ') + i.detalle + ", " + 
            i.fechaplaneada.to_s })

        r.add_field(:informesfinancieros, 
                    @proyectofinanciero.informefinanciero.inject('') { |memo, i|
          (memo == '' ? '' : memo + ' - ') + i.detalle + ", " + 
            i.fechaplaneada.to_s })

        r.add_field(:informesauditorias, 
                    @proyectofinanciero.informeauditoria.inject('') { |memo, i|
          (memo == '' ? '' : memo + ' - ') + i.detalle
        })


        # Tablas
#        r.add_table("DESEMBOLSOS", @proyectofinanciero.desembolso) do |i|
#          i.add_column(:detalle) { |r| r.detalle }
#          i.add_column(:fechaplaneada) { |r| r.fechaplaneada}
#          i.add_column(:valorplaneado) { |r| r.valorplaneado}
#        end
#
#        r.add_table("INFORMESNARRATIVOS", @proyectofinanciero.informenarrativo) do |i|
#          i.add_column(:detalle) { |r| r.detalle }
#          i.add_column(:fechaplaneada) { |r| r.fechaplaneada}
#        end
#
#        r.add_table("INFORMESFINANCIEROS", @proyectofinanciero.informefinanciero) do |i|
#          i.add_column(:detalle) { |r| r.detalle }
#          i.add_column(:fechaplaneada) { |r| r.fechaplaneada}
#        end
# 
#        r.add_table("INFORMESAUDITORIA", @proyectofinanciero.informeauditoria) do |i|
#          i.add_column(:detalle) { |r| r.detalle }
#        end
      end

      send_data report.generate, 
        type: 'application/vnd.oasis.opendocument.text',
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
        :acuse,
        :aportecinep,
        :anotacionescontab,
        :autenticarcompulsar,
        :centrocosto,
        :compromisos,
        :copiasdesoporte,
        :cuentasbancarias,
        :emailrespagencia, 
        :empresaauditoria,
        :fechacierre,
        :fechainicio,
        :fechaliquidacion,
        :financiador,
        :formatosespecificos,
        :formatossolicitudpago,
        :fuentefinanciador, 
        :gestiones,
        :informesespecificos,
        :informessolicitudpago,
        :monto,
        :nombre, 
        :observaciones,
        :otrosaportescinep,
        :presupuestototal,
        :referencia, 
        :referenciacinep, 
        :rendimientosfinancieros,
        :respagencia, 
        :responsable_id,
        :telrespagencia, 
        :tipomoneda_id,
        :saldo,
        :sucursal,
        :financiador_ids => [],
        :desembolso_attributes => [
          :id,
          :detalle,
          :fechaplaneada,
          :valorplaneado,
          :_destroy
        ],
        :informeauditoria_attributes => [
          :id,
          :detalle,
          :_destroy
        ],
        :informefinanciero_attributes => [
          :id,
          :detalle,
          :fechaplaneada,
          :_destroy
        ],
        :informenarrativo_attributes => [
          :id,
          :detalle,
          :fechaplaneada,
          :_destroy
        ],
        :oficina_ids => [],
        :proyectofinanciero_usuario_attributes => [
          :id,
          :usuario_id,
          :cargo_id,
          :_destroy
        ]
      )
    end
  end
end
