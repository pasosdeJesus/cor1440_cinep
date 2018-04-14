class CompletaCargo < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('8', 'ASESOR ASISTENTE', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('9', 'ASESOR AUXILIAR 1', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('10', 'ASESOR AUXILIAR 2', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('11', 'ASESOR DE PROYECTO', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('12', 'ASESOR JUNIOR DE INF. POLITICA Y PEDAG.', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('13', 'ASESORA ASISTENTE', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('14', 'ASESORA ASISTENTE EN PUBLICACIONES', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('15', 'ASESORA EN COMUNICACIÓN ORG.', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('16', 'ASISTENTE DE  GESTION HUMANA', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('17', 'ASISTENTE DE INVESTIGACION', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('18', 'ASISTENTE DE PRODUCCION RADIAL', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('19', 'ASISTENTE DE PROYECTOS', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('20', 'ASISTENTE DE RECURSOS FISICOS', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('21', 'AUXILIAR 1 ARCHIVO DE PRENSA B.D.', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('22', 'AUXILIAR DE ARCHIVO', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('23', 'AUXILIAR DE BIBLIOTECA', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('24', 'AUXILIAR DE CONTABILIDAD', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('25', 'AUXILIAR DE PROYECTO', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('26', 'CONTADOR ASISTENTE', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('27', 'CONTADORA', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('28', 'CONTRATISTA', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('29', 'COORDINADOR DE PROYECTO', '2018-04-14', '2018-04-14', '2018-04-14');  
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('30', 'COORDINADORA DE PUBLICACIONES', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('31', 'COORDINADORA PEDAGOGICA', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('32', 'DIRECTOR GENERAL', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('33', 'GERENTE ADMINISTRATIVA Y FINANCIERA', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('34', 'GERENTE DE PROYECTOS', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('35', 'INVESTIGADOR ASISTENTE', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('36', 'INVESTIGADOR ASISTENTE 1', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('37', 'INVESTIGADOR AUXILIAR 1', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('38', 'INVESTIGADOR AUXILIAR 2', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('39', 'INVESTIGADOR JUNIOR', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('40', 'INVESTIGADOR JUNIOR', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('41', 'MENSAJERO', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('42', 'OFICIAL DE PROYECTOS', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('43', 'SUBDIRECTOR GENERAL', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('44', 'TECNOLOGO EN SISTEMAS', '2018-04-14', '2018-04-14', '2018-04-14'); 
      INSERT INTO cargo(id, nombre, fechacreacion, created_at, updated_at) VALUES ('45', 'TESORERA', '2018-04-14', '2018-04-14', '2018-04-14');
      SQL
  end

  def down
    execute <<-SQL
      DELETE FROM cargo WHERE id>='8' AND id<='45';
    SQL
  end
end
