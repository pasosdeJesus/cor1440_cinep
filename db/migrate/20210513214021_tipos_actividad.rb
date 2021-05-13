class TiposActividad < ActiveRecord::Migration[6.1]

  def up
    p = Cor1440Gen::Proyectofinanciero.create!(
      id: 22,
      nombre: 'TIPOS DE ACTIVIDADES COMUNES',
      fechainicio: '2021-01-01',
      fechacierre: nil,
      referencia: 'TIPOS DE ACTIVIDADES COMUNES',
      referenciacinep: 'TIPOS DE ACTIVIDADES COMUNES',
      fechaformulacion: '2020-10-10',
      dificultad: 'M',
      estado: 'E',
      monto: 0,
      anotacionesdb: ''
    )

    execute <<-SQL

      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (41, 22, 'OG.', 'Sistematizar los tipos de actividades más comunes del CINEP/PPP.');

      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (41, 22, 41, 'ACO', 'Acompañamiento');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (42, 22, 41, 'FOR', 'Formación');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (43, 22, 41, 'INV', 'Investigación');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (44, 22, 41, 'INC', 'Incidencia');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (45, 22, 41, 'COM', 'Comunicación');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (46, 22, 41, 'GES', 'Gestión'); 
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (47, 22, 41, 'OTR', 'Otros');

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (16, 22, 'AA1', 'Acompañamiento: Reuniones e Intercambios con Actores de Sentido', '', 47, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (17, 22, 'AA2', 'Acompañamiento: ', '', 47, NULL, NULL, NULL);

      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (101, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (1, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (61, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (69, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (4, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (9, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (10, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (103, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (105, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (62, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (74, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (64, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (66, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (72, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (70, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (63, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (75, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (65, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (67, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (73, 21);
      INSERT INTO public.grupo_proyectofinanciero (grupo_id, proyectofinanciero_id) VALUES (71, 21);
    SQL
  end

  def down
    excute <<-SQL
      DELETE FROM public.grupo_proyectofinanciero 
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_actividadpf
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_resultadopf
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_indicadorpf
        WHERE proyectofinanciero_id=21;
      DELETE FROM public.cor1440_gen_objetivopf
        WHERE proyectofinanciero_id=21;
    SQL
    p = Cor1440Gen::Proyectofinanciero.where(id: 21)
    if p.count == 1
      p[0].destroy
    end
  end
end
end
