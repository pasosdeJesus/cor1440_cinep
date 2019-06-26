# encoding: UTF-8

class ConvierteContacto < ActiveRecord::Migration[6.0]
  def up
    numa = 0
    Sip::Actorsocial.all.each do |a|
      numa+=1
      puts numa
      nom = 'N'
      ape = 'N'
      if a.personacontacto
        na = a.personacontacto.strip
        if na != ''
          na = na.gsub(/  */," ")
          p = na.split(' ')
          if p.count >= 4
            nom = p[0] + ' ' + p[1]
            i=2
            ape = ''
            while (i<p.count) do
              ape += p[i]
              i += 1
            end
          elsif p.count == 3
            nom = p[0]
            ape = p[1] + ' ' + p[2]
          elsif p.count == 2
            nom = p[0]
            ape = p[1]
          else # p.count == 1
            nom = p[0]
          end
        end
      end
      p = Sip::Persona.create(nombres: nom, apellidos: ape,
                              sexo: 'S')
      sap = Sip::ActorsocialPersona.create(persona_id: p.id,
                                           actorsocial_id: a.id,
                                           perfilactorsocial_id: 1,
                                           correo: a.correo,
                                           cargo: a.cargo)
    end
  end

  def down
    execute <<-SQL
      UPDATE sip_actorsocial SET personacontacto = sip_persona.nombres + ' ' +
        sip_persona.apellidos,
        correo = sip_actorsocial_persona.correo,
        cargo = sip_actorsocial_persona.cargo
        FROM sip_actorsocial_persona, sip_persona WHERE 
        sip_actorsocial.id = sip_actorsocial_persona.actorsocial_id
        AND sip_persona.id = sip_actorsocial_persona.persona_id;
    SQL
  end
end
