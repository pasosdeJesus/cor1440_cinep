class IncluyePlantillaUsuarios < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    INSERT INTO heb412_gen_plantillahcm (id, ruta, fuente, licencia, 
      vista, nombremenu, filainicial)
      VALUES (18, 'Plantillas_CRECER/listado_usuarios_CRECER.ods', 
        'Liliana Montaña', '', 'Usuario', 'Listado', '2' );
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (50, 18, 'id', 'AH');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (51, 18, 'nusuario', 'AG');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (52, 18, 'nombres', 'E');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (53, 18, 'apellidos', 'D');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (54, 18, 'tdocumento', 'A');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (55, 18, 'numerodocumento', 'B');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (56, 18, 'lugardocumento', 'C');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (57, 18, 'cargo', 'F');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (58, 18, 'grupos', 'G');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (59, 18, 'gruposesp', 'H');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (60, 18, 'ciudadlabora', 'I');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (61, 18, 'perfilprofesional', 'J');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (62, 18, 'numerocontrato', 'K');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (63, 18, 'tipocontrato', 'L');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (64, 18, 'niveleducacion', 'M');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (65, 18, 'profesion', 'N');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (66, 18, 'areaestudios', 'O');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (67, 18, 'procesogh', 'P');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (68, 18, 'sexonac', 'Q');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (69, 18, 'tiponomina', 'R');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (70, 18, 'salarioanterior', 'S');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (71, 18, 'salario', 'T');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (72, 18, 'vinculaciones', 'U');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (73, 18, 'fechaini_localizada', 'V');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (74, 18, 'fechafin_localizada', 'W');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (75, 18, 'fechanacb', 'X');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (76, 18, 'direccionresidencia', 'Y');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (77, 18, 'ciudadresidencia', 'Z');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (78, 18, 'telefonos', 'AA');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (79, 18, 'numhijos', 'AB');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (80, 18, 'numhijosmen12', 'AC');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (81, 18, 'empresaps', 'AD');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (82, 18, 'fondopensiones', 'AE');
    INSERT INTO heb412_gen_campoplantillahcm (id, plantillahcm_id,
      nombrecampo, columna) VALUES (83, 18, 'cajacompensacion', 'AF');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM heb412_gen_campoplantillahcm WHERE plantillahcm_id='18';
      DELETE FROM heb412_gen_plantillahcm WHERE id='18';
    SQL
  end
end
