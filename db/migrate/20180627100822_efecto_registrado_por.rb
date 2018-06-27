class EfectoRegistradoPor < ActiveRecord::Migration[5.2]
  def change
    add_column :efecto, :registradopor_id, :integer
    add_foreign_key :efecto, :usuario, column: :registradopor_id
  end
end
