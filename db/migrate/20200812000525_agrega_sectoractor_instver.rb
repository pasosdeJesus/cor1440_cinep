class AgregaSectoractorInstver < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO sip_sectoractor (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        125, 'INSTANCIA DE VERIFICACIÓN Y SEGUIMIENTO AL ACUERDO DE PAZ',
        '2020-08-11',  '2020-08-11',  '2020-08-11');
      SELECT setval('sip_sectoractor_id_seq', MAX(id)) FROM sip_sectoractor;
    SQL
    stciv = Sip::Grupo.where(nombre: 'STCIV').take
    execute <<-SQL
      INSERT INTO regiongrupo (id, nombre, grupo_id,
        fechacreacion, created_at, updated_at) VALUES (
        26, 'ZONA PDET CATATUMBO', #{stciv.id},
        '2020-08-11',  '2020-08-11',  '2020-08-11');
      INSERT INTO regiongrupo (id, nombre, grupo_id,
        fechacreacion, created_at, updated_at) VALUES (
        27, 'ZONA PDET PACÍFICO MEDIO', #{stciv.id},
        '2020-08-11',  '2020-08-11',  '2020-08-11');
      INSERT INTO regiongrupo (id, nombre, grupo_id,
        fechacreacion, created_at, updated_at) VALUES (
        28, 'ZONA PDET SUR DE CÓRDOBA', #{stciv.id},
        '2020-08-11',  '2020-08-11',  '2020-08-11');
      SELECT setval('regiongrupo_id_seq', MAX(id)) FROM regiongrupo;
    SQL

    execute <<-SQL
      UPDATE csivitema set nombre='Enfoque étnico' WHERE id=8;
      INSERT INTO csivitema (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        9, 'Enfoque de género', 
        '2020-08-11',  '2020-08-11',  '2020-08-11');
    SQL

    execute <<-SQL
      UPDATE csivinivelgeo SET observaciones='Regional. Puede ser veredal, municipal, departamental o Región PDET' WHERE id='4';
    SQL
  end


  def down
    execute <<-SQL
      DELETE FROM csivitema WHERE id=9;
      
      DELETE FROM regiongrupo WHERE id IN (26,27,28);

      DELETE FROM sip_sectoractor WHERE id=125;
    SQL
  end
end
