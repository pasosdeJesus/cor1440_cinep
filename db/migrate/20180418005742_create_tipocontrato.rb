class CreateTipocontrato < ActiveRecord::Migration[5.2]
  def up
    create_table :tipocontrato do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (2, 'CONTRATO DE APRENDIZAJE', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (3, 'CONTRATO HONORARIOS', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (4, 'CONTRATO LABORAL  T. FIJO', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (5, 'CONTRATO LABORAL  T. FIJO  1/2 T.', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (6, 'CONTRATO LABORAL  T. INDF.', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (7, 'CONVENIO INTERINST.', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (8, 'PASANTIA', '2018-04-17', '2018-04-17', '2018-04-17');
      INSERT INTO tipocontrato (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (9, 'VOLUNTARIO', '2018-04-17', '2018-04-17', '2018-04-17');
    SQL
  end

  def down
    drop_table :tipocontrato
  end
end
