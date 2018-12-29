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
          urlevrind = ''
          d1 = 0.0
          urlev1 = ''
          d2 = 0.0
          urlev2 = ''
          d3 = 0.0
          urlev3 = ''
          eap = ::ApplicationHelper::ESTADOS_APROBADO.map { |l| "'#{l}'" }
          eap = eap.join(', ')
          case tipoind.nombre
          # Gerencia de proyectos
          when 'IG-FG-01'
            # Participacion efectiva en convocatorias
            base = Cor1440Gen::Proyectofinanciero.
              where('fechaformulacion >= ?', fini).
              where('fechaformulacion <= ?', ffin).
              where('respgp_id IS NOT NULL')
            cd1 = base.clone.where('estado IN (?)', 
                                    ::ApplicationHelper::ESTADOS_APROBADO) 
            d1 = cd1.count
            evd1 = cd1.pluck('id')
            urlev1 = cor1440_gen.proyectosfinancieros_url +
              '?filtro[busid]='+evd1.join(',')
            cd2 = base.clone
            d2 = cd2.count
            evd2 = cd2.pluck('id')
            urlev2 = cor1440_gen.proyectosfinancieros_url +
              '?filtro[busid]='+evd2.join(',')
            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil;
          when 'IG-FG-02'
            # En cuantas convocatorias participamos
            base = "SELECT COUNT(*) FROM cor1440_gen_proyectofinanciero " +
              "WHERE fechaformulacion>='#{fini}' AND "+
              "fechaformulacion<='#{ffin}' AND " +
              "respgp_id IS NOT NULL"
            base = Cor1440Gen::Proyectofinanciero.
              where('fechaformulacion >= ?', fini).
              where('fechaformulacion <= ?', ffin).
              where('respgp_id IS NOT NULL')
            cd1 = base
            resind = cd1.count
            urlevrind = cor1440_gen.proyectosfinancieros_url +
              '?filtro[busid]=' + base.pluck(:id).join(',')
          when 'IG-FG-03'
            # Porcentaje ejecutado de ingresos presupuestados 
            
          when 'IG-SC-01'
            # Porcentaje de informes enviados a tiempo a financiadores
            base = ::Informenarrativo.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechaplaneada>=?', fini).
                where('fechaplaneada<=?', ffin).
                where('fechareal<=(fechaplaneada + 7)')
            d1 = base.count
            idp1 = base.pluck(:proyectofinanciero_id)

            base2 = ::Informefinanciero.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechaplaneada >= ?', fini).
                where('fechaplaneada <= ?', ffin).
                where('fechareal <= (fechaplaneada + 7)')
            d1 += base2.count
            idp1.union(base2.pluck(:proyectofinanciero_id))
            urlev1 = cor1440_gen.proyectosfinancieros_url + 
              '?filtro[busid]='+idp1.uniq.join(',')

            base3 = ::Informenarrativo.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechaplaneada>=?', fini).
                where('fechaplaneada<=?', ffin)
            d2 = base3.count
            idp2 = base3.pluck(:proyectofinanciero_id)

            base4 = ::Informefinanciero.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechaplaneada >= ?', fini).
                where('fechaplaneada <= ?', ffin)
 
            d2 += base4.count
            idp2.union(base4.pluck(:proyectofinanciero_id))
            urlev2 = cor1440_gen.proyectosfinancieros_url + 
              '?filtro[busid]='+idp2.uniq.join(',')

            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil

          when 'IG-SC-02'
            # Porcentaje de informes narrativos sin devoluciones
            base1 = ::Informenarrativo.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechareal >= ?', fini).
                where('fechareal <= ?', ffin).
                where("devoluciones != 't'")
            d1 = base1.count
            urlev1 = cor1440_gen.proyectosfinancieros_url + 
              '?filtro[busid]=' + 
              base1.pluck(:proyectofinanciero_id).uniq.join(',')

            base2 = ::Informenarrativo.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechareal >= ?', fini).
                where('fechareal <= ?', ffin)
            d2 = base2.count
            urlev2 = cor1440_gen.proyectosfinancieros_url + 
              '?filtro[busid]=' + 
              base2.pluck(:proyectofinanciero_id).uniq.join(',')

            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil

          when 'IG-SC-03'
            # Porcentaje de informes financieros sin devoluciones
            base1 = ::Informefinanciero.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechareal >= ?', fini).
                where('fechareal <= ?', ffin).
                where("devoluciones != 't'")
            d1 = base1.count
            urlev1 = cor1440_gen.proyectosfinancieros_url + 
              '?filtro[busid]=' + 
              base1.pluck(:proyectofinanciero_id).uniq.join(',')

            base2 = ::Informefinanciero.where(
              'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL)').
                where('fechareal >= ?', fini).
                where('fechareal <= ?', ffin)
            d2 = base2.count
            urlev2 = cor1440_gen.proyectosfinancieros_url + 
              '?filtro[busid]=' + 
              base2.pluck(:proyectofinanciero_id).uniq.join(',')

            resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil

          # Plan Trienal 2018-2020
          when 'E1I1'
            base = "SELECT COUNT(*) FROM efecto WHERE 
               fecha>='#{fini}' AND fecha<='#{ffin}'
               AND indicadorpf_id='18'"
            resind = ActiveRecord::Base.connection.execute(base).first['count'].to_f

          when 'E1I2'
            base = "SELECT COUNT(actorsocial_id) FROM efecto
               JOIN actorsocial_efecto 
                ON efecto.id=actorsocial_efecto.efecto_id 
               JOIN sip_actorsocial 
                ON sip_actorsocial.id=actorsocial_efecto.actorsocial_id 
               WHERE fecha>='#{fini}' AND fecha<='#{ffin}'
               AND sip_actorsocial.lineabase20182020
               AND indicadorpf_id='19'"
            d1 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM 
              (SELECT DISTINCT regiongrupo_id FROM efecto 
              JOIN actorsocial_efecto ON efecto.id=actorsocial_efecto.efecto_id 
              JOIN actorsocial_regiongrupo 
                ON actorsocial_regiongrupo.actorsocial_id=actorsocial_efecto.actorsocial_id 
              JOIN sip_actorsocial ON sip_actorsocial.id=actorsocial_efecto.actorsocial_id 
              WHERE efecto.fecha>='#{fini}' AND efecto.fecha<='#{ffin}'
              AND sip_actorsocial.lineabase20182020
              AND efecto.indicadorpf_id='19') AS s"
            d2 = ActiveRecord::Base.connection.execute(base)
            d2 = d2.first ? d2.first['count'] : 0
            resind = d2.to_f

          when 'E2I1'
            base = "SELECT COUNT(*) FROM (SELECT DISTINCT actorsocial_id
               FROM efecto 
               JOIN actorsocial_efecto ON efecto.id=actorsocial_efecto.efecto_id 
               JOIN sip_actorsocial ON sip_actorsocial.id=actorsocial_efecto.actorsocial_id 
               WHERE efecto.fecha>='#{fini}' AND efecto.fecha<='#{ffin}'
               AND sip_actorsocial.lineabase20182020
               AND efecto.indicadorpf_id='20') AS s"
            d1 = ActiveRecord::Base.connection.execute(base).first['count']
            base = "SELECT COUNT(*) FROM sip_actorsocial WHERE 
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
            d1 = ActiveRecord::Base.connection.execute(base).first['count'].to_f
            resind = d1

          end
          respond_to do |format|
            format.json { 
              render json: {
                fechaloc:  Sip::FormatoFechaHelper.fecha_estandar_local(
                  Date.today),
                hmindicadorpf_id: hmi, 
                dmed1: d1, 
                urlev1: urlev1,
                dmed2: d2, 
                urlev2: urlev2,
                dmed3: d3, 
                urlev3: urlev3,
                rind: resind,
                urlevrind: urlevrind }, 
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
            'fecha_localizada', 
            'finicio_localizada', 
            'ffin_localizada', 
            'restiempo', 
            'dmed1', 
            'urlev1', 
            'dmed2', 
            'urlev2', 
            'dmed3', 
            'urlev3', 
            'rind', 
            'urlevrind', 
            'meta', 
            'porcump', 
            'analisis', 
            'acciones', 
            'responsables', 
            'plazo', 
            'id', 
            '_destroy'
          ]
        ]
      ) 
    end
  end
end
