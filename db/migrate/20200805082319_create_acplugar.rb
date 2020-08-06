class CreateAcplugar < ActiveRecord::Migration[6.0]
  def change
    create_table :acplugar do |t|
      t.integer :acp_id, null: false
      t.integer :departamento_id, null: false
      t.integer :municipio_id
    end
  end
end
