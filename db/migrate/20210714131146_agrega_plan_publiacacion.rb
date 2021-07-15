class AgregaPlanPubliacacion < ActiveRecord::Migration[6.1]
  def change
    add_column :publicacion, :tipoproductopf_id, :integer
    add_foreign_key :publicacion, :tipoproductopf

    add_column :cor1440_gen_actividad, :productopf_id, :integer
    add_foreign_key :cor1440_gen_actividad, :productopf,
      column: 'productopf_id'
  end
end
