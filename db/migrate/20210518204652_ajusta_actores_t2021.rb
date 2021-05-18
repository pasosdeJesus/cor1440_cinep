class AjustaActoresT2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      --Ya deberían estar
      INSERT INTO sip_sectoractor (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (120, 'JÓVENES', '2021-05-18', '2021-05-18', '2021-05-18')
        ON CONFLICT DO NOTHING;

      -- Nuevos
      INSERT INTO sip_sectoractor (id, nombre,
        fechacreacion, created_at, updated_at) VALUES (
        20, 'COMUNIDAD INTERNACIONAL: SISTEMA DE NACIONES UNIDAS. EMBAJADAS Y AGENCIAS DE COOPERACIÓN SOLIDARIA',
        '2021-05-18',  '2021-05-18',  '2021-05-18');
      INSERT INTO sip_sectoractor (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        21, 'EXCOMBATIENTES', 
        '2021-05-18',  '2021-05-18',  '2021-05-18');

    -- Amplia nombre
      UPDATE sip_sectoractor
        SET nombre='ACADEMIA: CENTRO DE INVESTIGACIÓN DE UNIVERSIDAD NACIONAL Y EXTRANJERA',
        fechadeshabilitacion=NULL
        WHERE id=2 AND nombre LIKE 'ACADEMIA%';

      INSERT INTO sip_sectoractor (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (116, 'COMUNIDAD EDUCATIVA', '2021-05-18', '2021-05-18', '2021-05-18')
        ON CONFLICT DO NOTHING;
      UPDATE sip_sectoractor SET nombre='COMUNIDAD EDUCATIVA (ESTUDIANTES, MAESTROS Y PADRES DE FAMILIA)'
        WHERE id=116 and nombre='COMUNIDAD EDUCATIVA';
      INSERT INTO sip_sectoractor (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (123, 'ENTIDADES PÚBLICAS', '2021-05-18', '2021-05-18', '2021-05-18')
        ON CONFLICT DO NOTHING;
      UPDATE sip_sectoractor SET nombre='ENTIDAD PÚBLICA: MINISTERIO, ALCALDÍA, GOBERNACIÓN. RAMA JUDICIAL. DEFENSORÍA DEL PUEBLO Y FUERZA PÚBLICA.'
        WHERE id=123 and nombre='ENTIDADES PÚBLICAS';
      UPDATE sip_sectoractor SET nombre='MEDIO DE COMUNICACIÓN, EMISORA COMUNITARIA Y PLATAFORMA DE COMUNICACIÓN E INCIDENCIA'
        WHERE id=15 and nombre='MEDIOS DE COMUNICACIÓN';

    -- Renombra
      UPDATE sip_sectoractor SET nombre='CAMPESINADO'
        WHERE id=103 and nombre='CAMPESINOS';
      UPDATE sip_sectoractor SET nombre='PUEBLO INDÍGENA'
        WHERE id=104 and nombre='INDÍGENAS';
      UPDATE sip_sectoractor SET nombre='COMUNIDAD Y LÍDERES/AS NEGROS/AS'
        WHERE id=105 and nombre='AFRO';
      UPDATE sip_sectoractor SET nombre='POBLACIÓN LGBTIQ+'
        WHERE id=107 and nombre='LGBT';
      UPDATE sip_sectoractor SET nombre='TRABAJADORES/AS, SINDICATO'
        WHERE id=108 and nombre='TRABAJADORES';
      UPDATE sip_sectoractor SET nombre='IGLESIA: CATÓLICA, MENONITA, LUTERANA Y EVANGÉLICA'
        WHERE id=112 and nombre='ORGANIZACIONES ECLESIALES';
      UPDATE sip_sectoractor SET nombre='DEFENSORES/AS DE DERECHOS HUMANOS, RED Y MOVIMIENTO DE DERECHOS HUMANOS, ORGANIZACIÓN DE VÍCTIMAS'
        WHERE id=114 and nombre='DERECHOS HUMANOS';
      INSERT INTO sip_sectoractor (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (119, 'AMBIENTALISTAS', '2021-05-18', '2021-05-18', '2021-05-18')
        ON CONFLICT DO NOTHING;
      UPDATE sip_sectoractor SET nombre='ORGANIZACIÓN AMBIENTALISTA Y DE DEFENSA DEL TERRITORIO'
        WHERE id=119 and nombre='AMBIENTALISTAS';

      INSERT INTO sip_sectoractor (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (121, 'JUNTAS DE ACCIÓN COMUNAL', '2021-05-18', '2021-05-18', '2021-05-18')
        ON CONFLICT DO NOTHING;
      UPDATE sip_sectoractor SET nombre='DIRIGENTES SOCIALES URBANOS, DE COMITÉS CÍVICOS, JUNTAS DE ACCIÓN COMUNAL.'
        WHERE id=121 and nombre='JUNTAS DE ACCIÓN COMUNAL';
      INSERT INTO sip_sectoractor (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (122, 'ASOCIACIONES PRODUCTIVAS', '2021-05-18', '2021-05-18', '2021-05-18')
        ON CONFLICT DO NOTHING;
      UPDATE sip_sectoractor SET nombre='SECTOR PRODUCTIVO'
        WHERE id=122 and nombre='ASOCIACIONES PRODUCTIVAS';
      INSERT INTO sip_sectoractor (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (124, 'REDES Y OBRAS DE LA COMPAÑÍA DE JESÚS', '2021-05-18', '2021-05-18', '2021-05-18')
        ON CONFLICT DO NOTHING;
      UPDATE sip_sectoractor SET nombre='RED DE LAS OBRAS DE LA COMPAÑÍA DE JESÚS EN COLOMBIA, LATINOAMÉRICA Y MUNDIAL Y ONG'
        WHERE id=124 and nombre='REDES Y OBRAS DE LA COMPAÑÍA DE JESÚS';

       -- Deshabilitar y homologa actores sociales que
       -- las tuvieran para agregar las nuevas
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-05-18' 
        WHERE id=17 and nombre='AGENCIA COOPERANTE/FINANCIADORA';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 20 FROM --COMUNIDAD INTERNACIONAL
        sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 17);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-05-18' 
        WHERE id=115 and nombre='CUERPO DIPLOMÁTICO ACREDITADO EN COLOMBIA';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 20 FROM  --COMUNIDAD INTERNACIONAL
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 115);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-05-18' 
        WHERE id=10 and nombre='EMPRESA PRIVADA';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 122 FROM  -- SECTOR PRODUCTIVO
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 10);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-05-18' 
        WHERE id=14 and nombre='ESTUDIANTES';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 116 FROM  -- COMUNIDAD EDUCATIVA
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 14);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-05-18' 
        WHERE id=5 and nombre='GOBIERNO';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 123 FROM  -- ENTIDADES PÚBLICAS
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 5);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=8 and nombre='GREMIOS';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 108 FROM  -- TRABAJADORES, SINDICATOS
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 8);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=9 and nombre='OBSERVATORIOS DE PROGRAMAS DE PAZ Y DESARROLLO';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 114 FROM  -- DERECHOS HUMANOS
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 9);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=7 and nombre='ONG INTERNACIONAL';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 20 FROM  -- COMUNIDAD INTERNACIONAL
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 7);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=12 and nombre='ORGANIZACIÓN ESTUDIANTIL';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 116 FROM  -- COMUNIDAD EDUCATIVA
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 12);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=19 and nombre='ORGANIZACIÓN INTERGUBERNAMENTAL';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 20 FROM  -- COMUNIDAD INTERNACIONAL
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 19);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=11 and nombre='ORGANIZACIÓN SINDICAL';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 108 FROM  -- TRABAJADORES, SINDICATOS
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 11);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=102 and nombre='ORGANIZACIÓN SINDICAL';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 123 FROM  -- ENTIDADES PÚBLICAS
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 102);
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=109 and nombre='VÍCTIMAS';
      INSERT INTO sip_actorsocial_sectoractor (actorsocial_id, sectoractor_id)
        (SELECT acs.actorsocial_id, 114 FROM  -- DERECHOS HUMANOS
          sip_actorsocial_sectoractor AS acs WHERE sectoractor_id = 109);


      -- Deshabilita sin homologar
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-05-18' 
        WHERE id=18 and nombre='FORMULA POLÍTICAS PÚBLICAS';
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-05-18' 
        WHERE id=125 and nombre='INSTANCIA DE VERIFICACIÓN Y SEGUIMIENTO AL ACUERDO DE PAZ';
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=6 and nombre='ONG NACIONAL';
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=4 and nombre='ORGANIZACIÓN DE BASE';
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=13 and nombre='POBLADORES URBANOS';
      UPDATE sip_sectoractor SET fechadeshabilitacion='2021-08-18' 
        WHERE id=118 and nombre='REDES SOCIALES Y PLATAFORMAS';

    SQL
  end

  def down
    execute <<-SQL
    SQL
  end
end
