class AgreBusqunif < ActiveRecord::Migration[6.0]
  def change
    add_column :busqunif, :fuentes, :string, limit: 2048
    add_column :busqunif, :fechafuentes, :string, limit: 2048
  end
end
