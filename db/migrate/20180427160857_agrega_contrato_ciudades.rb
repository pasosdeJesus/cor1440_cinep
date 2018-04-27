class AgregaContratoCiudades < ActiveRecord::Migration[5.2]
  def change
    add_column :contrato, :ciudadresidencia, :string, limit: 127
    add_column :contrato, :ciudadlabora, :string, limit: 127
  end
end
