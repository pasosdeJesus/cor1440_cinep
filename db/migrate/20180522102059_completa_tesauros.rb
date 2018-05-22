class CompletaTesauros < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
     INSERT INTO sectoractor (id, nombre, 
      fechacreacion, created_at, updated_at) 
      VALUES ('19', 'ORGANIZACIÓN INTERGUBERNAMENTAL', 
        '2018-05-22', '2018-05-22', '2018-05-22');

      -- Caribe
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('20', '1122'); -- San José de Uré, Córdoba
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('20', '418'); -- Carmen de Bolívar, Bolívar
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('20', '759'); --María la Baja, Bolívar
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('20', '31'); --Cartagena, Bolívar
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('20', '745'); --Mahates, Bolívar
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('20', '859'); --Ovejas, Sucre
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('20', '52'); --Santa Marta, Magdalena

    -- Magdalena Medio
     INSERT INTO regiongrupo_sip_municipio (regiongrupo_id, sip_municipio_id)
      VALUES ('22', '1322'); --Tiquisio, Bolívar
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sectoractor WHERE id='19';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id='20' AND 
        sip_municipio_id = '1122';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id ='20' AND 
        sip_municipio_id = '418';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id ='20' AND 
        sip_municipio_id = '759';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id ='20' AND 
        sip_municipio_id = '31';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id ='20' AND 
        sip_municipio_id = '745';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id ='20' AND 
        sip_municipio_id = '859';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id ='20' AND 
        sip_municipio_id = '52';
      DELETE FROM regiongrupo_sip_municipio WHERE regiongrupo_id ='22' AND 
        sip_municipio_id = '1322';
    SQL
  end
end
