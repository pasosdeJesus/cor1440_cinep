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
      #@proyectosfinancieros = @proyectosfinancieros.paginate(
      #  :page => params[:pagina], per_page: 20
      #)
      @numproyectosfinancieros = @proyectosfinancieros.count();
      @incluir = ['id', 'nombre', 'referenciacinep', 
                  'fechainicio_ddMyyyy', 'fechacierre_ddMyyyy', 
                  'presupuestototal_localizado', 
                  'aportecinep_localizado', 'monto_localizado', 
                  'tipomoneda']
      respond_to do |format|
        format.html {  }
        format.json { head :no_content }
      end
    end

    def fichaimp
      @proyectosfinancieros = Proyectofinanciero.where(
        id: @proyectofinanciero.id)

      # Ejemplo de https://github.com/sandrods/odf-report
      report = ODFReport::Report.new("#{Rails.root}/app/reportes/Plantilla-RE-SC-07.odt") do |r|
        cn = [:nombre, :referencia, :referenciacinep, 
              :respagencia, :emailrespagencia,
              :telrespagencia, :fuentefinanciador, :observaciones,
              :saldo, :otrosaportescinep,
              :empresaauditoria,
              :centrocosto, :cuentasbancarias, 
              :sucursal, :rendimientosfinancieros,
              :informesespecificos, :informessolicitudpago, 
              :anotacionescontab, :gestiones]
              #:formatosespecificos, :formatossolicitudpago ]
        cn.each do |s|
          r.add_field(s, @proyectofinanciero[s] ? @proyectofinanciero[s] : '')
        end

        # Booleanos
        bn = [:acuse, :autenticarcompulsar, :copiasdesoporte, 
              :reportarrendimientosfinancieros,
              :reinvertirrendimientosfinancieros]
        bn.each do |b|
          r.add_field(b, @proyectofinanciero[b] ? 'Si' : 'No')
        end

        # Renombrados
        r.add_field(:aportefinanciador, 
                    @proyectofinanciero.monto_localizado)
        r.add_field(:saldo, 
                    @proyectofinanciero.saldo_localizado)
        r.add_field(:aportefinancierocinep, 
                    @proyectofinanciero.aportecinep_localizado)
        r.add_field(:presupuestototal, 
                    @proyectofinanciero.presupuestototal_localizado)
        r.add_field(:publicaciones, 
                    @proyectofinanciero[:compromisos])
        r.add_field(:fechainicio, 
                    @proyectofinanciero.fechainicio_ddMyyyy)
        r.add_field(:fechacierre, 
                    @proyectofinanciero.fechacierre_ddMyyyy)
        r.add_field(:fechaliquidacion, 
                    @proyectofinanciero.fechaliquidacion_ddMyyyy)

        # Calculados
        if @proyectofinanciero.fechainicio && @proyectofinanciero.fechacierre
          r.add_field(:duracion, dif_meses_dias(@proyectofinanciero.fechainicio, 
                                                @proyectofinanciero.fechacierre))
        end
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
        cf = @proyectofinanciero.anexo_proyectofinanciero.inject(0) do |memo, a|
          if (a.tipoanexo_id != 5) then
            memo + 1
          else 
            memo
          end
        end
        r.add_field(:formatosespecificos, cf > 0 ? 'Si' : 'No')

        # Referencian otra
        r.add_field(:tipomoneda, @proyectofinanciero.tipomoneda &&
                    @proyectofinanciero.tipomoneda ? 
                    @proyectofinanciero.tipomoneda.nombre : '')
        if @proyectofinanciero.uresponsable
          
          r.add_field(:responsable, 
                      @proyectofinanciero.proyectofinanciero_uresponsable.inject('') { |memo, i|
              (memo == '' ? '' : memo + "\n") + 
                (i.uresponsable ? i.uresponsable.nombre : "Por contratar") +
                (i.porcentaje ? " " + i.porcentaje.to_s + "%" : '')
          })
        end
        if @proyectofinanciero.financiador
          r.add_field(:financiador, 
                      @proyectofinanciero.financiador.inject('') { 
            |memo, i|
            (memo == '' ? '' : memo + ' - ') + i.nombre 
          })
          r.add_field(:paisfinanciador, 
                      @proyectofinanciero.financiador.inject('') { 
            |memo, i|
            i.pais && i.pais.nombre ? 
              (memo == '' ? '' : 
               memo + ' - ') + i.pais.nombre : memo
          })
        end
        if @proyectofinanciero.oficina
          r.add_field(:organigramacinep, 
                      @proyectofinanciero.oficina.inject('') { 
            |memo, i|
            (memo == '' ? '' : memo + ' - ') + i.nombre 
          })
        end
        if @proyectofinanciero.coordinador_proyectofinanciero
          r.add_field(:coordinador, 
                      @proyectofinanciero.coordinador_proyectofinanciero.inject('') { |memo, i|
            (memo == '' ? '' : memo + '; ') + 
              (i.coordinador ? i.coordinador.nombre : "") })
        end
        if @proyectofinanciero.proyectofinanciero_usuario
          
          r.add_field(:equipotrabajo, 
                      @proyectofinanciero.proyectofinanciero_usuario.inject('') { |memo, i|
              (memo == '' ? '' : memo + "\n") + 
                (i.usuario ? i.usuario.nombre : "Por contratar") +
                " (" + i.cargo.nombre.capitalize + ")" + 
                (i.porcentaje ? " " + i.porcentaje.to_s + "%" : '')
          })
        end
        if @proyectofinanciero.desembolso
          tm =  @proyectofinanciero.tipomoneda &&
            @proyectofinanciero.tipomoneda.nombre ?
            @proyectofinanciero.tipomoneda.codiso4217 : ''
          r.add_table('TDESEMBOLSOS', @proyectofinanciero.desembolso, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_ddMyyyy.to_s}
            d.add_column('VALORPLANEADO'){|i| i.valorplaneado_localizado.to_s +
                                          ' ' + tm }
          end
