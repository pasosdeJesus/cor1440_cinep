class CreaGrupoSubgrupo < ActiveRecord::Migration[5.1]
  def change
    create_table :grupo_subgrupo do |t|
      t.integer :grupo_id
      t.integer :subgrupo_id
    end
    add_foreign_key :grupo_subgrupo, :sip_grupo, column: :grupo_id
    add_foreign_key :grupo_subgrupo, :sip_grupo, column: :subgrupo_id
  end
end
