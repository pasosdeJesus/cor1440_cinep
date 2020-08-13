class AmpliaLsDescripcion < ActiveRecord::Migration[6.0]
  def up
    change_column :ls, :descripcion, :string, limit: 6000
    change_column :lsdep, :descripcion, :string, limit: 6000
  end
  def down
    change_column :ls, :descripcion, :string, limit: 5000
    change_column :lsdep, :descripcion, :string, limit: 5000
  end
end