#          r.add_field(:desembolsos, 
#                      @proyectofinanciero.desembolso.inject('') { 
#            |memo, i| (memo == '' ? '' : memo + "\n") + 
#            i.detalle + ", Fecha: " + 
#            i.fechaplaneada_ddMyyyy.to_s +
#            ' (' + i.valorplaneado_localizado.to_s + ' ' + tm +
#            ')'
#            })
        end
        inarr = ''
        if @proyectofinanciero.informenarrativo
#          inarr = @proyectofinanciero.informenarrativo.inject('') do |memo, i|
#            (memo == '' ? '' : memo + "\n") + i.detalle + ", " + 
#              i.fechaplaneada_ddMyyyy.to_s 
#          end
          r.add_table('INFORMESNARRATIVOS', 
                      @proyectofinanciero.informenarrativo, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_ddMyyyy.to_s}
          end
        end
        if (inarr == '') 
          inarr = 'N/A'
        end
        r.add_field(:informesnarrativos, inarr)

        ifin = ''
        if @proyectofinanciero.informefinanciero
          r.add_table('INFORMESFINANCIEROS', 
                      @proyectofinanciero.informefinanciero, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_ddMyyyy.to_s}
          end
          #ifin = @proyectofinanciero.informefinanciero.inject('') do |memo, i|
          #  (memo == '' ? '' : memo + "\n") + i.detalle + ", " + 
          #    i.fechaplaneada_ddMyyyy.to_s 
          #end
        end
        if (ifin == '') 
          ifin = 'N/A'
        end
        r.add_field(:informesfinancieros, ifin)

        iaud = ''
        if @proyectofinanciero.informeauditoria
          r.add_table('INFORMESAUDITORIAS', 
                      @proyectofinanciero.informeauditoria, 
                      :header=>false) do |d|
            d.add_column('DESCRIPCION', :detalle)
            d.add_column('FECHAPLAN') {|i| i.fechaplaneada_ddMyyyy.to_s}
          end
          #iaud = @proyectofinanciero.informeauditoria.inject('') do |memo, i|
          #  (memo == '' ? '' : memo + "\n") + i.detalle + ", " +
          #    i.fechaplaneada_ddMyyyy.to_s 
          #end
        end
        if (iaud == '') 
          iaud = 'N/A'
        end
        r.add_field(:informesauditorias, iaud)
      end

      send_data report.generate, 
        type: 'application/vnd.oasis.opendocument.text',
        disposition: 'attachment',
        filename: 'RE-SC-07.odt'
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
        :aportecinep_localizado,
        :aaportes,
        :anotacionescontab,
        :anotacionesdb,
        :anotacionesinf,
        :anotacionesre,
        :anotacionesrh,
        :apresupuesto,
        :autenticarcompulsar,
        :centrocosto,
        :compromisos,
        :copiasdesoporte,
        :cuentasbancarias,
        :emailrespagencia, 
        :empresaauditoria,
        :fechacierre_ddMyyyy,
        :fechainicio_ddMyyyy,
        :fechaliquidacion_ddMyyyy,
        :financiador,
        #:formatosespecificos,
        #:formatossolicitudpago,
        :fuentefinanciador, 
        :gestiones,
        :informesespecificos,
        :informessolicitudpago,
        :monto_localizado,
        :nombre, 
        :observaciones,
        :otrosaportescinep,
        :presupuestototal_localizado,
        :referencia, 
        :referenciacinep, 
        :reportarrendimientosfinancieros,
        :reinvertirrendimientosfinancieros,
        :respagencia, 
        :telrespagencia, 
        :tipomoneda_id,
        :saldo_localizado,
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
          :fechaplaneada_ddMyyyy,
          :valorplaneado_localizado,
          :_destroy
        ],
        :financiador_ids => [],
        :informeauditoria_attributes => [
          :id,
          :detalle,
          :fechaplaneada_ddMyyyy,
          :_destroy
        ],
        :informefinanciero_attributes => [
          :id,
          :detalle,
          :fechaplaneada_ddMyyyy,
          :_destroy
        ],
        :informenarrativo_attributes => [
          :id,
          :detalle,
          :fechaplaneada_ddMyyyy,
          :_destroy
        ],
        :oficina_ids => [],
        :proyectofinanciero_usuario_attributes => [
          :id,
          :cargo_id,
          :usuario_id,
          :porcentaje,
          :_destroy
        ],
        :proyectofinanciero_uresponsable_attributes => [
          :id,
          :uresponsable_id,
          :porcentaje,
          :_destroy
        ],
        :coordinador_proyectofinanciero_attributes => [
          :id,
          :coordinador_id,
          :_destroy
        ]

      )
    end
  end
end
