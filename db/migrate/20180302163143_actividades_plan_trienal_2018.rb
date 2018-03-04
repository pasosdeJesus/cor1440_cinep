class ActividadesPlanTrienal2018 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    SELECT pg_catalog.setval('cor1440_gen_actividadpf_id_seq', 101, true);

    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (20, 'FOROS DE DISCUSIÓN', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (21, 'TALLERES Y ESPACIOS DE CAPACITACIÓN', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (22, 'PUBLICACIONES', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (23, 'ESTUDIOS E INFORMES', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (24, 'VISITAS DE CAMPO', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (25, 'PROGRAMAS DE RADIO', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (26, 'DESARROLLO DE REDES', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (27, 'SISTEMATIZACIÓN DE EXPERIENCIAS', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (28, 'PRODUCTOS AUDIOVISUALES', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (29, 'CAMPAÑAS', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (30, 'PLANES DE PROTECCIÓN', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');
    INSERT INTO cor1440_gen_actividadtipo (id, nombre, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at)
      VALUES (31, 'REPRESENTACIÓN EN ESPACIOS INTERNACIONALES (SEMINARIOS, ASAMBLEAS, PONENCIAS)', '', 
      '2018-03-03', null, '2018-03-03', '2018-03-03');


    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (20, 18, 'FOROS', 'FOROS DE DISCUSIÓN', '', NULL, 20);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (21, 18, 'TALLERES', 'TALLERES Y ESPACIOS DE CAPACITACIÓN', '', NULL, 21);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (22, 18, 'PUBLICACIONES', 'PUBLICACIONES', '', NULL, 22);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (23,18, 'INFORMES',  'ESTUDIOS E INFORMES', '', NULL, 23);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (24, 18, 'VISITAS', 'VISITAS DE CAMPO', '', NULL, 24);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (25, 18, 'RADIO', 'PROGRAMAS DE RADIO', '', NULL, 25);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (26, 18, 'REDES', 'DESARROLLO DE REDES', '', NULL, 26);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (27, 18, 'SISTEMATIZACIÓN', 'SISTEMATIZACIÓN DE EXPERIENCIAS', '',NULL, 27); 
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (28, 18, 'AUDIOVISUAL', 'PRODUCTOS AUDIOVISUALES', '', NULL, 28);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (29, 18, 'CAMPAÑAS', 'CAMPAÑAS', '', NULL, 29);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (30, 18, 'PROTECCIÓN', 'PLANES DE PROTECCIÓN', '', NULL, 30);
    INSERT INTO cor1440_gen_actividadpf (id, proyectofinanciero_id,
      nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id)
      VALUES (31, 18, 'INTERNACIONAL', 
      'REPRESENTACIÓN EN ESPACIOS INTERNACIONALES (SEMINARIOS, ASAMBLEAS, PONENCIAS)', '', NULL, 31);


    SQL
  end

  def down
    execute <<-SQL
    DELETE FROM cor1440_gen_actividadpf WHERE id>='20' AND id<='31';
    DELETE FORM cor1440_gen_actividadtipo WHERE id>='20' AND id<='31';
    SQL
  end
end
