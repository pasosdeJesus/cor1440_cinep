class IniciaPerfileprofesional < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(1, 'SIN INFORMACIÓN', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(2, 'ANALISTA 1', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(3, 'ANALISTA 2', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(4, 'ANALISTA 3', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(5, 'ANALISTA 4', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(6, 'ANALISTA 5', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(7, 'PROFESIONAL 1', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(8, 'PROFESIONAL 2', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(9, 'PROFESIONAL 3', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(10, 'PROFESIONAL 4', '2018-04-14', '2018-04-14', '2018-04-14');
      INSERT INTO perfilprofesional (id, nombre, fechacreacion, created_at, updated_at)
        VALUES(11, 'PROFESIONAL 5', '2018-04-14', '2018-04-14', '2018-04-14');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM perfilprofesional WHERE id>='1' AND id<='11';
    SQL
  end
end
