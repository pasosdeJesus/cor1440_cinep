class CreateJoinTableActividadObjetivopf < ActiveRecord::Migration[5.1]
  def change
    create_table :cor1440_gen_actividad_objetivopf, id: false do |t| 
      t.integer :actividad_id
      t.integer :objetivopf_id
    end
    add_foreign_key :cor1440_gen_actividad_objetivopf, :cor1440_gen_actividad,
      column: :actividad_id
    add_foreign_key :cor1440_gen_actividad_objetivopf, :cor1440_gen_objetivopf,
      column: :objetivopf_id
  end
end
