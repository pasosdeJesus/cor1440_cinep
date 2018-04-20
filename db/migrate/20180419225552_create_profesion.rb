class CreateProfesion < ActiveRecord::Migration[5.2]
  def change
    create_table :profesion do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.integer :areaestudios_id, default: 1
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end

    add_foreign_key :profesion, :areaestudios

    execute <<-SQL
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (1, 'SIN INFORMACIÓN', 1, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (2, 'ABOGADO/A', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (3, 'ADMINISTRADOR/A PUBLICO', 2, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (4, 'ANTROPOLOGO/A', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (5, 'ASISTENCIA EN ORGANIZACIÓN DE ARCHIVOS', 2, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (6, 'BACHILLER', 1, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (7, 'COMUNICADOR/A SOCIAL', 4, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (8, 'CONTADOR/A PUBLICO', 5, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (9, 'CONTADOR/A TECNICO', 5, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (10, 'DERECHOS HUMANOS', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (11, 'DISEÑADOR INDUSTRIAL', 11, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (12, 'ECONOMISTA', 7, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (13, 'ESTUDIANTE CIENCIA DE LA INFORMACION  BIBLIOTECOLOGIA', 1, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (14, 'ESTUDIANTE DE ADMINISTRACION DE EMPRESAS', 2, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (15, 'ESTUDIANTE DE COMERCIO INTERNACIONAL', 7, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (16, 'ESTUDIANTE DE COMUNICACIÓN', 4, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (17, 'ESTUDIANTE DE HISTORIA', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (18, 'FILOSOFO/A', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (19, 'TEOLOGO/A', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (20, 'GOBIERNO Y RELACIONES INTERNACIONALES', 2, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (21, 'HISTORIADOR/A', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (22, 'INGENIERO/A DE SISTEMAS ', 11, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (23, 'INGENIERIA FINANCIERA', 7, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (24, 'LICENCIADO/A EN EDUCACION BASICA', 8, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (25, 'LICENCIADO/A EN MATEMATICAS Y FISICA', 8, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (26, 'LICENCIADO/A EN FILOSOFIA Y CIENCIAS RELIGIOSAS', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (27, 'MATEMATICO/A', 6, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (28, 'INGENIERO/A DE SISTEMAS', 11, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (29, 'PERIODISMO', 4, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (30, 'POLITOLOGO/A', 1, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (31, 'SOCIOLOGO/A', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (32, 'TECNICO EN ASISTENCIA EN ORGANIZACIÓN DE ARCHIVOS', 1, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (33, 'TECNICO/A EN PERIODISMO', 4, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (34, 'TECNOLOGO/A EN SISTEMAS', 12, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (35, 'TRABAJADOR/A SOCIAL', 10, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (36, 'ESTUDIANTE DE CONTADURIA PUBLICA', 5, '2018-04-19', '2018-04-19', '2018-04-19');
      INSERT INTO profesion (id, nombre, areaestudios_id, fechacreacion, created_at, updated_at) 
      VALUES (37, 'ZOOTECNISTA', 3, '2018-04-19', '2018-04-19', '2018-04-19');
     SQL
  end

  def down
    drop_foreign_key :profesion, :areaestudios
    drop_table :profesion
  end
end
