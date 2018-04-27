class AgregaTipocontratoProyectofinancieroUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :proyectofinanciero_usuario, :tipocontrato_id, :integer, 
      default: 1
    add_foreign_key :proyectofinanciero_usuario, :tipocontrato
  end
end
