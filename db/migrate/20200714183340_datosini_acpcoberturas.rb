class DatosiniAcpcoberturas < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (1,'SIN INFORMACIÓN', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (2,'Con participación nacional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (3,'Con participación nacional e internacional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (4,'De carácter nacional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (5,'De impacto internacional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (6,'De impacto nacional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (7,'Departamental', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (8,'Distrital', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (9,'Internacional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (10,'Local', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (11,'Municipal', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (12,'Nacional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (13,'Regional', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpcobertura (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (14,'Submunicipal', '', '2020-07-14', '2020-07-14', '2020-07-14');
      SELECT setval('acpcobertura_id_seq', 100);

    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM acpcobertura WHERE id>=1 AND id<=14;
    SQL
  end
end


