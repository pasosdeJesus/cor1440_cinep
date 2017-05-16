class ParticularIniciativasDePaz < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_proyecto (id, nombre, 
        fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (150, 'HERRAMIENTAS PEDAGÓGICAS', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_proyecto (id, nombre, 
        fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (151, 'PRODUCTOS DE INVESTIGACIÓN', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_proyecto (id, nombre, 
        fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (152, 'SISTEMATIZACIÓN DE INFORMACIÓN DATAPAZ', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_proyecto (id, nombre, 
        fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (153, 'COLECCIÓN PAPELES DE PAZ', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_proyecto (id, nombre, 
        fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (154, 'INFORMES DATAPAZ', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_proyecto (id, nombre, 
        fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (155, 'ACOMPAÑAMIENTO A PROCESOS SOCIALES', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_proyecto (id, nombre, 
        fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (156, 'PARTICIPACIÓN EN REDES Y PLATAFORMAS SOCIALES Y POLÍTICAS', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_proyecto (id, nombre, fechainicio, fechacierre, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (157, 'RECOMENDACIONES A POLÍTICAS PÚBLICAS', '2017-03-31', null, '2017-03-31', null, '2017-03-31', '2017-03-31');
      
      INSERT INTO redactor (id, nombre,  fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('150', 'MESA SOCIAL POR LA PAZ', '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO redactor (id, nombre,  fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('151', 'PAZ COMPLETA', '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO redactor (id, nombre,  fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('152', 'MEDIATION SUPORT NETWORK ', '2017-03-31', null, '2017-03-31', '2017-03-31');

      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('150', 'TRABAJOS DE INVESTIGACIÓN', '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('151', 'SISTEMATIZACIÓN DE EXPERIENCIAS', '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('152', 'ANÁLISIS DE CONTEXTOS TERRITORIALES', '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('153', 'PRODUCCIÓN DE INFORMES PERIÓDICOS', '2017-03-31', null, '2017-03-31', '2017-03-31');
      INSERT INTO cor1440_gen_actividadtipo (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('154', 'ANÁLISIS DE DATOS ESTADÍSTICOS', '2017-03-31', null, '2017-03-31', '2017-03-31');


    SQL
  end
  def down
    execute <<-SQL
    DELETE FROM cor1440_gen_proyecto WHERE id>='150' AND id<='157';
    DELETE FROM redactor WHERE id>='150' AND id<='152';
    DELETE FROM cor1440_gen_actividadtipo WHERE id>='150' AND id<='154';
    SQL
  end
end
