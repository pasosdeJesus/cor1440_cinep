class DatosiniAcpcataccion < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (1,'SIN INFORMACIÓN', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (2,'Acciones de memoria', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (3,'Acciones de resistencia civil', 'Son acciones explicitas de resistencia activa de la población, normalmente no-violentas, ya sea contra la intervención por la fuerza de un actor armado (cuando la población “confronta” pacíficamente el actor armado que se quiere tomar un poblado), o contra acciones violentas o la amenaza de las mismas.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (4,'Actos culturales y/o deportivos', 'Son aquellos que centran su manifestación en actos expresivos, simbólicos o de actividad física, para respaldar dinámicas sociales a favor de la paz o expresar el rechazo de la violencia. Se incluyen aquí manifestaciones artísticas como los festivales o conciertos, y deportivas como maratones u otros eventos deportivos ', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (5,'Actos de reconciliación', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (6,'Campañas o acciones educativas', 'Se ubican los eventos que se identifican con el fin de desarrollar procesos formativos por medio de los cuales se busca difundir posiciones o alternativas favorables a la paz y la resolución de conflictos. Las manifestaciones de esta finalidad son generalmente de dos tipos: unas limitadas a un grupo reducido de personas con las cuales se desarrollan actividades de tipo pedagógico (como son proyectos educativos, cursos o jornadas de trabajo) y otras que son acciones de carácter global buscando tener un impacto departamental o nacional (campañas).', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (7,'Celebraciones o actos religiosos', 'Se ubican los eventos que se identifican con el fin de desarrollar procesos formativos por medio de los cuales se busca difundir posiciones o alternativas favorables a la paz y la resolución de conflictos. Las manifestaciones de esta finalidad son generalmente de dos tipos: unas limitadas a un grupo reducido de personas con las cuales se desarrollan actividades de tipo pedagógico (como son proyectos educativos, cursos o jornadas de trabajo) y otras que son acciones de carácter global buscando tener un impacto departamental o nacional (campañas).', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (8,'Comunicados colectivos', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (9,'Concertación ciudadana', 'Cuando se dan dinámicas de encuentro, negociación y deliberación, con amplia participación ciudadana, en las que se busca construir consensos que permitan definir acciones de decisión conjunta entre los diversos sectores sociales o amplios grupos de población. (García-Durán, 2006: 340) La concertación no sólo se da en escenarios de debate entre actores sociales y actores estatales para la construcción de políticas, sino también se da entre grupos de comunidades y ciudadanos. En el caso colombiano, los procesos de concertación han llegado a darse entre la sociedad civil y los grupos al margen de la ley.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (10,'Declaraciones de zona de paz', 'Cuando grupos de población o entidades territoriales como los municipios reivindican su autonomía como población civil no combatiente y se declaran, abarcando el territorio en el que viven, como neutrales o no participantes en la confrontación armada y exigen que los actores armados reconozcan su territorio como zona de paz. Esta declaratoria no garantiza necesariamente que los actores armados respeten dicho esfuerzo de las comunidades y grupos por ponerse al margen del conflicto.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (11,'Diálogos y negociaciones', 'Comprenden los diálogos y negociaciones entre actores armados y representantes de la sociedad civil y en algunos casos autoridades locales para encontrar alternativas parciales a situaciones de inseguridad y amenazas que se viven en una determinada zona. Aquí también se incluye procesos de negociación locales de diálogo o de negociación con grupos de milicias o bandas en zonas urbanas, especialmente en grandes ciudades del país. En las negociaciones entre el gobierno y las guerrillas sólo se incluyen aquellos eventos que implican participación activa de la sociedad civil en los mismos.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (12,'Encuentros, foros o seminarios', 'Es una categoría que agrupa los eventos en que la finalidad es propiciar la reflexión y difusión acerca de la paz y permitir la expresión de las diversas posturas al respecto. Pueden ser reuniones de una cantidad de personas que participan de las disertaciones realizadas por expertos como es el caso de los seminarios, o de las discusiones que establece un grupo de invitados como se encuentra en los foros; además se contemplan los encuentros en general que se llevan a cabo como un espacio en el que se comparte diversas experiencias y se puede plantear algunos elementos de tipo organizativo.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (13,'Marchas y concentraciones', 'Son acciones colectivas que hacen presencia temporal en los espacios públicos (marchas, mítines, concentraciones, peregrinaciones, platones, etc) para ejercer presión y protestar en rechazo a la violencia y demandar la búsqueda de soluciones hacia la paz. Generalmente son motivadas por actos específicos de violencia y una vez realizada la acción, la masa se disuelve, aunque normalmente la red de organizaciones subyacentes a la misma sigue operando.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (14,'Organización y coordinación', 'Contempla las acciones que tienen como finalidad la creación, fortalecimiento o articulación de organizaciones que trabajan por la paz. Generalmente se manifiestan como reuniones de coordinación o creación de organizaciones que van a cubrir aspectos de la paz entendida como desarrollo integral de la sociedad.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (15,'Otro tipo de acciones', 'Se ha establecido como un espacio en el que diversas manifestaciones o finalidades, que no están cubiertas por las anteriores, puedan ser recogidas.', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (16,'Paros y huelgas', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (17,'Participación electoral', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (18,'Premios y homenajes', '', '2020-07-13', '2020-07-13', '2020-07-13');
      INSERT INTO acpcataccion (id, nombre, observaciones, fechacreacion, created_at, updated_at)    
        VALUES (19,'Tomas y bloqueos', 'Las tomas se refieren a “la ocupación transitoria de entidades e instituciones públicas, no necesariamente estatales”. Y los bloqueos “son ocupaciones de calles y carreteras para obstaculizar el tránsito de personas y mercancías”. En ambos casos, son protestas en las que se implica el uso de la fuerza (en la mayoría de los casos sin recurso a la violencia) como medio para hacer sentir la presión.', '2020-07-13', '2020-07-13', '2020-07-13');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM acpcataccion WHERE id>=1 AND id<=19;
    SQL
  end
end
