class PlantillasCompromiso1 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    INSERT INTO heb412_gen_plantilladoc (id, ruta, fuente, licencia, vista, nombremenu) 
      VALUES (1, '/Sistemas Integrados de Gestión/1 Gestión de Calidad/07 Seguimiento y control/3 Formatos/RE-SC-07 Ficha de Seguimiento y Control.odt',
      'Gerencia de Proyectos', '', 'Compromiso Institucional',
      'RE-SC-07 Ficha de Seguimiento y Control');
    INSERT INTO heb412_gen_plantilladoc (id, ruta, fuente, licencia, vista, nombremenu) 
      VALUES (2, '/Gerencia de Proyectos/Carta_Encuesta_Calidad_2018.odt',
      'Gerencia de Proyectos', '', 'Compromiso Institucional',
      'Carta Encuesta de Calidad 2018');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM heb412_gen_plantilladoc WHERE id IN ('1', '2');
    SQL
  end
end
