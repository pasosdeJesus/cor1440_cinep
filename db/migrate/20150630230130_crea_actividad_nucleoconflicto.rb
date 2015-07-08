class CreaActividadNucleoconflicto < ActiveRecord::Migration
  def change
    create_join_table :actividad, :nucleoconflicto, {
      table_name: 'actividad_nucleoconflicto' 
    }
    add_foreign_key :actividad_nucleoconflicto, :cor1440_gen_actividad, column: :actividad_id
    add_foreign_key :actividad_nucleoconflicto, :nucleoconflicto, column: :nucleoconflicto_id
  end
end
