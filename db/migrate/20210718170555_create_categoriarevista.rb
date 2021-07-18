class CreateCategoriarevista < ActiveRecord::Migration[6.1]
  def up
    create_table :categoriarevista do |t|
      t.string :nombre, limit: 500, null: false, collation: 'es_co_utf_8'
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end
    execute <<-SQL
      INSERT INTO categoriarevista (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN',
        '2021-07-18', '2021-07-18', '2021-07-18');
      INSERT INTO categoriarevista (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (2, 'A',
        '2021-07-18', '2021-07-18', '2021-07-18');
      INSERT INTO categoriarevista (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (3, 'A1',
        '2021-07-18', '2021-07-18', '2021-07-18');
      INSERT INTO categoriarevista (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (4, 'B',
        '2021-07-18', '2021-07-18', '2021-07-18');
      INSERT INTO categoriarevista (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (5, 'C',
        '2021-07-18', '2021-07-18', '2021-07-18');
      SELECT setval('categoriarevista_id_seq', 100);
    SQL
  end
  def down
    drop_table :categoriarevista
  end
end
