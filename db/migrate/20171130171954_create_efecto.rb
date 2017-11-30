class CreateEfecto < ActiveRecord::Migration[5.1]
  def change
    create_table :efecto do |t|
      t.integer :indicadorpf_id
      t.integer :actor_id
      t.date :fecha
    end
    add_foreign_key :efecto, :cor1440_gen_indicadorpf, column: :indicadorpf_id
    add_foreign_key :efecto, :actor, column: :actor_id
  end
end
