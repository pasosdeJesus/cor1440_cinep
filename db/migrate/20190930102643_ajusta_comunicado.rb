class AjustaComunicado < ActiveRecord::Migration[6.0]
  def change
    add_index :comunicado, :nombre, unique: true
  end
end
