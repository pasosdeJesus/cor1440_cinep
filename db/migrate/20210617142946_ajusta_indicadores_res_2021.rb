class AjustaIndicadoresRes2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_mindicadorpf 
        SET medircon=1,
        funcionresultado = 'cuenta(Actividades_contribuyentes)'
        WHERE id=25;
      INSERT INTO cor1440_gen_actividadpf_mindicadorpf 
        (actividadpf_id, mindicadorpf_id) VALUES 
        (11 , 25);
      UPDATE cor1440_gen_mindicadorpf 
        SET medircon=1,
        funcionresultado = 'cuenta(únicos(interseccion(columna(Actividades_contribuyentes, municipio),Municipios_PDET)))*100/cuenta(Municipios_PDET)'
        WHERE id=26;
      INSERT INTO cor1440_gen_actividadpf_mindicadorpf 
        (actividadpf_id, mindicadorpf_id) VALUES 
        (12 , 26);
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_actividadpf_mindicadorpf WHERE
        actividadpf IN (11,12);
      UPDATE cor1440_gen_mindicadorpf 
        SET medircon=2,
        funcionresultado = 'cuenta(Efectos_contribuyentes)'
        WHERE id IN (25,26)
        ;
    SQL
  end
end
