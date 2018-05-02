class CambiaRutaPlantilla < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm SET ruta='Gestion Humana/listado_usuarios_CRECER.ods' WHERE id=18;
      UPDATE heb412_gen_plantillahcm SET ruta='Gerencia de Proyectos/CUADRO_GENERAL_SEGUIMIENTO.ods' WHERE ruta='GerenciaDeProyectos/CUADRO_GENERAL_SEGUIMIENTO.ods';
    SQL
  end

  def down
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm SET ruta='GerenciaDeProyectos/CUADRO_GENERAL_SEGUIMIENTO.ods' WHERE ruta='Gerencia de Proyectos/CUADRO_GENERAL_SEGUIMIENTO.ods';
      UPDATE heb412_gen_plantillahcm SET ruta='Plantillas_CRECER/listado_usuarios_CRECER.ods' WHERE id=18;
    SQL
  end

end
