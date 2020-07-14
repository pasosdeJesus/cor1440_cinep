class DatosiniAcpestrategia < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO acpestrategia (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (1,'SIN INFORMACIÓN', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpestrategia (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (2,'E1: Educar', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpestrategia (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (3,'E2: Organizar', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpestrategia (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (4,'E3: Actuar políticamente', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpestrategia (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (5,'E4: Protestar', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpestrategia (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (6,'E5: Resistir', '', '2020-07-14', '2020-07-14', '2020-07-14');
      INSERT INTO acpestrategia (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (7,'No aplica', '', '2020-07-14', '2020-07-14', '2020-07-14');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM acpestrategia WHERE id>=1 AND id<=7;
    SQL
  end
end


