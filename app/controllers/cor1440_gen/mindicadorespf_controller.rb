
require_dependency 'cor1440_gen/concerns/controllers/mindicadorespf_controller'

module Cor1440Gen
  class MindicadorespfController < Sip::ModelosController
    helper ::ApplicationHelper
    include Rails.application.routes.url_helpers 

    include Cor1440Gen::Concerns::Controllers::MindicadorespfController

    before_action :set_mindicadorpf, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Cor1440Gen::Mindicadorpf


    # Avance en E1I2 de Plan Trienal 2018-2020
    # idefs lista con identificación de efectos que aportan en el avance
    # mind Es objeto Cor1440Gen::Mindicadorpf con medición
    # fini Es fecha inicial de medición
    # ffin Es fecha final de medición
    def medir_indicador_efecto_tipo_19(idefs, mind, fini, ffin)
      datosint = []
      base = "SELECT DISTINCT orgsocial_id FROM cor1440_gen_efecto
               JOIN cor1440_gen_efecto_orgsocial
                ON cor1440_gen_efecto.id=cor1440_gen_efecto_orgsocial.efecto_id 
               JOIN sip_orgsocial 
                ON sip_orgsocial.id=cor1440_gen_efecto_orgsocial.orgsocial_id 
               WHERE ((fecha>='#{fini}' AND fecha<='#{ffin}') OR
                (fecha20>='#{fini}' AND fecha20<='#{ffin}') OR
                (fecha40>='#{fini}' AND fecha40<='#{ffin}') OR
                (fecha60>='#{fini}' AND fecha60<='#{ffin}') OR
                (fecha80>='#{fini}' AND fecha80<='#{ffin}') OR
                (fecha100>='#{fini}' AND fecha100<='#{ffin}'))
               AND sip_orgsocial.lineabase20182020
               AND indicadorpf_id='19'"
      ld1 = ActiveRecord::Base.connection.execute(base).to_a.map(&:values).
      flatten
      d1 = ld1.count
      datosint << {valor: d1, rutaevidencia: d1 == 0 ? '#' :
                   sip.orgsociales_path + '?filtro[busid]=' + 
                   ld1.join(',')}
      base = "SELECT DISTINCT regiongrupo_id FROM cor1440_gen_efecto 
              JOIN cor1440_gen_efecto_orgsocial ON cor1440_gen_efecto.id=cor1440_gen_efecto_orgsocial.efecto_id 
              JOIN orgsocial_regiongrupo 
                ON orgsocial_regiongrupo.orgsocial_id=cor1440_gen_efecto_orgsocial.orgsocial_id 
              JOIN sip_orgsocial 
                ON sip_orgsocial.id=cor1440_gen_efecto_orgsocial.orgsocial_id 
              WHERE ((cor1440_gen_efecto.fecha>='#{fini}' AND cor1440_gen_efecto.fecha<='#{ffin}') OR
                (cor1440_gen_efecto.fecha20>='#{fini}' AND cor1440_gen_efecto.fecha20<='#{ffin}') OR
                (cor1440_gen_efecto.fecha40>='#{fini}' AND cor1440_gen_efecto.fecha40<='#{ffin}') OR
                (cor1440_gen_efecto.fecha60>='#{fini}' AND cor1440_gen_efecto.fecha60<='#{ffin}') OR
                (cor1440_gen_efecto.fecha80>='#{fini}' AND cor1440_gen_efecto.fecha80<='#{ffin}') OR
                (cor1440_gen_efecto.fecha100>='#{fini}' AND cor1440_gen_efecto.fecha100<='#{ffin}'))
              AND sip_orgsocial.lineabase20182020
              AND cor1440_gen_efecto.indicadorpf_id='19'"
      ld2 = ActiveRecord::Base.connection.execute(base).to_a.map(&:values).flatten
      d2 = ld2.count
      datosint << {valor: d2, rutaevidencia: d2 == 0 ? '#' :
                   main_app.admin_regionesgrupo_path + '?filtro[busid]=' + 
                   ld2.join(',')}
      res = "SELECT SUM(m) AS suma FROM 
            (SELECT regiongrupo_id, MAX(p) AS m FROM 
            (SELECT regiongrupo_id, CASE 
                WHEN fecha100>='#{fini}' AND fecha100<='#{ffin}' THEN 1 
                WHEN fecha80>='#{fini}' AND fecha80<='#{ffin}' THEN 0.8
                WHEN fecha60>='#{fini}' AND fecha60<='#{ffin}' THEN 0.6
                WHEN fecha40>='#{fini}' AND fecha40<='#{ffin}' THEN 0.4
                WHEN fecha20>='#{fini}' AND fecha20<='#{ffin}' THEN 0.2
                ELSE 0
              END AS p FROM cor1440_gen_efecto
              JOIN cor1440_gen_efecto_orgsocial
                ON cor1440_gen_efecto.id=cor1440_gen_efecto_orgsocial.efecto_id 
              JOIN orgsocial_regiongrupo 
                ON orgsocial_regiongrupo.orgsocial_id=cor1440_gen_efecto_orgsocial.orgsocial_id 
              JOIN sip_orgsocial 
                ON sip_orgsocial.id=cor1440_gen_efecto_orgsocial.orgsocial_id 
              WHERE cor1440_gen_efecto.indicadorpf_id='19' 
              AND sip_orgsocial.lineabase20182020
            ) AS subcons GROUP BY regiongrupo_id) AS submax"
      resind = ActiveRecord::Base.connection.execute(res)
      resind = resind.first ? resind.first['suma'].to_i : 0
      return {resind: resind, datosint: datosint}
    end

    # Avance en E3I2 de Plan Trienal 2018-2020
    # idefs lista con identificación de efectos que aportan en el avance
    # mind Es objeto Cor1440Gen::Mindicadorpf con medición
    # fini Es fecha inicial de medición
    # ffin Es fecha final de medición
    def medir_indicador_efecto_tipo_22(idefs, mind, fini, ffin)
      datosint = []
      base = "SELECT id FROM cor1440_gen_efecto WHERE (
                (fecha100>='#{fini}' AND fecha100<='#{ffin}') OR
                (fecha80>='#{fini}' AND fecha80<='#{ffin}') OR
                (fecha60>='#{fini}' AND fecha60<='#{ffin}') OR
                (fecha40>='#{fini}' AND fecha40<='#{ffin}') OR
                (fecha20>='#{fini}' AND fecha20<='#{ffin}') OR
                (fecha>='#{fini}' AND fecha<='#{ffin}') 
              ) AND indicadorpf_id='22'"
      ld1 = ActiveRecord::Base.connection.execute(base).to_a.map(&:values).flatten
      d1 = ld1.count
      datosint << {valor: d1, rutaevidencia: d1 == 0 ? '#' :
                   cor1440_gen.efectos_path + '?filtro[busid]=' + 
                   ld1.join(',')}

      res = "SELECT SUM(p) AS r FROM 
            (SELECT CASE 
                WHEN fecha100>='#{fini}' AND fecha100<='#{ffin}' THEN 1 
                WHEN fecha80>='#{fini}' AND fecha80<='#{ffin}' THEN 0.8
                WHEN fecha60>='#{fini}' AND fecha60<='#{ffin}' THEN 0.6
                WHEN fecha40>='#{fini}' AND fecha40<='#{ffin}' THEN 0.4
                WHEN fecha20>='#{fini}' AND fecha20<='#{ffin}' THEN 0.2
                ELSE 0
              END AS p FROM cor1440_gen_efecto
              WHERE indicadorpf_id='22' 
            ) AS subcons"
      resind = ActiveRecord::Base.connection.execute(res).first['r'].to_f
      return {resind: resind, datosint: datosint}
    end



    # IG-FG-01 
    # Participacion efectiva en convocatorias
    def medir_indicador_otro_tipo_23(mind, fini, ffin)
      datosint = []
      eap = ::ApplicationHelper::ESTADOS_APROBADO.map { |l| "'#{l}'" }
      eap = eap.join(', ')
      base = Cor1440Gen::Proyectofinanciero.
        where('fechaformulacion >= ?', fini).
        where('fechaformulacion <= ?', ffin).
        where('respgp_id IS NOT NULL')
      cd1 = base.clone.where('estado IN (?)', 
                             ::ApplicationHelper::ESTADOS_APROBADO) 
      d1 = cd1.count
      evd1 = cd1.pluck('id')
      rutaev1 = d1 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        evd1.join(',')
      datosint << {valor: d1, rutaevidencia: rutaev1 }
      cd2 = base.clone
      d2 = cd2.count
      evd2 = cd2.pluck('id')
      datosint << {valor: d2, rutaevidencia: d2 == 0 ? '#' :
                   cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
                   evd2.join(',')}
      resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil;

      return {resind: resind, datosint: datosint, rutaevidencia: rutaev1}
    end


    # IG-FG-02
    def medir_indicador_otro_tipo_24(mind, fini, ffin)
      datosint = []
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
      rutaev = resind > 0 ? cor1440_gen.proyectosfinancieros_url +
        '?filtro[busid]=' + base.pluck(:id).join(',') : '#'
      return {resind: resind, datosint: datosint, rutaevidencia: rutaev}
    end

    # No medimos aun IG-FG-03
    # Porcentaje ejecutado de ingresos presupuestados 
    # Requiere información contable

    # IG-SC-01
    # Porcentaje de informes enviados a tiempo a financiadores
    def medir_indicador_otro_tipo_26(mind, fini, ffin)
      datosint = []

      base = ::Informenarrativo.where(
        'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL
                AND estado IN (?))', ::ApplicationHelper::ESTADOS_APROBADO).
      where('fechaplaneada>=?', fini).
      where('fechaplaneada<=?', ffin).
      where('fechareal<=(fechaplaneada + 7)')
      d1 = base.count
      idp1 = base.pluck(:proyectofinanciero_id)

      base2 = ::Informefinanciero.where(
        'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL
                AND estado IN (?))', ::ApplicationHelper::ESTADOS_APROBADO).
      where('fechaplaneada >= ?', fini).
      where('fechaplaneada <= ?', ffin).
      where('fechareal <= (fechaplaneada + 7)')
      d1 += base2.count
      idp1 = idp1 | base2.pluck(:proyectofinanciero_id)
      rutaev1 = d1 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        idp1.uniq.join(',')
      datosint << { valor: d1, rutaevidencia: rutaev1 }

      base3 = ::Informenarrativo.where(
        'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL
                AND estado IN (?))', ::ApplicationHelper::ESTADOS_APROBADO).
      where('fechaplaneada>=?', fini).
      where('fechaplaneada<=?', ffin)
      d2 = base3.count
      idp2 = base3.pluck(:proyectofinanciero_id)

      base4 = ::Informefinanciero.where(
        'proyectofinanciero_id IN (SELECT id 
                FROM cor1440_gen_proyectofinanciero 
                WHERE respgp_id IS NOT NULL
                AND estado IN (?))', ::ApplicationHelper::ESTADOS_APROBADO).
      where('fechaplaneada >= ?', fini).
      where('fechaplaneada <= ?', ffin)

      d2 += base4.count
      idp2 = idp2 | base4.pluck(:proyectofinanciero_id)
      datosint << {valor: d2, rutaevidencia: d2 == 0 ? '#' :
                   cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
                   idp2.uniq.join(',')}


      resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil
      return {resind: resind, datosint: datosint, rutaevidencia: rutaev1}
    end


    # IG-SC-02
    def medir_indicador_otro_tipo_27(mind, fini, ffin)
      datosint = []

      # Porcentaje de informes narrativos sin devoluciones
      base1 = ::Informenarrativo.
        where('proyectofinanciero_id IN (SELECT id ' +
              'FROM cor1440_gen_proyectofinanciero ' +
              'WHERE respgp_id IS NOT NULL)').
              where('fechareal >= ?', fini).
              where('fechareal <= ?', ffin).
              where("devoluciones != 't'")
      d1 = base1.count
      rutaev1 = d1 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        base1.pluck(:proyectofinanciero_id).uniq.join(',')
      datosint << { valor: d1, rutaevidencia: rutaev1 }

      base2 = ::Informenarrativo.
        where(
          'proyectofinanciero_id IN (SELECT id ' +
          'FROM cor1440_gen_proyectofinanciero ' +
          'WHERE respgp_id IS NOT NULL)').
          where('fechareal >= ?', fini).
          where('fechareal <= ?', ffin)
      d2 = base2.count
      rutaev2 = d2 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        base2.pluck(:proyectofinanciero_id).uniq.join(',')
      datosint << { valor: d2, rutaevidencia: rutaev2 }

      resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil
      return {resind: resind, datosint: datosint, rutaevidencia: rutaev1}
    end


    # IG-SC-03
    # Porcentaje de informes financieros sin devoluciones
    def medir_indicador_otro_tipo_28(idefs, mind, fini, ffin)
      datosint = []

      base1 = ::Informefinanciero.
        where( 'proyectofinanciero_id IN (SELECT id ' +
              'FROM cor1440_gen_proyectofinanciero ' +
              'WHERE respgp_id IS NOT NULL)').
              where('fechareal >= ?', fini).
              where('fechareal <= ?', ffin).
              where("devoluciones != 't'")
      d1 = base1.count
      rutaev1 = d1 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        base1.pluck(:proyectofinanciero_id).uniq.join(',')
      datosint << { valor: d1, rutaevidencia: rutaev1 }

      base2 = ::Informefinanciero.
        where( 'proyectofinanciero_id IN (SELECT id ' +
              'FROM cor1440_gen_proyectofinanciero ' +
              'WHERE respgp_id IS NOT NULL)').
              where('fechareal >= ?', fini).
              where('fechareal <= ?', ffin)
      d2 = base2.count
      rutaev2 = d2 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        base2.pluck(:proyectofinanciero_id).uniq.join(',')
      datosint << { valor: d2, rutaevidencia: rutaev2 }

      resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil
      return {resind: resind, datosint: datosint, rutaevidencia: rutaev1}
    end


    # IG-SC-04
    # Porcentaje de productos a  tiempo
    def medir_indicador_otro_tipo_33(mind, fini, ffin)
      datosint = []
      base = ::Productopf.
        where( 'proyectofinanciero_id IN (SELECT id ' +
              'FROM cor1440_gen_proyectofinanciero ' +
              'WHERE respgp_id IS NOT NULL ' +
              'AND estado IN (?))', 
              ::ApplicationHelper::ESTADOS_APROBADO).
              where('fechaplaneada>=?', fini).
              where('fechaplaneada<=?', ffin).
              where('fechareal<=(fechaplaneada + 7)')
      d1 = base.count
      idp1 = base.pluck(:proyectofinanciero_id)
      rutaev1 = d1 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        idp1.uniq.join(',')
      datosint << { valor: d1, rutaevidencia: rutaev1 }

      base3 = ::Productopf.
        where( 'proyectofinanciero_id IN (SELECT id ' +
              'FROM cor1440_gen_proyectofinanciero ' +
              'WHERE respgp_id IS NOT NULL '+
              'AND estado IN (?))', 
              ::ApplicationHelper::ESTADOS_APROBADO).
              where('fechaplaneada>=?', fini).
              where('fechaplaneada<=?', ffin)
      d2 = base3.count
      idp2 = base3.pluck(:proyectofinanciero_id)
      rutaev2 = d2 == 0 ? '#' :
        cor1440_gen.proyectosfinancieros_url + '?filtro[busid]=' + 
        idp2.uniq.join(',')
      datosint << { valor: d2, rutaevidencia: rutaev2 }

      resind = d2.to_f > 0 ? 100*d1.to_f/d2.to_f : nil
      return {resind: resind, datosint: datosint, rutaevidencia: rutaev1}
    end


    def amplia_contexto(contexto)
      contexto['Municipios_pdet'] = Sip::Municipio.where(
        'id IN (SELECT municipio_id FROM sip_etiqueta_municipio '\
        'WHERE etiqueta_id=15)'
      )

      return contexto
    end


    # Avance en O1I2 de Plan Trienal 2021-2023
    # idefs lista con identificación de efectos que aportan en el avance
    # mind Es objeto Cor1440Gen::Mindicadorpf con medición
    # fini Es fecha inicial de medición
    # ffin Es fecha final de medición
    def medir_indicador_efecto_tipo_42(idefs, mind, fini, ffin)
      datosint = []
      # Escuelas rurales
      base = "SELECT DISTINCT id FROM sip_orgsocial AS o
              JOIN public.lineabase_orgsocial AS lo ON o.id=lo.orgsocial_id
              JOIN sip_orgsocial_sectororgsocial AS so ON o.id=so.orgsocial_id
              WHERE lo.lineabase_id=2
              AND o.fechadeshabilitacion IS NULL
              AND so.sectororgsocial_id=22"
      ld1 = ActiveRecord::Base.connection.execute(base).to_a.map(&:values).
        flatten
      d1 = ld1.count
      datosint << {valor: d1, rutaevidencia: d1 == 0 ? '#' :
                   sip.orgsociales_path + '?filtro[busid]=' + 
                   ld1.join(',')}
      # Escuelas rurales donde se implementaron planes
      if idefs.count > 0
        base = "SELECT DISTINCT orgsocial_id FROM cor1440_gen_efecto_orgsocial
              WHERE efecto_id IN (#{idefs.join(',')})
              AND orgsocial_id IN (#{ld1.join(',')})"
        ld2 = ActiveRecord::Base.connection.execute(base).to_a.map(&:values).
          flatten
        d2 = ld2.count
      else
        d2 = 0
      end
      datosint << {valor: d2, rutaevidencia: d2 == 0 ? '#' :
                   sip.orgsociales_path + '?filtro[busid]=' + 
                   ld2.join(',')}
      resind = d1 > 0 ? d2*100/d1 : 0

      return {resind: resind, datosint: datosint}
    end

    # Avance en O3I2 de Plan Trienal 2021-2023
    # idacs lista con identificación de actividades que aportan en el avance
    # mind Es objeto Cor1440Gen::Mindicadorpf con medición
    # fini Es fecha inicial de medición
    # ffin Es fecha final de medición
    def medir_indicador_res_tipo_46(idacs, mind, fini, ffin)
      datosint=[]
      # Municipios PDET
      base = "SELECT DISTINCT id FROM sip_municipio AS m
              JOIN sip_etiqueta_municipio AS em ON m.id=em.municipio_id
              WHERE em.etiqueta_id=15
              AND m.fechadeshabilitacion IS NULL"
      ld1 = ActiveRecord::Base.connection.execute(base).to_a.map(&:values).
        flatten
      d1 = ld1.count
      datosint << {valor: d1, rutaevidencia: d1 == 0 ? '#' :
                   sip.admin_municipios_path + '?filtro[busid]=' + 
                   ld1.join(',')}

      # Municipios PDET donde se implementan estrategias
      base = "SELECT DISTINCT municipio_id FROM cor1440_gen_actividad AS a
              JOIN cor1440_gen_actividad_actividadpf AS aa
                ON aa.actividad_id=a.id
              WHERE aa.actividadpf_id=12
              AND a.id IN (#{idacs.join(',')})
      "
      if idacs.count > 0
        ld2 = ActiveRecord::Base.connection.execute(base).to_a.map(&:values).
          flatten
        d2 = ld2.count
      else
        d2 = 0
      end
      datosint << {valor: d2, rutaevidencia: d2 == 0 ? '#' :
                   sip.admin_municipios_path + '?filtro[busid]=' + 
                   ld2.join(',')}
      resind = d1 > 0 ? d2*100/d1 : 0

      return {resind: resind, datosint: datosint}
    end

  end
end
