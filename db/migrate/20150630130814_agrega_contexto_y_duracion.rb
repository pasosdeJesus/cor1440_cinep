class AgregaContextoYDuracion< ActiveRecord::Migratio[4.2]
  def change
    add_column :cor1440_gen_actividad, :contexto, :string, limit: 5000
    add_column :cor1440_gen_actividad, :duracion, :integer
    add_column :cor1440_gen_actividad, :mduracion, :string, limit: 50
  end
end
