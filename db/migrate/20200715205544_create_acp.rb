class CreateAcp < ActiveRecord::Migration[6.0]
  def change
    create_table :acp do |t|
      t.integer :cataccion_id, null: false, default: 1
      t.date :fini, null: false
      t.date :ffin
      t.integer :confr
      t.integer :cobertura_id, null: false, default: 1
      t.integer :motivo_id, null: false, default: 1
      t.string :descripcion, limit: 5000, null: false
    end
    add_foreign_key :acp, :acpcataccion, column: :cataccion_id
    add_foreign_key :acp, :acpcobertura, column: :cobertura_id
    add_foreign_key :acp, :acpmotivo, column: :motivo_id
  end
end
