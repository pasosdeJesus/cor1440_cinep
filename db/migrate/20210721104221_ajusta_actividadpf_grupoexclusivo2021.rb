class AjustaActividadpfGrupoexclusivo2021 < ActiveRecord::Migration[6.1]
  def up
    stciv_id = Sip::Grupo.where(cn: 'stciv_cinep').take.id
    execute <<-SQL
      -- STCIV con O4.A2.5
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo
        (actividadpf_id, grupo_id) VALUES (348, #{stciv_id});

      -- Líneas con artículos y libros
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo
        (actividadpf_id, grupo_id)
        ( SELECT a.id, g.id FROM
          cor1440_gen_actividadpf AS a JOIN sip_grupo AS g ON
          a.id IN (340,341,342) AND
          g.id IN (64, 66, 72)
        );
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo
        (actividadpf_id, grupo_id)
        ( SELECT a.id, g.id FROM
          cor1440_gen_actividadpf AS a JOIN sip_grupo AS g ON
          a.id IN (360,361,362) AND
          g.id IN (64, 66, 70, 72, 74)
        );
      INSERT INTO public.cor1440_gen_actividadpf_grupoexclusivo
        (actividadpf_id, grupo_id)
        ( SELECT a.id, g.id FROM
          cor1440_gen_actividadpf AS a JOIN sip_grupo AS g ON
          a.id IN (381,382) AND
          g.id IN (62, 64, 66, 72, 74)
        );
    SQL
  end
  def down
    stciv_id = Sip::Grupo.where(cn: 'stciv_cinep').take.id
    execute <<-SQL
      DELETE FROM public.cor1440_gen_actividadpf_grupoexclusivo
        WHERE  actividadpf_id=348 AND grupo_id= #{stciv_id};

      DELETE FROM public.cor1440_gen_actividadpf_grupoexclusivo
          WHERE actividadpf_id IN (340,341,342) AND
          grupo_id IN (64, 66, 72)
      ;
      DELETE FROM public.cor1440_gen_actividadpf_grupoexclusivo
          WHERE actividadpf_id IN (360,361,362) AND
          grupo_id IN (64, 66, 70, 72, 74)
      ;
      DELETE FROM public.cor1440_gen_actividadpf_grupoexclusivo
          WHERE actividadpf_id IN (381,382) AND
          grupo_id IN (62, 64, 66, 72, 74)
      ;
    SQL
  end
end
