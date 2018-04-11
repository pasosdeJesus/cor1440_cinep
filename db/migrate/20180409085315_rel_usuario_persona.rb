class RelUsuarioPersona < ActiveRecord::Migration[5.1]
  def up
    add_column :usuario, :persona_id, :integer
    add_foreign_key :usuario, :sip_persona, column: :persona_id
    execute <<-SQL
      INSERT INTO sip_persona (id, nombres, apellidos, sexo) 
        (SELECT id, nombres, apellidos, 'S' FROM usuario);
      UPDATE usuario SET persona_id=id;
    SQL
  end

  def down
    UPDATE usuario SET persona_id=NULL;
    DELETE FROM sip_persona;
    remove_foreign_key :usuario, :sip_persona, column: :persona_id
    remove_column :usuario, :persona_id, :integer
  end
end
