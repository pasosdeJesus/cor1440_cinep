class AsociaGrupoProcesogh < ActiveRecord::Migration[5.2]
  def up
    add_column :sip_grupo, :procesogh_id, :integer, default: 1
    add_foreign_key :sip_grupo, :procesogh
    execute <<-SQL
      UPDATE sip_grupo SET  procesogh_id='2';
      UPDATE sip_grupo SET  procesogh_id='3' 
        WHERE cn LIKE 'Area%' OR cn LIKE 'Linea%' 
        OR cn LIKE 'Coordinador%'
        OR cn LIKE 'Tutor%';
      UPDATE sip_grupo SET  procesogh_id='4' 
        WHERE cn LIKE 'CoordinadorGerencia%' 
        OR cn IN ('Direccion');
      UPDATE sip_grupo SET  procesogh_id='1'
        WHERE cn IN ('Desactivados', 'Usuarios');
    SQL
  end

  def down
    remove_foreign_key :sip_grupo, :procesogh
    remove_column :sip_grupo, :procesogh_id, :integer
  end
end
