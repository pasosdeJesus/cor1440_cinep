class CreateAcpfuente < ActiveRecord::Migration[6.0]
  def change
    create_table :acpfuente do |t|
      t.integer :acp_id, null: false
      t.string :fuente, limit: 127, null: false
      t.string :pagina, limit: 63
      t.date :ffuente, null: false
    end
  end
end
