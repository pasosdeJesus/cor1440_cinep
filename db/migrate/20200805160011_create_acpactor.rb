class CreateAcpactor < ActiveRecord::Migration[6.0]
  def change
    create_table :acpactor do |t|
      t.integer :acp_id, null: false
      t.string :actor3, limit: 500
      t.integer :actor2_id, null: false
      t.integer :papel_id, null: false
      t.integer :formap_id, null: false
      t.integer :nump
    end
    add_foreign_key :acpactor, :acpactor2, column: :actor2_id
    add_foreign_key :acpactor, :acppapel, column: :papel_id
    add_foreign_key :acpactor, :acpformap, column: :formap_id
  end
end
