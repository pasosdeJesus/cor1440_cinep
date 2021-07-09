class ActividadPublicacionproducto < ActiveRecord::Migration[6.1]
  def change
    remove_column :publicacion, :fechacreacion, :date
    remove_column :publicacion, :fechadeshabilitacion, :date
    add_column :cor1440_gen_actividad, :publicacionproducto_id, :integer
    add_index :cor1440_gen_actividad, :publicacionproducto_id
    add_foreign_key :cor1440_gen_actividad, :publicacion, 
      column: :publicacionproducto_id
  end
end
