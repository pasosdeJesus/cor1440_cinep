class ConectaMotivoCatmotivo < ActiveRecord::Migration[6.0]
  def up
    add_column :acpmotivo, :catmotivo_id, :integer
    add_foreign_key :acpmotivo, :acpcatmotivo, column: :catmotivo_id
    [2, 3, 4, 7, 11, 13, 17, 18, 21, 22, 24, 25].each do |id|
      a = Acpmotivo.find(id)
      a.catmotivo_id = 1 #Paz negativa
      a.save
    end
    [8, 12, 14, 15, 16].each do |id|
      a = Acpmotivo.find(id)
      a.catmotivo_id = 2 # Paz positiva: negociaciones
      a.save
    end
    [5, 9, 10].each do |id|
      a = Acpmotivo.find(id)
      a.catmotivo_id = 3 # Paz positiva: búsqueda de alternativas
      a.save
    end
    [6, 19, 20, 23].each do |id|
      a = Acpmotivo.find(id)
      a.catmotivo_id = 4 # Paz positiva: promición de la paz
      a.save
    end

  end

  def down
    remove_column :acpmotivo, :catmotivo_id
  end
end
