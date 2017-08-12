class EstadoOmision < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero SET estado='J' WHERE
        estado IS NULL;
    SQL
  end

  def down
  end
end
