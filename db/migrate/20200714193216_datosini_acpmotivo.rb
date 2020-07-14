class DatosiniAcpmotivo < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (1,'SIN INFORMACIÓN', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (2,'Amenazas y extorsiones', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (3,'Asesinatos, masacres y desapariciones', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (4,'Ataques a población y/o bienes civiles', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (5,'Búsqueda de alternativas para la paz', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (6,'Celebración de un motivo público', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (7,'Concertación y organizaciones para la paz (en apoyo a procesos de paz)', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (8,'Concertación y organización para la paz', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (9,'Conmemoraciones de hechos de paz', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (10,'Conmemoraciones de hechos de violencia', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (11,'Consolidación de acuerdos de paz', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (12,'Contra una política estatal de orden público', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (13,'Debate y/o apoyo a proceso de paz o negociación', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (14,'Exigencia cumplimiento de acuerdos', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (15,'Impulso de diálogos o negociaciones locales y regionales de paz', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (16,'Inseguridad y violencia generalizada', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (17,'Otras violencias', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (18,'Otros motivos', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (19, 'Por conexión con evento internacional', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (20, 'Presencia y accionar de un grupo guerrillero', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (21, 'Presencia y accionar de un grupo paramilitar', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (22, 'Promoción de la paz', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (23, 'Represión y violación de DDHH', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (24, 'SIN INFORMACIÓN', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (25, 'Secuestros y retenciones', '', '2020-07-13', '2020-07-13', '2020-07-13');
      SELECT setval('acpmotivo_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM acpmotivo WHERE id>=1 AND id<=25;
    SQL
  end
end

