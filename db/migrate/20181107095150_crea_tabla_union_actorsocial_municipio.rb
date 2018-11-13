class CreaTablaUnionActorsocialMunicipio < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sip_actorsocial, :sip_municipio, {
      table_name: 'actorsocial_municipio'
    }
    add_foreign_key :actorsocial_municipio, :sip_actorsocial
    add_foreign_key :actorsocial_municipio, :sip_municipio
    rename_column :actorsocial_municipio, :sip_actorsocial_id,
      :actorsocial_id
    rename_column :actorsocial_municipio, :sip_municipio_id,
      :municipio_id
  end
end
