class ProyectofinancieroUsuario < ActiveRecord::Migration
  def change
    create_table :proyectofinanciero_usuario do |t|
      t.integer :proyectofinanciero_id, null: false
      t.integer :usuario_id
      t.integer :cargo_id, null: false

      t.timestamps null: false
    end
    add_foreign_key :proyectofinanciero_usuario, :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
    add_foreign_key :proyectofinanciero_usuario, :usuario, column: :usuario_id
    add_foreign_key :proyectofinanciero_usuario, :cargo, column: :cargo_id
  end
end
