class OficinaPorOmision < ActiveRecord::Migration[5.0]
  def up
    change_column :usuario, :oficina_id, :integer, default: 1, null: true
  end
  def down
    change_column :usuario, :oficina_id, :integer
  end
end
