class IndicadoresPublicacion < ActiveRecord::Migration[6.1]
  FSEMESTRE = [
    ['2021-01-01', '2021-06-30'],
    ['2021-07-01', '2021-12-31'],
    ['2022-01-01', '2022-06-30'],
    ['2022-07-01', '2022-12-31'],
    ['2023-01-01', '2023-06-30'],
    ['2023-07-01', '2023-12-31']
  ]

  def up
    idmind = 27
    idpmind = 111
    actr = 340
    (41..73).each do |idind|
      if Cor1440Gen::Indicadorpf.where(id: idind).count == 0
        next
      end
      ind = Cor1440Gen::Indicadorpf.find(idind)
      r = ind.indicador.match(/.*\(([0-9]*)\).*/)
      if !r.nil? && r.size == 2
        meta = r[1].to_i
        
        execute <<-SQL
          INSERT INTO public.cor1440_gen_mindicadorpf 
          (id, proyectofinanciero_id, indicadorpf_id, formulacion, 
          frecuenciaanual, created_at, updated_at, 
          descd1, descd2, descd3, meta, medircon, funcionresultado) VALUES 
          (#{idmind}, 21, #{idind}, NULL, 
          '2', '2021-08-12 17:03:22.108158', '2021-08-12 17:03:22.108158', 
          NULL, NULL, NULL, NULL, 1, 'cuenta(Actividades_contribuyentes)');
          INSERT INTO public.cor1440_gen_actividadpf_mindicadorpf
            (actividadpf_id, mindicadorpf_id)
            VALUES (#{actr},  #{idmind});
        SQL
        actr += 1
        case actr
        when 352
          actr = 360
        when 370
          actr = 380
        end
        sem = 1
        (idpmind..idpmind+5).each do |idp|
          mp = ((sem/6.0)*meta).round
          execute <<-SQL
            INSERT INTO public.cor1440_gen_pmindicadorpf (id, mindicadorpf_id, 
            finicio, ffin, 
            restiempo, dmed1, dmed2, dmed3, datosmedicion, resind, 
            meta, resindicador, porcump, analisis, acciones, responsables, 
            plazo, fecha, urlev1, urlev2, urlev3, rutaevidencia) 
            VALUES (#{idp}, #{idmind}, 
            '#{FSEMESTRE[0][0]}', '#{FSEMESTRE[sem-1][1]}', 
            '#{sem} SEMESTRE(S)', NULL, NULL, NULL, NULL, NULL, 
            #{mp}, NULL, NULL, NULL, NULL, NULL, 
            NULL, NULL, NULL, NULL, NULL, NULL);
          SQL
          sem += 1
        end
      else
        puts "Error: No se reconoció meta en indicador "\
          "#{ind.presenta_codigo} #{ind.indicador}.  "
      end
      idmind += 1
      idpmind += 6
    end
  end

  def down
    execute <<-SQL
      DELETE FROM public.cor1440_gen_pmindicadorpf WHERE
        mindicadorpf_id>=27 AND mindicadorpf_id<=(27 + 32) ;
      DELETE FROM public.cor1440_gen_mindicadorpf WHERE
        id>=27 AND id<=(27 + 32) ;
    SQL
  end
end
