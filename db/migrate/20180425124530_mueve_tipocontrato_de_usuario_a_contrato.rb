# encoding: utf-8

class MueveTipocontratoDeUsuarioAContrato < ActiveRecord::Migration[5.2]
  def up
    add_column :contrato, :tipocontrato_id, :integer, null: false, 
      default: 1
    add_foreign_key :contrato, :tipocontrato
    execute <<-SQL
      UPDATE contrato SET tipocontrato_id=usuario.tipocontrato_id 
        FROM usuario WHERE usuario.contrato_id=contrato.id;
    SQL
    remove_foreign_key :usuario, :tipocontrato
    remove_column :usuario, :tipocontrato_id
  end

  def down
    add_column :usuario, :tipocontrato_id, :integer
    add_foreign_key :usuario, :tipocontrato
    execute <<-SQL
      UPDATE usuario SET tipocontrato_id=contrato.tipocontrato_id 
        FROM contrato WHERE usuario.contrato_id=contrato.id;
    SQL
    remove_foreign_key :contrato, :tipocontrato
    remove_column :contrato, :tipocontrato_id
  end
end
