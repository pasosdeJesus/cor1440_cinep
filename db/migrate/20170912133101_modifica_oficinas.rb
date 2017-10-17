class ModificaOficinas < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
    UPDATE sip_oficina SET nombre = '507', observaciones='COMUNICACIONES' WHERE id='20';
    UPDATE sip_oficina SET nombre = '411', observaciones='DIRECCIÓN' WHERE id='21';
    UPDATE sip_oficina SET nombre = '410', observaciones='EQUIPO CIUDADANIA Y PAZ' WHERE id='21';
    UPDATE sip_oficina SET nombre = '512-513', observaciones='EQUIPO CONFLICTO, ESTADO Y DESARROLLO' WHERE id='23';
    UPDATE sip_oficina SET nombre = '302', observaciones='EQUIPO DERECHOS HUMANOS' WHERE id='24';
    UPDATE sip_oficina SET nombre = '503', observaciones='EQUIPO MOVILIZACIÓN, TERRITORIO E INTERCULTURALIDAD' WHERE id='25';
    UPDATE sip_oficina SET nombre = '403', observaciones='GERENCIA ADMINISTRATIVA Y FINANCIERA' WHERE id='26';
    UPDATE sip_oficina SET nombre = '404', observaciones='GERENCIA DE PROYECTOS' WHERE id='27';
    UPDATE sip_oficina SET nombre = '404A', observaciones='SISTEMA DE INFORMACIÓN GENERAL' WHERE id='28';

    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (30, 'BODEGA 1 PISO 1', 'EQUIPOS QUE FUNCIONAN', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (31, 'BODEGA 2 PISO 2', 'EQUIPOS QUE NO FUNCIONAN', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (40, '202', 'SJR COLOMBIA PROGRAMAS NACIONALES', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (41, '203', 'SJR COLOMBIA SUDIRECCIÓN Y PROGRAMAS', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (42, '203A', 'RECURSOS FÍSICOS Y TECNOLÓGICOS', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (43, '204', 'SJR COLOMBIA PROGRAMAS NACIONALES', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (44, '205', 'SJR COLOMBIA DIRECCIÓN NACIONAL', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (45, 'AUDITORIO PISO 2', 'AUDITORIO', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (46, 'BODEGA PISO 2', 'BODEGA DE LIBROS', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (47, 'CAFETERIA PISO 2', 'CAFETERIA', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (48, 'PORTERÍA PISO 2', 'PORTERÍA', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (49, 'RECEPCIÓN PISO 2', 'RECEPCIÓN', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (50, 'SALÓN DE SEMINARIO PISO 2', 'SALÓN DE SEMINARIO', '2017-09-12', '2017-09-12', '2017-09-12');

    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (60, '301', '', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (61, '302', 'DERECHOS HUMANOS', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (62, '303', 'BANCO DE DATOS DE DERECHOS HUMANOS', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (63, '304', 'SALA DE LECTURA', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (64, '305', 'ATENCIÓN BIBLIOTECA', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (65, '306', '', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (66, '307', '', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (67, '308', '', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (68, '309', '', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (69, '401-402', 'CONTABILIDAD', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (70, '403A', 'GERENCIA DE PROYECTOS', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (71, '404', 'GERENCIA DE PROYECTOS', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (72, '404A', 'SIG', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (73, '405', 'CENTRO DE DATOS', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (74, '406', 'IMPRESORA', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (75, '407', 'ESCUELA DE PAZ Y CONVIVENCIA CIUDADANA', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (76, '409', 'BANCO DE DATOS DDHH', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (77, '412', 'GESTIÓN HUMANA', '2017-09-12', '2017-09-12', '2017-09-12'); 
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (78, 'CAI PISO 4', 'GESTIÓN DE CALIDAD', '2017-09-12', '2017-09-12', '2017-09-12');

    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (80, '501', 'EQUIPO CONFLICTO Y ESTADO', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (81, '502', 'MOVIMIENTOS SOCIALES', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (82, '504', 'TIERRAS Y TERRITORIOS', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (83, '505', 'GESTIÓN DE PROYECTOS CENTROS SOCIALES', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (84, '506', 'PUBLICACIONES', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (85, '507', 'INCIDENCIA Y COMUNICACIONES', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (86, '508', 'INCIDENCIA Y COMUNICACIONES', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (87, '509', 'COMUNICACIÓN', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (88, '510', 'SIERRA NEVADA DE SANTA MARTA', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (89, '511', 'EDUPAZ - PORTICUS', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (90, '512-513', 'CONFLICTO Y ESTADO', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (91, '514', 'INICIATIVAS DE PAZ', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (92, '515-516', 'INICIATIVAS DE PAZ', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (93, '517', 'SUBDIRECCIÓN', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (94, '518-519', 'CHOCÓ / PACÍFICO', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (95, '520', 'CIUDADANÍA Y DESARROLLO', '2017-09-12', '2017-09-12', '2017-09-12');
    INSERT INTO sip_oficina (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES (96, 'CAI PISO 5', 'SALÓN REUNIONES', '2017-09-12', '2017-09-12', '2017-09-12');
    SQL
  end
  def down
    execute <<-SQL
    DELETE FROM sip_oficina WHERE id>='30' AND id<='96';
    SQL
  end
end
