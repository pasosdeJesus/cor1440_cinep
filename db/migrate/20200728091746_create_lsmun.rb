class CreateLsmun < ActiveRecord::Migration[6.0]
  def change
    create_table :lsmun do |t|
      t.integer :lsdep_id, null: false
      t.integer :orden, null: false
      t.integer :municipio_id, null: false
    end
    add_foreign_key :lsmun, :lsdep
    add_foreign_key :lsmun, :sip_municipio, column: :municipio_id
  end
end
