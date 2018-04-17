class HomologaPerfil < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cargo SET nombre='PROFESIONAL 2' where nombre='PROFESIONAL P2';
      UPDATE cargo SET nombre='PROFESIONAL 3' where nombre='PROFESIONAL P3';
      UPDATE cargo SET nombre='PROFESIONAL 4' where nombre='PROFESIONAL P4';
      UPDATE cargo SET nombre='PROFESIONAL 5' where nombre='PROFESIONAL P5';
      UPDATE proyectofinanciero_usuario SET 
        perfilprofesional_id=perfilprofesional.id,
        cargo_id=1
        FROM cargo, perfilprofesional WHERE 
          cargo.nombre = perfilprofesional.nombre AND 
          cargo_id=cargo.id;
      UPDATE cargo SET fechadeshabilitacion='2018-04-16' where
      nombre IN ('ASISTENTE 1', 'ASISTENTE 2', 'ASISTENTE 3', 'ASISTENTE 4',
        'ASISTENTE 5', 'PROFESIONAL 1', 'PROFESIONAL 2', 'PROFESIONAL 3',
        'PROFESIONAL 4', 'PROFESIONAL 5');
    SQL
  end

  def down

  end
end
