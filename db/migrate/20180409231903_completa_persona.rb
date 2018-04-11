class CompletaPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :sip_persona, :lugardocumento, :string, limit: 127
    
    add_column :usuario, :direccionresidencia, :string, limit: 255
    add_column :usuario, :numhijos, :integer, default: 0
    add_column :usuario, :numhijosmen12, :integer, default: 0
    add_column :usuario, :labdepartamento_id, :integer
    add_foreign_key :usuario, :sip_departamento, column: :labdepartamento_id
    add_column :usuario, :labmunicipio_id, :integer
    add_foreign_key :usuario, :sip_municipio, column: :labmunicipio_id
  end
end
