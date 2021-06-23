class CambiaO3i12021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_mindicadorpf 
        SET medircon=2,
          funcionresultado='cuenta(Efectos_contribuyentes)'
        WHERE id=25;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_mindicadorpf 
        SET medircon=1,
          funcionresultado='cuenta(Actividades_contribuyentes)'
        WHERE id=25;
    SQL
  end
 
end
