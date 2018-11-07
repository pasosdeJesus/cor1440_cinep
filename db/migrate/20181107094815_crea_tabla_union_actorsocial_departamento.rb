class CreaTablaUnionActorsocialDepartamento < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sip_actorsocial, :sip_departamento, {
      table_name: 'actorsocial_departamento'
    }
    add_foreign_key :actorsocial_departamento, :sip_actorsocial
    add_foreign_key :actorsocial_departamento, :sip_departamento
    rename_column :actorsocial_departamento, :sip_actorsocial_id,
      :actorsocial_id
    rename_column :actorsocial_departamento, :sip_departamento_id,
      :departamento_id
  end
end
