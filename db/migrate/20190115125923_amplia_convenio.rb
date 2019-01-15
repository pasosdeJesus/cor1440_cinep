class AmpliaConvenio < ActiveRecord::Migration[5.2]
  def change
    add_column :convenio, :responsable_id, :integer
    add_foreign_key :convenio, :usuario,
      column: :responsable_id
    add_column :convenio, :observaciones, :string, limit: 5000
  end
end
