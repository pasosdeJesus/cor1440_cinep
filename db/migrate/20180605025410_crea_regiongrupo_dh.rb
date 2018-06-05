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


      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (10, 48);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (10, 7);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (11, 37);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (12, 32);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (13, 35);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (14, 27);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (14, 11);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (15, 63);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (15, 13);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (15, 41);
      INSERT INTO regiongrupo_sip_departamento (regiongrupo_id, sip_departamento_id) VALUES (16, 3);

    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM regiongrupo_sip_departamento WHERE regiongrupo_id>='10' AND regiongrupo_id<='16';
      DELETE FROM regiongrupo WHERE id>=10 and id<=16;
    SQL

  end

end
