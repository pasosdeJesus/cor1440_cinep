class AdaptaReportesUnaActividad < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE heb412_gen_plantilladoc SET 
        ruta='Actividades/reporte_una_actividad.odt' WHERE id='5';
      UPDATE heb412_gen_plantillahcr SET
        ruta='Actividades/reporte_una_actividad.ods' WHERE id='5';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE heb412_gen_plantilladoc SET 
        ruta='plantillas/Reporte_actividades.odt' WHERE id='5';
      UPDATE heb412_gen_plantillahcr SET
        ruta='plantillas/reporte_una_actividad.ods' WHERE id='5';
    SQL
  end
end
