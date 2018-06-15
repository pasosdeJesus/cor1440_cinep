class EliminaOficinaProyectofinanciero < ActiveRecord::Migration[5.2]
  def up
    remove_foreign_key :oficina_proyectofinanciero, :cor1440_gen_proyectofinanciero#, column: :proyectofinanciero_id
    remove_foreign_key :oficina_proyectofinanciero, :sip_oficina#, column: :oficina_id
    drop_join_table :oficina, :proyectofinanciero, {
      table_name: 'oficina_proyectofinanciero' 
    }
  end
end
