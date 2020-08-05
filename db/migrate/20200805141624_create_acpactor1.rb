include Sip::MigracionHelper

class CreateAcpactor1 < ActiveRecord::Migration[6.0]
  def up
    create_table :acpactor1 do |t|
      t.string :nombre, limit: 500, null: false, collation: 'es_co_utf_8'
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion('acpactor1', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      1, 'SIN INFORMACIÓN',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      2,'Actores Internacionales',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      3,'Armados sin especificar',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      4,'Bandas y pandillas',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      5,'Entes privados',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      6,'Entidades mixtas y/o estatales',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      7,'Estado y entidades gubernamentales',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      8,'Fuerzas Armadas y de Policía',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      9,'Grupos de "limpieza social"',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      10,'Guerrillas',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      11,'Iglesias',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      12,'Narcotraficantes',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      13,'Organismos de control y vigilancia del Estado',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      14,'Órganos con potestad normativa',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      15,'Órganos gubernamentales ejecutores',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      16,'Órganos judiciales',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      17,'Paramilitares',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      18,'Partidos y movimientos políticos',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor1 (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (
      19,'Sectores y organizaciones sociales',
      '2020-08-05', '2020-08-05', '2020-08-05');
    SQL
  end

  def down
    drop_table :acpactor1
  end
end
