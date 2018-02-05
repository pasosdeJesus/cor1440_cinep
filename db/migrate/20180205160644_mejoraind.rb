class Mejoraind < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_indicadorpf SET indicador='Participación efectiva en las convocatorias' WHERE id='23';
    SQL
  end
  def down
  end
end
