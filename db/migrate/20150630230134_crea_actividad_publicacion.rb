class CreaActividadPublicacion < ActiveRecord::Migration
  def change
    create_join_table :actividad, :publicacion, {
      table_name: 'actividad_publicacion' 
    }
    add_foreign_key :actividad_publicacion, :cor1440_gen_actividad, column: :actividad_id
    add_foreign_key :actividad_publicacion, :publicacion, column: :publicacion_id
  end
end
