class CreateAcpfuente < ActiveRecord::Migration[6.0]
  def change
    create_table :acpfuente do |t|
      t.integer :acp_id
      t.string :fuente, limit: 127
      t.string :pagina, limit: 63
      t.date :ffuente
    end
  end
end
