class OficinaProyectofinanciero < ActiveRecord::Migration[4.2]
  def change
    create_join_table :oficina, :proyectofinanciero, {
      table_name: 'oficina_proyectofinanciero' 
    }
    add_foreign_key :oficina_proyectofinanciero, :sip_oficina, column: :oficina_id
    add_foreign_key :oficina_proyectofinanciero, :cor1440_gen_proyectofinanciero, column: :proyectofinanciero_id
  end
end
