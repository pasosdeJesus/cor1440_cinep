class AgregaMindicadores < ActiveRecord::Migration[5.1]
  def up
    add_column :cor1440_gen_mindicadorpf, :meta, :float
    change_column :cor1440_gen_mindicadorpf, :frecuenciaanual, :string, 
      limit: 128
    execute <<-SQL
      SELECT pg_catalog.setval('cor1440_gen_campotind_id_seq', 1001, false);
      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, formulacion, 
        frecuenciaanual, created_at, updated_at, descd1, descd2, meta)
        VALUES (1, 19, 23, 
        '(Numero de proyectos aprobados / Numero de convocatorias en la que participamos)*100', 
        2, '2018-02-05', '2018-02-05', 'Formulados', 'Aprobados', '60');

      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, formulacion, frecuenciaanual, 
        created_at, updated_at, descd1, meta)
        VALUES (2, 19, 24, 
        'No. de convocatorios en las que participamos',
        '1', '2018-02-05', '2018-02-05', 
        'Convocatorias en las que participamos', '30');

      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, formulacion, frecuenciaanual, 
        created_at, updated_at, descd1, descd2, meta)
        VALUES (3, 19, 25, 
        '(Total del presupuesto del plan trienal ejecutado / Presupuesto plan trienal)*100',
        '0,33', '2018-02-05', '2018-02-05', 
        'Ejecución', 'Presupuesto', '80');

      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, formulacion, frecuenciaanual, 
        created_at, updated_at, descd1, descd2, meta)
        VALUES (4, 19, 26, 
        '(No. de informes enviados a financiadores en el tiempo requerido / No. de informes enviados a financiadores)*100',
        '2', '2018-02-05', '2018-02-05', 
        'No. de informes enviados a financiadores en el tiempo requerido', 
        'No. de informes enviados a financiadores', '80');

      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, formulacion, frecuenciaanual, 
        created_at, updated_at, descd1, descd2, meta)
        VALUES (5, 19, 27, 
        '(No. de informes narrativos devueltos por financiadores / No. de informes enviados a financiadores)*100',
        '2', '2018-02-05', '2018-02-05', 
        'No. de informes narrativos devueltos por financiadores', 
        'No. de informes enviados a financiadores', '2');

      INSERT INTO cor1440_gen_mindicadorpf (id, proyectofinanciero_id, 
        indicadorpf_id, formulacion, frecuenciaanual, 
        created_at, updated_at, descd1, descd2, meta)
        VALUES (6, 19, 28, 
        '(No. de informes financieros devueltos por financiadores / No. de informes enviados a financiadores)*100',
        '2', '2018-02-05', '2018-02-05', 
        'No. de informes financieros devueltos por financiadores', 
        'No. de informes enviados a financiadores', '2');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM cor1440_gen_mindicadorpf WHERE id>='1' and id<='6';
    SQL
    execute <<-SQL
      ALTER TABLE cor1440_gen_mindicadorpf ALTER COLUMN frecuenciaanual 
        TYPE integer USING frecuenciaanual::integer;
    SQL
    remove_column :cor1440_gen_mindicadorpf, :meta
  end
end
