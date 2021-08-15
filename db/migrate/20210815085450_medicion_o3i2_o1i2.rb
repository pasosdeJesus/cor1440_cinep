class MedicionO3i2O1i2 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_tipoindicador (
        id, nombre, medircon, fechacreacion, fechadeshabilitacion, 
        created_at, updated_at) VALUES (
          42, 'T2021-O1.I2','2', '2021-08-15', NULL, 
          '2021-08-15','2021-08-15'
        );
      UPDATE cor1440_gen_indicadorpf 
        SET tipoindicador_id=42
        WHERE id=36;
      UPDATE cor1440_gen_mindicadorpf
        SET funcionresultado=''
        WHERE id=22;

      INSERT INTO cor1440_gen_tipoindicador (
        id, nombre, medircon, fechacreacion, fechadeshabilitacion, 
        created_at, updated_at) VALUES (
          46, 'T2021-O3.I2','1', '2021-08-15', NULL, 
          '2021-08-15','2021-08-15'
        );
      UPDATE cor1440_gen_indicadorpf 
        SET tipoindicador_id=46
        WHERE id=40;
      UPDATE cor1440_gen_mindicadorpf
        SET funcionresultado=''
        WHERE id=26;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_mindicadorpf
        SET funcionresultado='1'
        WHERE id=26;
      UPDATE cor1440_gen_indicadorpf 
        SET tipoindicador_id=NULL
        WHERE id=40;
      DELETE FROM cor1440_gen_tipoindicador WHERE id=46;

      UPDATE cor1440_gen_mindicadorpf
        SET funcionresultado='1'
        WHERE id=262
      UPDATE cor1440_gen_indicadorpf 
        SET tipoindicador_id=NULL
        WHERE id=36;
      DELETE FROM cor1440_gen_tipoindicador WHERE id=42;
    SQL
  end
end
