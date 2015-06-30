class CreaNucleoconflicto < ActiveRecord::Migration
  def up
    create_table :nucleoconflicto do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO nucleoconflicto(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (1, 'CULTURAS POLÍTICAS, IDENTIDADES Y DD-HH', '2015-06-30', '2015-06-30', '2015-06-30');
       INSERT INTO nucleoconflicto(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (2, 'RELACIONES ESTADO Y SOCIEDAD', '2015-06-30', '2015-06-30', '2015-06-30');
       INSERT INTO nucleoconflicto(id, nombre, fechacreacion, created_at, updated_at) 
        VALUES (3, 'ALTERNATIVAS AL DESARROLLO REGIONAL', '2015-06-30', '2015-06-30', '2015-06-30');
    SQL
  end

  def down
    drop_table :nucleoconflicto
  end
end
