class HomologaGruposT2021 < ActiveRecord::Migration[6.1]
  def up
    lce = Sip::Grupo.where(cn: 'LineaConflictoYEstado').take
    lm = Sip::Grupo.where(cn: 'LineaMediacionYReconciliacion').take
    li = Sip::Grupo.where(cn: 'LineaIniciativasDePaz').take

    lcp = Sip::Grupo.where(cn: 'LineaCulturaDePazYCiudadanias').take
    lep = Sip::Grupo.where(cn: 'LineaEscuelaDePazYConvivenciaCiudadana').take

    lgt = Sip::Grupo.where(cn: 'LineaGestionDelTerritorioEnElPacifico').take
    
    lms = Sip::Grupo.where(cn: 'LineaMovimientosSociales').take
    ldt = Sip::Grupo.where(cn: 'LineaDerechoALaTierraYAlTerritorio').take

    lei = Sip::Grupo.where(cn: 'LineaEducacionIntercultural').take

    ldh = Sip::Grupo.where(cn: 'LineaDerechosHumanosYDerechoInternacionalHumanitario').take
    homologa = {
      62 => [lce.id, lm.id, li.id], # Conflicto y Paz 
      64 => [lcp.id, lep.id], # Educación para la Ciudadanía y la Paz 
      66 => [lgt.id], # Gestión del Territorio 
      70 => [lms.id, ldt.id], # Movimientos Sociales Tierra y Territorio
      72 => [lei.id], #  Interculturalidad
      74 => [ldh.id] # Derechos Humanos y Violencia Política
    }

    homologa.each do |n_id, ant_ids|
      puts "n_id=#{n_id}, ant_ids=#{ant_ids.to_s}"

      Cor1440Gen::Actividad.where("fecha>='2021-01-01'").each do |a|
        if !a.grupo_ids.include?(n_id) && (a.grupo_ids & ant_ids) != []
          ActividadGrupo.create!(actividad_id: a.id,
                                 grupo_id: n_id)
        end
      end
      ::Regiongrupo.habilitados.where(grupo_id: ant_ids).each do |rg|
          rg.grupo_id = n_id
          rg.save!(validate: false)
      end
      Sip::Actorsocial.habilitados.each do |acs|
        if !acs.grupo_ids.include?(n_id) && (acs.grupo_ids & ant_ids) != []
          ActorsocialGrupo.create!(actorsocial_id: acs.id,
                                 grupo_id: n_id)
        end
      end
      Cor1440Gen::Proyectofinanciero.where("fechacierre>='2021-01-01'").each do |p|
        if !p.grupo_ids.include?(n_id) && (p.grupo_ids & ant_ids) != []
          GrupoProyectofinanciero.create!(proyectofinanciero_id: p.id,
                                 grupo_id: n_id)
        end
      end

    end # homologa
  end # up

  def down
  end
end
