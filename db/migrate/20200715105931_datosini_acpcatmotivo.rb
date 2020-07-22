class DatosiniAcpcatmotivo < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO acpcatmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (1,'Paz negativa: denuncia y/o rechazo del conflicto armado, la violencia y las violaciones a los DDHH y el DIH', '', '2020-07-15', '2020-07-15', '2020-07-15');
      INSERT INTO acpcatmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (2,'Paz positiva: negociaciones y procesos de paz', '', '2020-07-15', '2020-07-15', '2020-07-15');
      INSERT INTO acpcatmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (3,'Paz positiva: búsqueda de alternativas', '', '2020-07-15', '2020-07-15', '2020-07-15');
      INSERT INTO acpcatmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (4,'Paz positiva: promoción de la paz', '', '2020-07-15', '2020-07-15', '2020-07-15');

        SELECT setval('acpcatmotivo_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM acpcatmotivo WHERE id>=1 AND id<=4;
    SQL
  end
end
