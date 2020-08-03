class AgregaCreacionApLs < ActiveRecord::Migration[6.0]
  def change
    add_column :acp, :created_at, :timestamp
    add_column :acp, :updated_at, :timestamp
    add_column :ls, :created_at, :timestamp
    add_column :ls, :updated_at, :timestamp
    add_column :ls, :arch_imp, :string, limit: 512
    add_column :ls, :filaini_imp, :integer
    add_column :ls, :filafin_imp, :integer
  end
end
