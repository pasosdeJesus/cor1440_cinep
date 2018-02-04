class CreateNivelrelacion < ActiveRecord::Migration[5.1]
  def up
    create_table :nivelrelacion do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
    INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, created_at, updated_at) 
      VALUES (1, 'ACTOR DE SENTIDO', 'Trabajamos para ellos misionalmente, son beneficiarios', '2018-02-02', '2018-02-02', '2018-02-02');
    INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, created_at, updated_at) 
      VALUES (2, 'ACTOR DE MISIÓN', 'Trabajamos con ellos como pares para lo misional', '2018-02-02', '2018-02-02', '2018-02-02');
    INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, created_at, updated_at) 
      VALUES (3, 'ACTOR ESTRATEGICO', 'Pueden financiarnos o nos ayudan en incidencia', '2018-02-02', '2018-02-02', '2018-02-02'); 
    INSERT INTO nivelrelacion (id, nombre, observaciones, fechacreacion, created_at, updated_at) 
      VALUES (4, 'ACTOR DE INCIDENCIA', 'En quienes queremos influir para la toma de decisiones', '2018-02-02', '2018-02-02', '2018-02-02'); 
    SQL
  end

  def down
    drop_table :nivelrelacion
  end
end
