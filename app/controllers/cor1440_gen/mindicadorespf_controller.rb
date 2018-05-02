# encoding: utf-8

module Cor1440Gen
  class MindicadorespfController < Sip::ModelosController
    helper ::ApplicationHelper
    include Rails.application.routes.url_helpers 

    before_action :set_mindicadorpf, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Cor1440Gen::Mindicadorpf
 

    def clase
      "Cor1440Gen::Mindicadorpf"
    end

    def atributos_index
      [ "id",
        "proyectofinanciero_id",
        "indicadorpf_id",
        "frecuenciaanual",
        "descd1",
        "descd2",
        "descd3",
        "pmindicador"
      ]
    end

    def index_reordenar(registros)
      return registros.reorder(proyectofinanciero_id: :asc, indicadorpf_id: :asc)
    end

    def new_modelo_path(o)
      return new_minidicadorpf_path()
    end

    # Mide indicador
    # Calcula medición de un indicador
    def mideindicador
      prob = ''
      if params[:finicio_localizada] && 
        params[:ffin_localizada] && params[:indicadorpf_id] &&
        params[:hmindicadorpf_id] 
        fini = Sip::FormatoFechaHelper.fecha_local_estandar(
          params[:finicio_localizada])
        fini = Date.strptime(fini, '%Y-%m-%d')
        ffin = Sip::FormatoFechaHelper.fecha_local_estandar(
          params[:ffin_localizada])
        ffin = Date.strptime(ffin, '%Y-%m-%d')
        indid = params[:indicadorpf_id].to_i
        ind = Cor1440Gen::Indicadorpf.find(indid)
        tipoind = ind.tipoindicador
        hmi = params[:hmindicadorpf_id].to_i
        if fini && ffin && ind && tipoind
          resind = 0.0
          d1 = 0.0
          d2 = 0.0
          d3 = 0.0
          eap = ::ApplicationHelper::ESTADOS_APROBADO.map { |l| "'#{l}'" }
          eap = eap.join(', ')
          case tipoind.nombre
          when 'IG-FG-01'
            base = "SELECT COUNT(*) FROM cor1440_gen_proyectofinanciero " +
              "WHERE fechaformulacion>='#{fini}' AND "+
              "fechaformulacion<='#{ffin}'"
            cd1 = base + " AND estado IN (#{eap})"
            d1 = ActiveRecord::Base.connection.execute(cd1).first['count']
            cd2 = base 
            d2 = ActiveRecord::Base.connection.execute(cd2).first['count']
            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil;
          when 'IG-FG-02'
            base = "SELECT COUNT(*) FROM cor1440_gen_proyectofinanciero " +
              "WHERE fechaformulacion>='#{fini}' AND "+
              "fechaformulacion<='#{ffin}'"
            cd1 = base
            resind = ActiveRecord::Base.connection.execute(cd1).first['count']
          when 'IG-FG-03'

          when 'IG-SC-01'
            base = "SELECT COUNT(*) FROM informenarrativo WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'
               AND fechareal<=(fechaplaneada+7) "
            d1 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM informefinanciero WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'
               AND fechareal<=(fechaplaneada+7) "
            d1 += ActiveRecord::Base.connection.execute(base).first['count']

            base = "SELECT COUNT(*) FROM informenarrativo WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'"
            d2 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM informefinanciero WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'"
            d2 += ActiveRecord::Base.connection.execute(base).first['count']
            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil

          when 'IG-SC-02'
            base = "SELECT COUNT(*) FROM informenarrativo WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'
               AND devoluciones!='t'"
            d1 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM informenarrativo WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'"
            d2 = ActiveRecord::Base.connection.execute(base).first['count']
            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil

          when 'IG-SC-03'
            base = "SELECT COUNT(*) FROM informefinanciero WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'
               AND devoluciones!='t'"
            d1 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM informefinanciero WHERE 
               fechaplaneada>='#{fini}' AND fechaplaneada<='#{ffin}'"
            d2 = ActiveRecord::Base.connection.execute(base).first['count']
            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil
          when 'E1I1'
            base = "SELECT COUNT(*) FROM efecto WHERE 
               fecha>='#{fini}' AND fecha<='#{ffin}'
               AND indicadorpf_id='18'"
            resind = ActiveRecord::Base.connection.execute(base).first['count'].to_f

          when 'E1I2'
            base = "SELECT COUNT(actor_id) FROM efecto
               JOIN actor_efecto ON efecto.id=actor_efecto.efecto_id 
               WHERE fecha>='#{fini}' AND fecha<='#{ffin}'
               AND indicadorpf_id='19'"
            d1 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM 
              (SELECT DISTINCT regiongrupo_id FROM efecto 
              JOIN actor_efecto ON efecto.id=actor_efecto.efecto_id 
              JOIN actor_regiongrupo ON actor_regiongrupo.actor_id=actor_efecto.actor_id 
              WHERE efecto.fecha>='#{fini}' AND efecto.fecha<='#{ffin}'
              AND efecto.indicadorpf_id='19') AS s"
            d2 = ActiveRecord::Base.connection.execute(base)
            d2 = d2.first ? d2.first['count'] : 0
            resind = d2.to_f

          when 'E2I1'
            base = "SELECT COUNT(*) FROM (SELECT DISTINCT actor_id
               FROM efecto 
               JOIN actor_efecto ON efecto.id=actor_efecto.efecto_id 
               WHERE efecto.fecha>='#{fini}' AND efecto.fecha<='#{ffin}'
               AND efecto.indicadorpf_id='20') AS s"
            d1 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM actor WHERE 
               (fechadeshabilitacion IS NULL 
                OR fechadeshabilitacion < '#{fini}'
                OR fechadeshabilitacion > '#{ffin}'
               ) AND nivelrelacion_id='1'"
            d2 = ActiveRecord::Base.connection.execute(base).first['count']
            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil

          when 'E3I1'
            base = "SELECT COUNT(*) FROM efecto WHERE 
               fecha>='#{fini}' AND fecha<='#{ffin}'
               AND indicadorpf_id='21'"
            d1 = ActiveRecord::Base.connection.execute(base).first['count'].to_f
            resind = d1
          when 'E3I2'
            base = "SELECT COUNT(*) FROM efecto WHERE 
               fecha>='#{fini}' AND fecha<='#{ffin}'
               AND indicadorpf_id='22'"
            d1 = ActiveRecord::Base.connection.execute(base).first['count'].to_f
            resind = d1.to_f
          else
            base = "SELECT COUNT(*) FROM efecto WHERE 
               fecha>='#{fini}' AND fecha<='#{ffin}'
               AND indicadorpf_id='#{ind.id}'"
            resind = ActiveRecord::Base.connection.execute(base).first['count'].to_f

          end
          respond_to do |format|
            format.json { 
              render json: {
                fechaloc:  Sip::FormatoFechaHelper.fecha_estandar_local(
                  Date.today),
                hmindicadorpf_id: hmi, 
                dmed1: d1, 
                dmed2: d2, 
                dmed3: d3, 
                rind: resind }, 
                status: :ok
              return
            }
          end
        else
          prob = 'Falla al convertir parametros'
        end
      else
        prob = 'Indispensables parametros fechaini_localizada ' +
          ', fechacierre_localizada e indicadorpf_id'
      end
      respond_to do |format|
        format.html { render action: "error" }
        format.json { render json: prob, 
                      status: :unprocessable_entity 
        }
      end

      
    end
    def genclase
      return 'F'
    end
     
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_mindicadorpf
      @registro = @mindicadorpf = Mindicadorpf.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def mindicadorpf_params
      params.require(:mindicadorpf).permit(
        atributos_form - ["pmindicador"] + [
          'pmindicador_attributes' => [
            'fecha_localizada', 'finicio_localizada', 'ffin_localizada', 
            'restiempo', 'dmed1', 'dmed2', 'dmed3', 
            'rind', 'meta', 'porcump', 'analisis', 'acciones', 'responsables', 
            'plazo', 'id', '_destroy'
          ]
        ]
      ) 
    end
  end
end
