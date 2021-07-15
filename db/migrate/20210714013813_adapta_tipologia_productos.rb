class AdaptaTipologiaProductos < ActiveRecord::Migration[6.1]

  def up
    execute <<-SQL
      UPDATE tipoproductopf
        SET nombre='PUBLICACIÓN EN REVISTA NACIONAL' 
        WHERE nombre='PUBLICACIÓN' ;
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (15, 'CAJA DE HERRAMIENTAS', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (17, 'DOCUMENTO DE POLÍTICA PÚBLICA', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (18, 'EDUCATIVO / PEDAGÓGICO', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (19, 'LIBRO O CAPÍTULO REVISADO POR PARES', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (20, 'PUBLICACIÓN EN REVISTA INTERNACIONAL', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (21, 'REVISTA INSTITUCIONAL NOCHE Y NIEBLA', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (22, 'REVISTA INSTITUCIONAL CONTROVERSIA', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (23, 'REVISTA INSTITUCIONAL CIEN DIAS', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (24, 'SISTEMATIZACIÓN O ACTUALIZACIÓN DE DATOS EN BASE DE DATOS', 
        '2021-07-14', '2021-07-14', '2021-07-14');
      INSERT INTO tipoproductopf (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES
        (25, 'VARIABLE EN BASE DE DATOS O ACTUALIZACIÓN A ESTRUCTURA DE BASE DE DATOS', 
        '2021-07-14', '2021-07-14', '2021-07-14');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM tipoproductopf WHERE id>=15 AND id<=25;
      UPDATE tipoproductopf
        SET nombre='PUBLICACIÓN' 
        WHERE nombre='PUBLICACIÓN EN REVISTA NACIONAL' ;
    SQL
  end

end
