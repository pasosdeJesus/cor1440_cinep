class AsociaCataccionEstrategia < ActiveRecord::Migration[6.0]
  def up
    add_column :acpcataccion, :estrategia_id, :integer
    add_foreign_key :acpcataccion, :acpestrategia, column: :estrategia_id
    [2, 4, 5, 6, 7, 12, 18].each do |id|
      a = Acpcataccion.find(id)
      a.estrategia_id = 2 # E1: Educar
      a.save
    end
    [14].each do |id|
      a = Acpcataccion.find(id)
      a.estrategia_id = 3 # E2: Organizar
      a.save
    end
    [8, 9, 11, 17].each do |id|
      a = Acpcataccion.find(id)
      a.estrategia_id = 4 # E3: Actuar políticamente
      a.save
    end
    [13, 16, 19].each do |id|
      a = Acpcataccion.find(id)
      a.estrategia_id = 5 # E4: Protestar
      a.save
    end
    [3, 10].each do |id|
      a = Acpcataccion.find(id)
      a.estrategia_id = 6 # E5: Resistir
      a.save
    end
    [15].each do |id|
      a = Acpcataccion.find(id)
      a.estrategia_id = 7 # No aplica
      a.save
    end
  end

  def down
    remove_column :acpcataccion, :estrategia_id
  end
end
