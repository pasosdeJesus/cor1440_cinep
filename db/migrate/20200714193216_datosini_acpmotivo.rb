class DatosiniAcpmotivo < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (1,'SIN INFORMACIÓN', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (2,'Amenazas y extorsiones', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (3,'Asesinatos, masacres y desapariciones', 'Cuando el motivo de la acción colectiva es la reacción a un homicidio, masacre (3 o más muertos en una misma acción) o desaparición forzada, y cuyo blanco normalmente    son líderes comunitarios, sociales o políticos. En algunos casos es explícito quien es el responsable de la acción violenta, información que se registra en la columna de “adversario”.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (4,'Ataques a población y/o bienes civiles', 'Cuando el motivo de la acción colectiva es la reacción al ataque de un actor armado a una población (toma o incursión armada en la misma) o un atentado contra la infraestructura o bienes civiles (denominados por la prensa en muchos casos como actos de terrorismo). Son acciones que implican una infracción al Derecho Internacional Humanitario.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (5,'Búsqueda de alternativas para la paz', 'Cuando el motivo de la acción colectiva es discutir, formular o implementar propuestas, estrategias o alternativas que buscan afianzar la paz (en términos más amplios que un proceso de negociación).', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (6,'Celebración de un motivo público', 'Cuando el motivo de la acción colectiva es realizar un acto público para celebrar una fecha que tiene especial significación regional, departamental, o nacional (Ej. Independencia Nacional, etc.).', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (7,'Combates y disputa del territorio', 'Cuando el motivo de la acción colectiva es la reacción ante la situación crítica que se genera y afecta a la población civil en razón de enfrentamientos y acciones armadas entre la fuerza pública y un grupo ilegal.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (8,'Concertación y organizaciones para la paz (en apoyo a procesos de paz)', 'Cuando el motivo de la acción colectiva es buscar la confluencia y organización de sectores sociales a favor de la paz en función de dar respaldo a procesos de paz, ya sean eventuales o en curso', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (9,'Concertación y organización para la paz', 'Cuando el motivo de la acción colectiva es buscar la confluencia y organización de sectores sociales, generalmente para impulsar una alternativa o proyecto por la paz.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (10,'Conmemoraciones de hechos de paz', 'Cuando el motivo de la acción colectiva es conmemorar un aniversario de una experiencia por la paz que tiene creciente validez dentro del público y que aporta en la búsqueda de alternativas de violencia.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (11,'Conmemoraciones de hechos de violencia', 'Cuando el motivo de la acción colectiva es conmemorar algún hecho significativo de violencia, para volver a llamar la atención sobre el mismo en un contexto de persistente violencia.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (12,'Consolidación de acuerdos de paz', 'Cuando el motivo de la acción colectiva es respaldar y consolidar los acuerdos alcanzados como resultado de un proceso de diálogo y negociación.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (13,'Contra una política estatal de orden público', 'Cuando el motivo de la acción colectiva es rechazar una política específica de orden público impulsada por el gobierno y adelantada por las fuerzas militares, la policía u organismos de seguridad del Estado.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (14,'Debate y/o apoyo a proceso de paz o negociación', 'Cuando el motivo de la acción colectiva es respaldar o debatir procesos de acercamiento y diálogo con actores armados.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (15,'Exigencia cumplimiento de acuerdos', 'Cuando el motivo de la acción colectiva es demandar del Estado el cumplimiento de los acuerdos de paz que no se viene implementando adecuadamente.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (16,'Impulso de diálogos o negociaciones locales y regionales de paz', 'Cuando el motivo de la acción colectiva es promover procesos de acercamiento y diálogo con los actores armados en función de un acuerdo humanitario, un diálogo regional o una negociación.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (17,'Inseguridad y violencia generalizada', 'Cuando el motivo de la acción colectiva es una situación de inseguridad que se genera por la dinámica del conflicto armado en una determinada región (se excluye la situación de inseguridad urbana por atracos).', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (18,'Otras violencias', 'Cuando el motivo de la acción colectiva es rechazar otras formas de violencia que se padecen distintas de las originadas en el conflicto político, como el caso de la violencia doméstica u otras violencias que no hacen parte de las categorías anteriores.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (19,'Otros motivos', 'Cuando el motivo de la acción colectiva es otra razón a favor de la paz que no cabe dentro de las planteadas hasta el momento.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (20, 'Por conexión con evento internacional', 'Cuando el motivo de la acción colectiva es realizar un acto público para celebrar un hecho que hace parte de una celebración a nivel internacional.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (21, 'Presencia y accionar de un grupo guerrillero', 'Cuando el motivo de la acción colectiva es rechazar explícitamente una situación de tensión, inseguridad y violencia (como son amenazas, intentos de secuestro, retenes ilegales, extorsiones, etc., pero excluyendo asesinatos, masacres y secuestros) que se produce por el accionar de los grupos guerrilleros.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (22, 'Presencia y accionar de un grupo paramilitar', 'Cuando el motivo de la acción colectiva es rechazar explícitamente una situación de tensión, inseguridad y violencia (como son amenazas, bloqueos, hostigamientos y otras tácticas para generar terror, etc., pero excluyendo asesinatos, masacres y secuestros) que se produce por el accionar de un grupo paramilitar o de las bandas criminales (Bacrim). ', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (23, 'Promoción de la paz', 'Cuando el motivo de la acción colectiva es realizar acciones que favorecen una posición positiva con relación a la construcción de la paz, o promover acciones pedagógicas en esa dirección en forma abstracta o general (sin explicitar cuál es el contenido de la misma).', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (24, 'Represión y violación de DDHH', 'Cuando el motivo de la acción colectiva es denunciar acciones represivas y/o violaciones de los derechos humanos por parte de la fuerza pública. Una violación de derechos humanos debe entenderse como “toda conducta positiva o negativa mediante la cual un agente directo o indirecto del Estado vulnera, en cualquier persona y en cualquier tiempo, uno de los derechos enunciados y reconocidos por los instrumentos que conforman el Derecho Internacional de los Derechos Humanos”.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpmotivo (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (25, 'Secuestros y retenciones', 'a) Cuando el motivo de la acción colectiva es rechazar el que una de las organizaciones armadas ilegales retenga una persona con fines económicos o políticos (se incluyen los soldados o policías retenidos en enfrentamientos con la guerrilla). (García-Durán, 2006: 341) 
b) Es la privación de la libertad de una persona civil por parte de una organización insurgente, ya con el fin de obligarla a entregar una suma de dinero destinada a la financiación de dicha organización o de sus acciones bélicas, ya con el fin de enviar un mensaje, de producir un impacto en la opinión pública o impedir una determinada actividad de la víctima.', '2020-07-13', '2020-07-13', '2020-07-13');
      SELECT setval('acpmotivo_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM acpmotivo WHERE id>=1 AND id<=25;
    SQL
  end
end

