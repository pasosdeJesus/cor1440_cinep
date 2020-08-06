include Sip::MigracionHelper

class CompletaLlavesCotejacionesAcp < ActiveRecord::Migration[6.0]
  def up
    cambiaCotejacion('acpcataccion', 'nombre', 500, 'es_co_utf_8')
    cambiaCotejacion('acpcatmotivo', 'nombre', 500, 'es_co_utf_8')
    cambiaCotejacion('acpcobertura', 'nombre', 500, 'es_co_utf_8')
    cambiaCotejacion('acpestrategia', 'nombre', 500, 'es_co_utf_8')
    cambiaCotejacion('acpformap', 'nombre', 500, 'es_co_utf_8')
    cambiaCotejacion('acpmotivo', 'nombre', 500, 'es_co_utf_8')
    cambiaCotejacion('acppapel', 'nombre', 500, 'es_co_utf_8')

    change_column :acplugar, :acp_id, :integer, null: false
    change_column :acplugar, :departamento_id, :integer, null: false
    add_foreign_key :acplugar, :acp

    change_column :acpfuente, :acp_id, :integer, null: false
    change_column :acpfuente, :fuente, :string, limit: 127, null: false
    change_column :acpfuente, :ffuente, :date, null: false
    add_foreign_key :acpfuente, :acp

    add_foreign_key :acpactor, :acp
  end
  def down
    remove_foreign_key :acplugar, :acp
    remove_foreign_key :acpfuente, :acp
  end
end
