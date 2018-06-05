class CreaRegiongrupoDh < ActiveRecord::Migration[5.2]
  def up
    ldh = Sip::Grupo.where("nombre LIKE 'Línea Derechos Humanos%'").take
    if ldh.nil?
      raise "No se encontró grupo Línea Derechos Humanos"
    end
    execute <<-SQL
      INSERT INTO regiongrupo (id, nombre,  grupo_id, 
        fechacreacion, created_at, updated_at) 
        VALUES (10, 'COSTA ATLÁNTICA', '#{ldh.id}', '2018-06-04', 
          '2018-06-04', '2018-06-04');
      INSERT INTO regiongrupo (id, nombre,  grupo_id, 
        fechacreacion, created_at, updated_at) 
        VALUES (11, 'LLANOS', '#{ldh.id}', '2018-06-04', 
          '2018-06-04', '2018-06-04');
      INSERT INTO regiongrupo (id, nombre,  grupo_id, 
        fechacreacion, created_at, updated_at) 
        VALUES (12, 'SUR OCCIDENTE', '#{ldh.id}', '2018-06-04', 
          '2018-06-04', '2018-06-04');
      INSERT INTO regiongrupo (id, nombre,  grupo_id, 
        fechacreacion, created_at, updated_at) 
        VALUES (13, 'ANTIOQUIA', '#{ldh.id}', '2018-06-04', 
          '2018-06-04', '2018-06-04');
      INSERT INTO regiongrupo (id, nombre,  grupo_id, 
        fechacreacion, created_at, updated_at) 
        VALUES (14, 'CENTRO', '#{ldh.id}', '2018-06-04', 
          '2018-06-04', '2018-06-04');
      INSERT INTO regiongrupo (id, nombre,  grupo_id, 
        fechacreacion, created_at, updated_at) 
        VALUES (15, 'EJE CAFETERO', '#{ldh.id}', '2018-06-04', 
          '2018-06-04', '2018-06-04');
      INSERT INTO regiongrupo (id, nombre,  grupo_id, 
        fechacreacion, created_at, updated_at) 
        VALUES (16, 'EXTERIOR', '#{ldh.id}', '2018-06-04', 
          '2018-06-04', '2018-06-04');
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (10, 13); -- BOLÍVAR
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (10, 8); -- ATLÁNTICO
      
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (11, 50); -- META

      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (12, 41); -- HUILA

      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (13, 5); -- ANTIOQUIA
      
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (14, 27); -- CUNDINAMARCA
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (14, 11); -- BOGOTÁ
      
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (15, 63); -- QUINDIO
      
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, 
        sip_departamento_id) VALUES (16, 10000); -- EXTERIOR
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM regiongrupo_sip_departamento WHERE regiongrupo_id>='10' AND regiongrupo_id<='16';
      DELETE FROM regiongrupo WHERE id>=10 and id<=16;
    SQL

  end

end
