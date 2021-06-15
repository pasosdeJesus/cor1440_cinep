class RenActorsocialOrgsocial < ActiveRecord::Migration[6.1]
  def change

    rename_table :actorsocial_departamento, :departamento_orgsocial
    rename_table :actorsocial_grupo, :grupo_orgsocial
    rename_table :actorsocial_municipio, :municipio_orgsocial
    rename_table :actorsocial_regiongrupo, :orgsocial_regiongrupo
    rename_table :actorsocial_csivitema, :csivitema_orgsocial
    rename_table :lineabase_organizacionsocial, :lineabase_orgsocial
    rename_column :lineabase_orgsocial, :organizacionsocial_id, :orgsocial_id
    rename_column :csivitema_orgsocial, :actorsocial_id, :orgsocial_id
    rename_column :departamento_orgsocial, :actorsocial_id, :orgsocial_id
    rename_column :grupo_orgsocial, :actorsocial_id, :orgsocial_id
    rename_column :municipio_orgsocial, :actorsocial_id, :orgsocial_id
    rename_column :orgsocial_regiongrupo, :actorsocial_id, :orgsocial_id

  end
end
