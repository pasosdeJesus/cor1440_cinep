include Sip::MigracionHelper

class CreateAcpactor2 < ActiveRecord::Migration[6.0]
  def up
    create_table :acpactor2 do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.integer :actor1_id, null: false
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :acpactor2, :acpactor1, column: :actor1_id
    cambiaCotejacion('acpactor2', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      1, 'SIN INFORMACIÓN', 1,
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '2', 'Académicos e Intelectuales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '3', 'Actores Internacionales sin especificar', '2',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '4', 'Adultos Mayores', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '5', 'Afrocolombianos', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '6', 'Águilas negras', '17',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '7', 'Alianzas de sectores sociales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '8', 'Ambientalistas', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '9', 'Armada Nacional', '8',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '10', 'Armados sin especificar', '3',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '11', 'Asalariados sin afiliación sindical', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '12', 'Asalariados', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '13', 'Asambleas departamentales', '14',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '14', 'Autodefensas Campesinas de Córdoba y Urabá', '17',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '15', 'Autodefensas Gaitanistas de Colombia', '17',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '16', 'Autodefensas Unidas de Colombia - AUC', '17',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '17', 'Bacrim', '17',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '18', 'Bandas y pandillas sin especificar', '4',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '19', 'Cabildos indígenas - Autoridades Indígenas', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '20', 'Cámara de Representantes', '14',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '21', 'Campesinos', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '22', 'Candidatos a cargos de elección popular', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '23', 'Coaliciones políticas y sociales', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '24', 'Comisarías - Intendencias', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '25', 'Comunales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '26', 'Comunidades virtuales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '27', 'Concejos municipales', '14',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '28', 'Congreso de la República', '14',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '29', 'Contraloría General de la República', '13',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '30', 'Corporaciones Autónomas regionales', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '31', 'Corte Constitucional', '16',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '32', 'Corte Suprema de Justicia', '16',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '33', 'Defensoría del Pueblo', '13',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '34', 'Del orden departamental', '6',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '35', 'Del orden distrital', '6',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '36', 'Del orden nacional', '6',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '37', 'Desempleados', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '38', 'Desmovilizados de la guerrilla', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '39', 'Desmovilizados de los paramilitares', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '40', 'Desmovilizados', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '41', 'Desplazados', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '42', 'Dirigentes políticos', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '43', 'ELN', '10',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '44', 'Ediles - Jales', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '45', 'Ejecutivo Departamental', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '46', 'Ejecutivo Distrital', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '47', 'Ejecutivo Municipal', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '48', 'Ejecutivo Nacional', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '49', 'Ejército Nacional', '8',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '50', 'Ejército Popular de Liberación - EPL', '10',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '51', 'Eln', '10',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '52', 'Empresas privadas', '5',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '53', 'Entes privados sin especificar', '5',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '54', 'Entidades culturales y/o deportivas', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '55', 'Entidades mixtas y/o estatales sin especificar', '6',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '56', 'Estado y entidades gubernamentales sin especificar', '7',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '57', 'Estudiantes Básica - Secundaria - Normalistas', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '58', 'Estudiantes Universitarios - Tecnológicos', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '59', 'Estudiantes', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '60', 'Exfuncionarios públicos', '8',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '61', 'FARC', '10',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '62', 'Fiscalías', '16',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '63', 'Fuerza Aérea', '8',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '64', 'Fuerzas Armadas y de Policía sin especificar', '8',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '65', 'Gobiernos extranjeros', '2',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '66', 'Gremios', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '67', 'Grupos de "limpieza social"', '9',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '68', 'Grupos Étnicos', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '69', 'Guerrillas sin especificar', '10',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '70', 'Iglesia Católica', '11',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '71', 'Iglesias sin especificar', '11',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '72', 'Indígenas', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '73', 'Iniciativas internacionales de Paz y DDHH', '2',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '74', 'Jóvenes', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '75', 'Jueces', '16',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '76', 'Jurisdicciones especiales', '16',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '77', 'M19', '10',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '78', 'Marcha Patriótica', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '79', 'Medios de comunicación', '5',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '80', 'Ministerio Público', '13',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '81', 'Mujeres', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '82', 'Narcotraficantes', '12',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '83', 'Niños - Niñas', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '84', 'ONG de DDHH y DIH', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '85', 'ONG y Agencias de cooperación', '2',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '86', 'ONG y Fundaciones', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '87', 'Obreros y trabajadores', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '88', 'Organismos de control y vigilancia del Estado sin especificar', '13',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '89', 'Organismos multilaterales', '2',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '90', 'Organizaciones Cívicas', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '91', 'Organizaciones Internacionales', '2',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '92', 'Organizaciones Laborales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '93', 'Organizaciones Sindicales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '94', 'Organizaciones por la paz', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '95', 'Órganos con potestad normativa sin especificar', '14',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '96', 'Órganos gubernamentales ejecutores sin especificar', '15',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '97', 'Órganos judiciales sin especificar', '16',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '98', 'Otras Iglesias', '11',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '99', 'Otras guerrillas', '10',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '100', 'Otros movimientos políticos', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '101', 'Otros partidos políticos', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '102', 'Padres de Familia', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '103', 'Paramilitares sin especificar', '17',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '104', 'Partidos y movimientos políticos sin especificar', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '105', 'Pensionados', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '106', 'Personas naturales', '5',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '107', 'Personerías Municipales', '13',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '108', 'Pobladores Urbanos', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '109', 'Pobladores urbano-rurales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '110', 'Policía Nacional', '8',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '111', 'Polo Democrático Alternativo', '18',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '112', 'Procuraduría General de la Nación', '13',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '113', 'Profesionales', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '114', 'Reclusos', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '115', 'Representaciones diplomáticas', '2',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '116', 'Sector educativo', '5',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '117', 'Sector salud', '5',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '118', 'Sectores LGBTI', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '119', 'Sectores y organizaciones sociales sin especificar', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '120', 'Senado de la República', '14',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '121', 'Trabajadores independientes', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '122', 'Tribunales Administrativos', '16',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '123', 'Víctimas de la violencia y familiares', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO acpactor2 (id, nombre, actor1_id,
      fechacreacion, created_at, updated_at) VALUES (
      '124', 'Viviendistas', '19',
      '2020-08-05', '2020-08-05', '2020-08-05');
    SQL
  end

  def down
    drop_table :acpactor2
  end
end
