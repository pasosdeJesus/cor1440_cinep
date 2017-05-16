class CreateContextoinv < ActiveRecord::Migration[5.0]
  def change
    create_table :contextoinv do |t|
      t.integer :usuario_id
      t.date :fechainicio
      t.date :fechafin
      t.integer :regiongrupo_id
      t.text  :contexto
    end
    add_foreign_key :contextoinv, :usuario
    add_foreign_key :contextoinv, :regiongrupo
  end
end
