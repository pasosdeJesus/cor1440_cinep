class EstadoOmision < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero SET estado='J' WHERE
        estado IS NULL;
      UPDATE cor1440_gen_proyectofinanciero SET dificultad='N' WHERE
        dificultad IS NULL;
      UPDATE cor1440_gen_proyectofinanciero SET fechaformulacion=fechainicio
        WHERE fechaformulacion IS NULL;
    SQL
  end

  def down
  end
end
