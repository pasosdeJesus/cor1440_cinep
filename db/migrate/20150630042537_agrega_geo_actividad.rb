class AgregaGeoActividad < ActiveRecord::Migration
  def change
    add_column :cor1440_gen_actividad, :departamento_id, :integer
    add_column :cor1440_gen_actividad, :municipio_id, :integer
    add_foreign_key :cor1440_gen_actividad, :sip_departamento, 
      column: 'departamento_id'
    add_foreign_key :cor1440_gen_actividad, :sip_municipio, 
      column: 'municipio_id'
  end
end
