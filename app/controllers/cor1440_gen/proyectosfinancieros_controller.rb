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
              :gestiones, :copiasdesoporte, :autenticarcompulsar]
              #:formatosespecificos, :formatossolicitudpago ]
        cn.each do |s|
          r.add_field(s, @proyectofinanciero[s])
        end

        # Booleanos
        bn = [:acuse, :copiasdesoporte, :reportarrendimientosfinancieros,
              :reinvertirrendimientosfinancieros]
        bn.each do |b|
          r.add_field(b, @proyectofinanciero[b] ? 'Si' : 'No')
        end

        # Renombrados
        r.add_field(:aportefinanciador, @proyectofinanciero[:monto])
        r.add_field(:aportefinancierocinep, @proyectofinanciero[:aportecinep])
        r.add_field(:publicaciones, @proyectofinanciero[:compromisos])

        # Calculados
        r.add_field(:duracion, dif_meses_dias(@proyectofinanciero.fechainicio, 
                                @proyectofinanciero.fechacierre))
        ca = [:anotacionesdb, :anotacionesrh, :anotacionesre,
              :anotacionesinf, :anotacionescontab]
        an = ""
        sep = ""
        ca.each do |a|
          if @proyectofinanciero[a] then
            nan = @proyectofinanciero[a].strip
            if (nan != '' && !nan.end_with?(".")) then
              nan += "."
            end
            an += sep + nan
            sep = "   "
          end
        end
        r.add_field(:anotaciones, an)
        cf = @proyectofinanciero.sip_anexo.inject(0) do |memo, a|
          if (a.tipoanexo_id != 5) then
            memo + 1
          else 
            memo
          end
        end
        r.add_field(:formatosespecificos, cf > 0 ? 'Si' : 'No')

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
          (memo == '' ? '' : memo + ' - ') + (i.usuario ? i.usuario.nombre : "POR CONTRATAR") })
        r.add_field(:equipotrabajo, 
                    @proyectofinanciero.proyectofinanciero_usuario.inject('') { |memo, i|
          if i.cargo_id != 2
            (memo == '' ? '' : memo + ' - ') + (i.usuario ? i.usuario.nombre : "POR CONTRATAR") + " / " + i.cargo.nombre
          else
            memo
          end
        })
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
          (memo == '' ? '' : memo + ' - ') + i.detalle + ", " +
            i.fechaplaneada.to_s })


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
        :anotacionesdb,
        :anotacionesinf,
        :anotacionesre,
        :anotacionesrh,
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
        #:formatosespecificos,
        #:formatossolicitudpago,
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
        :reportarrendimientosfinancieros,
        :reinvertirrendimientosfinancieros,
        :respagencia, 
        :responsable_id,
        :telrespagencia, 
        :tipomoneda_id,
        :saldo,
        :sucursal,
        :anexo_proyectofinanciero_attributes => [
          :id,
          :proyectofinanciero_id,
          :tipoanexo_id,
          :_destroy,
          :sip_anexo_attributes => [
            :id, :descripcion, :adjunto, :_destroy
          ]
        ],
        :desembolso_attributes => [
          :id,
          :detalle,
          :fechaplaneada,
          :valorplaneado,
          :_destroy
        ],
        :financiador_ids => [],
        :informeauditoria_attributes => [
          :id,
          :detalle,
          :fechaplaneada,
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
